<?php


namespace Banking;


abstract class Transfer
{
    protected $senderAccount;
    protected $receiverAccount;
    protected $value;


    public function __construct(BankAccount $senderAccount, BankAccount $receiverAccount, float $value)
    {
        $this->senderAccount = $senderAccount;
        $this->receiverAccount = $receiverAccount;
        $this->value = $value;
    }

    public function doTransfer(): bool {
        if ($this->checkTransfer()) {
            $this->completeTransfer();
            return true;
        }
        return false;
    }

    protected function checkTransfer(): bool
    {

    }

    protected function completeTransfer(): void
    {

    }

}