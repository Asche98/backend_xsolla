<?php
class ResaleCalculator
{
  public function calculateLowestLoss(array $prices): int
  {
    $min=PHP_INT_MAX;
     for ($i = 0; $i <= count($prices); $i++){
       for($j = $i+1;$j<count($prices);$j++){
         if($prices[$i]>=$prices[$j] && ($prices[$i]-$prices[$j])<$min) $min=$prices[$i]-$prices[$j];
       }
     }
     if($min==PHP_INT_MAX) return -1;
     else return $min;
  }
}
