#pragma once
#include "Common.h"

class Transaction {

public:

	Transaction(int amount, TransactionType type);
	~Transaction();

private:

	// Amount in sats
	int amount_{ 0 };

	// Type of transaction
	TransactionType transactionType_{ TransactionType::UNKNOWN };

	// Where?
	std::string location_;
};
