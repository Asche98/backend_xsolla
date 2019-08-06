<?php


namespace Banking;


class InnerBankTransfer extends Transfer
{
    protected function checkTransfer(): bool
    {
        $recieverBank=$this->receiverAccount->getBankClient()->getBank()->getBankName();
        $senderBank=$this->senderAccount->getBankClient()->getBank()->getBankName();
        if ($recieverBank!==$senderBank) return false;
        return $this->senderAccount->getBalance() >= $this->value && $this->senderAccount->getCurrency()==$this->receiverAccount->getCurrency();
    }

    protected function completeTransfer(): void
    {
        $this->senderAccount->subtractFromBalance($this->value);
        $this->receiverAccount->addToBalance($this->value);
    }

}