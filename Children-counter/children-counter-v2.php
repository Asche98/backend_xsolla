<?php
//Альтернатиыный и, возможно, более интересный способ решения задачи
function MakeCount($array,$k){
  while(count($array)!=1){
    /*Остаток от деления числа слов в считалке на длину массива в случае, если он не равен нулю, укажет номер
     выбывающего на текущей итерации ребенка. В противном случае(если остаток равен нулю) выбывает последний в списке ребёнок.*/
    $index=$k%count($array);
    if($index==0){
      //убираем последний элемент в массиве
      unset($array[count($array)-1]);
      continue;
    }
    else{
      /*Заменим текущий массив на новый, из которого исключен выбывший ребёнок, при этом для облегчения дальнейшего
      хода алгоритма поместим начало массива (элементы до выбывшего ребенка) в конец. Таким образрм, мы избавляемся
      от необходимости обработки перехода через конец массива (или использования циклических списков) и, вместо этого,
      повторяем вычисление индекса на каждой последующей итерации*/
      $beg=array_slice($array,0,$index-1);
      $end=array_slice($array,$index,count($array)-$index);
      $array=array_merge($end,$beg);
    }
  }
  return $array[0];
}
$postData = json_decode(file_get_contents('php://input'));
$names=$postData->children;
$count=$postData->count;
echo MakeCount($names,$count);
