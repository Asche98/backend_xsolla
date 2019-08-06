<?php


namespace Banking;


class BankClient
{
    private $bank;

    public function __construct(Bank $bank)
    {
        $this->bank=$bank;
    }

    public function getBank() :Bank
    {
        return $this->bank;
    }
}