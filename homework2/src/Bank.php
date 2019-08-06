<?php


namespace Banking;


class Bank
{
    private $bankName;

    public function __construct(string $bankName)
    {
        $this->bankName=$bankName;
    }

    public function getBankName(): string
    {
        return $this->bankName;
    }
}