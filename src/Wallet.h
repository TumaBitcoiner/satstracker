#pragma once
#include <QObject>
#include <QtQml/qqml.h>
#include "Transaction.h"

class Wallet : public QObject {

	Q_OBJECT
	Q_PROPERTY(QString name READ getWalletName)
	Q_PROPERTY(int amount READ getTotalAmount)
	QML_ELEMENT

public:

	Wallet();
	~Wallet();

	int getTotalAmount() const { return totalAmount_; };
	QString getWalletName() const { return walletName_; };
	void addTransaction(Transaction& newTransaction);
	
public slots:
	void onAddedWallet();

private:

	// Total amount of sats in wallet
	int totalAmount_{ 0 };

	// List of transactions in wallet
	std::vector<Transaction> transactionList_;

	// Wallet name
	QString walletName_{ "Wallet" };

};