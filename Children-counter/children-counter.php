<?php
//метод, моделирующий реальный процесс осуществления считалки
function MakeCount($array,$k){
  $i=0;//счётчик индексов массива
  $c=1;//счётчик слов в считалке
  while(count($array)!=1){
    if($c==$k){//если достигли конца считалки - удаляем элемент, на котором "остановились"
      unset($array[$i]);
      $c=1;//начинаем "считалку" заново
    } else $c++;
    if(!array_key_exists($i+1,$array)){//если достигли конца массива - вновь начинаем с нулевого индекса
      $i=0;
      $array=array_values($array);//перенумерация ключей
    }
    else $i++;
  }
  $array=array_values($array);//итоговая перенумерация ключей
  return $array[0];
}
$postData = json_decode(file_get_contents('php://input'));
$names=$postData->children;
$count=$postData->count;
echo MakeCount($names,$count);
