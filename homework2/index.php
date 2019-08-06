<?php
use Banking\BankClient;
use Banking\BankAccount;
use Banking\InnerBankTransfer;
use Banking\InterBankTransfer;
use Banking\Bank;
require_once __DIR__.'/vendor/autoload.php';

$bank= new Bank("sberbank");
$bank2=new Bank("antiSberbank");
$client = new BankClient($bank);
$client2=new BankClient($bank2);
$account = new BankAccount($client,"$");
$account2=new BankAccount($client,"$");
$account3=new BankAccount($client2,"$");
$account->addToBalance(105);
$transfer=new InterBankTransfer($account,$account3,100);
$isTransferSuccesful=$transfer->doTransfer();
if($isTransferSuccesful){
  echo 'yay'.PHP_EOL;
}
else{
  echo 'ehh'.PHP_EOL;
}
