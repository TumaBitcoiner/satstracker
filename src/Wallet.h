#pragma once
#include "Transaction.h"

class Wallet {

public:

	Wallet();
	~Wallet();

private:

	// Total amount of sats in wallet
	int totalAmount_{ 0 };

	// List of transactions in wallet
	std::vector<Transaction> transactionList_;

	// Wallet name
	std::string walletName{ "Wallet" };

};