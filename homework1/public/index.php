<?php
use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

require './vendor/autoload.php';

$app = new \Slim\App;
//get
$app->get('/game/{id}', function (Request $request, Response $response, array $args) {
    $id = $args['id'];
    $games=file_get_contents("./src/games.json");
    $games=json_decode($games);
    $findGame="NO";
    foreach ($games as $game) {
        if ($game->id == $id) $findGame=$game;
     }
    return $response->withJson($findGame,201);
});
//post for editing
$app->post('/game/{id}', function ($request, $response, $args) {
  $id = $args['id'];
  $games=file_get_contents("./src/games.json");
  $games=json_decode($games);
  $postData = file_get_contents('php://input');
  $data = json_decode($postData);
  $isExists=false;
  foreach ($games as $game) {
      if ($game->id == $id){
        $isExists=true;
        if(isset($data->id))  $game->id = $data ->id;
        if(isset($data->name))  $game->name = $data->name;
        if(isset($data->description))  $game->description = $data->description;
        if(isset($data->creator))  $game->creator=$data->creator;
        break;
      }
   }
   file_put_contents("./src/games.json",json_encode($games));
   if(!$isExists) return $response->write("Game with this id is not exists");
   else return $response->write("Success");
});
//post for adding
$app->post('/game', function ($request, $response, $args){
  $games=file_get_contents("./src/games.json");
  $games=json_decode($games);
  $postData = file_get_contents('php://input');
  $data = json_decode($postData);
  $isExists=false;
  foreach ($games as $game){
    if ($game->id == $data->id){
      $isExists=true;
      break;
    }
  }
  if($isExists) return $response->write("Game with this id has already exists");
  $games[]=$data;
  file_put_contents("./src/games.json",json_encode($games));
  return $response->write("Success");
});
$app->run();
