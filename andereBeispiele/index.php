<?php

$debug = true;

$time_start = microtime(true);

require_once 'log.class.php';
require_once 'vendor/autoload.php';

$log = new Logger('saalplan-api.log');

$log->log("Request from " . $_SERVER['REMOTE_ADDR']);

$dotenv = file(__DIR__ . '/.env', FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES);
foreach ($dotenv as $line) {
    list($name, $value) = explode('=', $line, 2);
    $_ENV[$name] = trim($value);
}

$request = $_SERVER['REQUEST_URI'];
$request = parse_url($request, PHP_URL_PATH);
$request = str_replace('/saalplan-api', '', $request);

$query = [];
parse_str($_SERVER['QUERY_STRING'], $query);

$postData = file_get_contents('php://input');
$postParams = [];
if (!empty($postData)) {
    $log->log("postdata:\n$postData");
    $postParams = json_decode($postData);
    if (json_last_error() !== JSON_ERROR_NONE) {
        $log->log("json error: " . json_last_error_msg());
        echo json_encode(['status' => 'error', 'message' => 'Invalid JSON data']);
        exit;
    }
}

$routes = [
    '/' => 'home',
    '/check-reservation' => 'checkReservation',
    '/save-reservation' => 'saveReservation',
    '/saalplan/(\d+)' => 'saalplan',
];

if ($debug === true) {
    $log->log($request);
    $log->logData($query);
    $log->logData($postParams);
}

require __DIR__ . '/../../config/saalplan_config.inc.php';
$client = new MongoDB\Client("mongodb://$mongo_username:$mongo_password@$mongo_host:$mongo_port/?tls=true&retryWrites=false");
$collection = $client->{$mongo_database}->col_saalplan;

function hasCookie() {
    global $log;
    if (!empty($_SERVER['HTTP_AUTHORIZATION'])) {
        $log->log("Already authorized: " . $_SERVER['HTTP_AUTHORIZATION']);
    } else {
        $log->log("No auth, requesting new token");

        $data = [
            'username' => $_ENV['VITE_WBS_USERNAME'],
            'password' => $_ENV['VITE_WBS_PASSWORD'],
            'grant_type' => 'password'
        ];

        $headers = [
            'Authorization' => $_ENV['VITE_AUTHORIZATION'],
            'Content-Type' => 'application/x-www-form-urlencoded'
        ];

        $response = http_request('POST', $_ENV['VITE_ENDPOINT_TOKEN'], $headers, $data);
        $tokenData = json_decode($response, true);

        if ($tokenData) {
            setcookie('refresh_token', $tokenData['refresh_token'], time() + ($tokenData['refresh_expires_in'] * 600000), '/', '', true, true);
            $_SERVER['HTTP_AUTHORIZATION'] = 'Bearer ' . $tokenData['access_token'];
            $log->log($_SERVER['HTTP_AUTHORIZATION']);
        } else {
            header('Content-Type: application/json');
            echo json_encode(['error' => 'Authentication error by hasCookie']);
            http_response_code(500);
            exit;
        }
    }
}

function http_request($method, $url, $headers = [], $data = null) {
    $options = [
        'http' => [
            'method' => strtoupper($method),
            'header' => '',
            'content' => is_array($data) ? http_build_query($data) : $data
        ]
    ];

    foreach ($headers as $key => $value) {
        $options['http']['header'] .= "$key: $value\r\n";
    }

    $context = stream_context_create($options);
    return file_get_contents($url, false, $context);
}

function saalplan($params) {
    global $log;

    $showId = $params['id'];
    $headers = [
        'accept' => 'application/svg+xml',
        'Authorization' => $_SERVER['HTTP_AUTHORIZATION']
    ];

    $response = http_request('GET', "https://test-eras.stage-entertainment.de/shows/{$showId}/floorplan?hidePrices=0&withoutJS=0&withPromotions=false", $headers);

    header('Content-Type: application/json');
    echo json_encode($response);
    http_response_code(200);
}

if (preg_match('/\/saalplan\/(\d+)/', $request, $matches)) {
    hasCookie();
    saalplan(['id' => $matches[1]]);
} elseif (array_key_exists($request, $routes)) {
    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        call_user_func($routes[$request], $postParams);
    } else {
        call_user_func($routes[$request], $query);
    }
} else {
    header("HTTP/1.0 404 Not Found");
    echo json_encode(['status' => 'error', 'message' => 'Page not found']);
}

$time_end = microtime(true);
$time = $time_end - $time_start;

$log->log("Processing took $time seconds");

exit;

function home() {
    echo json_encode(['status' => 'success', 'message' => 'Welcome to Saalplan API']);
}

function checkReservation($requestData) {

    global $log, $collection;

    $requestData = json_decode(file_get_contents('php://input'), true);

     if (!empty($requestData['ameropaWebID'])) {
        $id = $requestData['ameropaWebID'];
    } elseif (!empty($requestData['reservation-id'])) {
        $id = $requestData['reservation-id'];
    } else {
        $log->log("ameropaWebId missing.");
        echo json_encode(['status' => 'error', 'message' => 'Missing parameter', 'error' => 'reservation id / ameropa web id missing']);
        return;
    } 

    $filter = ['ameropaWebID' => $id];
    $options = ['sort' => ['createdat' => -1]];
    $document = $collection->findOne($filter, $options);
  
     try {
        if (!empty($collection)) {
            $document = $collection->findOne($filter, $options);

            if ($document) {

                $jsonDocument = json_encode($document);
                
                $log->log("MongoDB findOne result: " . $jsonDocument);

                echo json_encode(['status' => 'success', 'document' => $document]);
            } else {
                $log->log("No document found for filter: " . json_encode($filter));
                echo json_encode(['status' => 'error', 'message' => 'No document found']);
            }
        } else {
            $log->log("Collection is empty or not defined.");
            echo json_encode(['status' => 'error', 'message' => 'Collection is empty or not defined']);
        }
    } catch (Exception $e) {
        $log->log("EXCEPTION:\n" . $e->getMessage());
        echo json_encode(['status' => 'error', 'message' => 'Failed to find document', 'error' => $e->getMessage()]);
    } 
}



function generateReservationId() {
    $characters = '123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz';
    $charactersLength = strlen($characters);
    $reservationId = '1';
    for ($i = 1; $i < 16; ++$i) {
        $reservationId .= $characters[rand(0, $charactersLength - 1)];
    }
    return $reservationId;
}

function saveReservation($requestData) {

    global $log, $collection;

    $reservationId = generateReservationId();
    $requestData->ameropaWebID = $reservationId;

    try {
        if (!empty($collection)) {
            $insertResult = $collection->insertOne($requestData);
        }
    } catch (Exception $e) {
        $log->log("EXCEPTION:\n" . $e->getMessage());
        echo json_encode(['status' => 'error', 'message' => 'Failed to save reservation', 'error' => $e->getMessage()]);
        return;
    }

    echo json_encode(['status' => 'success', 'message' => 'Reservation saved', 'reservationId' => $reservationId]);
}
?>