<?php
$url = "http://localhost/children-counter.php";

$post_data = array(
  "children" => array("Ваня","Аня","Настя","Алена","Петя","Коля","Лена","Саша","Рома","Катя","Андрей","Максим"),
    "count" => 4,
);
$post_data=json_encode($post_data);
$ch = curl_init();

curl_setopt($ch, CURLOPT_URL, $url);

curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);

curl_setopt($ch, CURLOPT_POST, 1);

curl_setopt($ch, CURLOPT_POSTFIELDS, $post_data);
curl_setopt($ch, CURLOPT_HTTPHEADER, array(
   'Content-Type: application/json')
);

$output = curl_exec($ch);

curl_close($ch);

echo $output;
