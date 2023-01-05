#include "Wallet.h"

Wallet::Wallet() {
}

Wallet::~Wallet() {
}

void Wallet::addTransaction(Transaction& newTransaction) {

	totalAmount_ += newTransaction.getTransactionAmount();

	//transactionList_.push_back(newTransaction);
}

void Wallet::onAddedWallet() {

	totalAmount_ = 100;

}