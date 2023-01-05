#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "Wallet.h"

int main(int argc, char* argv[])
{
    QGuiApplication app(argc, argv);

    Wallet mainWallet;

    QQmlApplicationEngine engine;
    QQmlContext* context = engine.rootContext();

    context->setContextProperty("WalletModel", &mainWallet);


    const QUrl url(u"qrc:gui/gui/main.qml"_qs);
    engine.load(url);

    QString idString = "walletColumn";
   // QList<QObject*> listObj = engine.rootObjects();
    QObject* buttonObj = engine.rootObjects()[0]->findChild<QObject*>(idString);

   if( !QObject::connect(buttonObj, SIGNAL(addedWallet()), &mainWallet, SLOT(onAddedWallet()))){

        std::cout << "ROTTO" << std::endl;
   }

    return app.exec();
}
