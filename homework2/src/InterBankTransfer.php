<?php


namespace Banking;


class InterBankTransfer extends Transfer
{
    const COEF=1.05;

    protected function checkTransfer(): bool
    {
        return $this->senderAccount->getBalance() >= $this->value*self::COEF && $this->senderAccount->getCurrency()==$this->receiverAccount->getCurrency();
    }

    protected function completeTransfer(): void
    {
        $this->senderAccount->subtractFromBalance($this->value*self::COEF);
        $this->receiverAccount->addToBalance($this->value);
    }
}