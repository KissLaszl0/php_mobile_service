<?php



use function PHPSTORM_META\type;
//URl Parse

$method = $_SERVER["REQUEST_METHOD"];
$parsed = parse_url($_SERVER['REQUEST_URI']);
$path = $parsed['path'];


// Routing 
$routes = [
    'GET' => [
        '/' => 'home',
        '/contact' => 'contact'
    ],
    'POST' => [],
];
//Hadler Fuction für routen

$handlerFunction = $routes[$method][$path] ?? "notFoundHandler";

$handlerFunction();
// get Path with id function for login
function getPathWithId($url)
{
    $parsed = parse_url($url);
    if (!isset($parsed['query'])) {
        return $url;
    }
    $queryParams = [];
    parse_str($parsed['query'], $queryParams);
    //  return $parsed['path'] . "?id=" . $queryParams['id'];
    return $parsed['path'];
}


// compile Template Function für seiten concatination
function compileTemplate($filePath, $params = []): string
{
    ob_start();
    require __DIR__ . "/view/" . $filePath;
    return ob_get_clean();
}

function seiteType($id)
{
    $pdo = getConnectionPDO();
    $statement = $pdo->prepare('SELECT * FROM type WHERE herstellerID = ?');
    $statement->execute([$id]);
    $result = $statement->fetchAll(PDO::FETCH_ASSOC);

    return $result;
}
function seitePreise($id)
{
    $pdo = getConnectionPDO();
    $statement = $pdo->prepare('SELECT * FROM preise WHERE type = ?');
    $statement->execute([$id]);
    $result = $statement->fetchAll(PDO::FETCH_ASSOC);

    return $result;
}
function getHerstellers()
{
    $pdo = getConnectionPDO();
    $statement = $pdo->prepare('SELECT * FROM hersteller');
    $statement->execute();
    $herstellers = $statement->fetchAll(PDO::FETCH_ASSOC);

    return $herstellers;
}


function home()
{

    if (isset($_GET['type'])){
        $topDinamicList = compileTemplate('herstellers.phtml', [
            'herstellers' => seiteType($_GET['type'])
        ]);
        $mainTopList = compileTemplate('maintop-list.phtml',[
            'herstellers' => seiteType($_GET['type'])
        ]);
    }else if(isset($_GET['preise'])){
        $topDinamicList = compileTemplate('herstellers.phtml', [
            'herstellers' => seitePreise($_GET['preise'])
        ]);
        $mainTopList = compileTemplate('maintop-list.phtml',[
            'herstellers' => seitePreise($_GET['preise'])
        ]);
    }else 
    {
        $topDinamicList = compileTemplate('herstellers.phtml', [
            'herstellers' => getHerstellers()
        ]);
        $mainTopList = compileTemplate('maintop-list.phtml',[
            'herstellers' => getHerstellers()
        ]);
    }


    $pdo = getConnectionPDO();
    $statement = $pdo->prepare('SELECT * FROM hersteller');
    $statement->execute();
    $herstellers = $statement->fetchAll(PDO::FETCH_ASSOC);
    
   

    $navTop = compileTemplate('navTop.phtml');
    $navMain = compileTemplate('navMain.phtml', [
        'herstellers' => $herstellers
    ]);
    $slider = compileTemplate('slider.phtml');
    $mainTop = compileTemplate('mainTop.phtml');
    $banner = compileTemplate('banner.phtml');
    $mainBottom = compileTemplate('mainBottom.phtml');
    $newArtikeln = compileTemplate('newArtikeln.phtml');
    $footer = compileTemplate('footer.phtml');
    $mainContainer = compileTemplate('mainContainer.phtml', [
        'mainTop' => $mainTop,
        'banner' => $banner,
        'mainBottom' => $mainBottom

    ]);
    $header = compileTemplate('header.phtml');

    echo compileTemplate('wrap.phtml', [
        'navTop' => $navTop,
        'header' => $header,
        'navMain' => $navMain,
        'maintoplist' => $mainTopList,
        'topBrands' => $topDinamicList,
        'slider' => $slider,
        
        'mainContainer' => $mainContainer,
        'newArtikeln' => $newArtikeln,
        'footer' => $footer,
    ]);
}

