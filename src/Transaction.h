#pragma once
#include <QObject>
#include <QtQml/qqml.h>
#include "Common.h"

class Transaction : public QObject {

	Q_OBJECT
	Q_PROPERTY(int amount READ getTransactionAmount)
	QML_ELEMENT

public:

	Transaction(int amount, TransactionType type);
	~Transaction();

	int getTransactionAmount() const { return amount_; };
	TransactionType getTransactionType() { return transactionType_; };

private:

	// Amount in sats
	int amount_{ 0 };

	// Type of transaction
	TransactionType transactionType_{ TransactionType::UNKNOWN };

	// Where?
	std::string location_;
};
