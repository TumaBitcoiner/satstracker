#include "Transaction.h"

Transaction::Transaction(int amount, TransactionType type) :
	amount_{ amount },
	transactionType_{ type } {
}

Transaction::~Transaction() {
}