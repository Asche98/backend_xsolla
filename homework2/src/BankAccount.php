<?php


namespace Banking;


class BankAccount
{
    /**
     * @var BankClient
     */
    private $bankClient;

    /**
     * @var float
     */
    private $balance = 0;

    private $currency;

    public function __construct(BankClient $bankClient,string $currency)
    {
        $this->bankClient = $bankClient;
        $this->currency=$currency;
    }

    public function getBankClient(): BankClient
    {
        return $this->bankClient;
    }

    public function getCurrency():string
    {
        return $this->currency;
    }

    public function getBalance(): float
    {
        return $this->balance;
    }

    public function addToBalance(float $value): float
    {
        $this->balance += $value;
        return $this->balance;
    }

    public function subtractFromBalance(float $value): float
    {
        $this->balance -= $value;
        return $this->balance;
    }
}