function contact()
{

    $navTop = compileTemplate('navTop.phtml');
    $navMain = compileTemplate('navMain.phtml', [
        'herstellers' => getHerstellers()
    ]);
    $contact = compileTemplate('contact.phtml');
    $slider = compileTemplate('slider.phtml');
    $mainTop = compileTemplate('mainTop.phtml');
    $banner = compileTemplate('banner.phtml');
    $mainBottom = compileTemplate('mainBottom.phtml');
    $newArtikeln = compileTemplate('newArtikeln.phtml');
    $footer = compileTemplate('footer.phtml');
    
    $mainContainer = compileTemplate('mainContainer.phtml', [
        'mainTop' => $mainTop,
        'banner' => $banner,
        'mainBottom' => $mainBottom

    ]);
    $header = compileTemplate('header.phtml');

    echo compileTemplate('wrap.phtml', [
        'navTop' => $navTop,
        'header' => $header,
        'navMain' => $navMain,
        'contact' => $contact,
        //'slider' => $slider,
      //  'mainContainer' => $mainContainer,
      //  'newArtikeln' => $newArtikeln,
        'footer' => $footer,
    ]);
}

// Get Connection for Database
function getConnectionPDO()
{
    return new PDO(
        'mysql:host=' . $_SERVER['DB_HOST'] . ';dbname=' . $_SERVER['DB_NAME'],
        $_SERVER['DB_USER'],
        $_SERVER['DB_PASSWORD']
    );
}

function getAllReparaturArt()
{
    $pdo = getConnectionPDO();

    $statement = $pdo->prepare('SELECT * FROM reparaturArt');
    $statement->execute();
    $countries = $statement->fetchAll(PDO::FETCH_ASSOC);
    echo json_encode($countries);
}

function getAllType($type)
{
    $pdo = getConnectionPDO();
    $statement = $pdo->prepare("SELECT * FROM `preise` WHERE type = '$type' ");
    $statement->execute();
    $res = $statement->fetchAll(PDO::FETCH_ASSOC);

    return $res;
}
// Get all items vo Hersteller
function getTypeList($herstellerID)
{
    $pdo = getConnectionPDO();
    $statement = $pdo->prepare("SELECT * FROM `type` WHERE herstellerID = '$herstellerID' ");
    $statement->execute();
    $types = $statement->fetchAll(PDO::FETCH_ASSOC);

    return $types;
}
// Get min preise from type where type =type
function getMinPreise($type)
{
    $pdo = getConnectionPDO();

    $statement = $pdo->prepare("SELECT MIN(preis) FROM `preise` WHERE type = '$type' and (preis > 0)");
    $statement->execute();
    $res = $statement->fetchAll(PDO::FETCH_ASSOC);

    foreach ($res as $key) {
        $result = $key['MIN(preis)'];
    }
    return  $result;
}

// Get only one from typesList
function getOnceFromTypes($id)
{
    $tipusLista = array();
    $pdo = getConnectionPDO();

    //$herstellerID= 2;

    $statement = $pdo->prepare("SELECT type FROM `preise` WHERE herstellerID = '$id' ");
    //$statement = $pdo->prepare("SELECT type FROM `preise`");
    $statement->execute();

    $types = $statement->fetchAll(PDO::FETCH_ASSOC);

    foreach ($types as $key) {

        if (!in_array($key['type'], $tipusLista)) {
            echo  "INSERT INTO `type` (`id`, `type`, `isActive`, `herstellerID`) VALUES (NULL, '" . $key['type'] . "', '1', '2');" . "<br>";

            array_push($tipusLista, $key['type']);
        }
    }
    // echo json_encode( $tipusLista);
}



function minPreisUploader($types)
{
    foreach ($types as $value) {
        echo $value['type'];
    }
}

function notFoundHandler()
{
    echo "Seite nicht gefunden";
}
