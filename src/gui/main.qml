import QtQuick
import QtQuick.Controls

ApplicationWindow {
    id: root
    visible: true
    width: 640
    height: 480


    menuBar: MenuBar{

        Menu{
            title: qsTr("&Wallet")
             Action { text: qsTr("&Add new wallet...") }
        }

    }

    Rectangle{

        id: colWallet
        visible: true
        width: root.width / 3
        height: root.height
        color: "#FF8C00"

        Button {
               id: addWallet

               x: colWallet.width /2 - width/2
               y: colWallet.height - 80
              // anchors.bottom: parent
              // width: col.cellWidth
               text: "New Wallet"
               //onClicked: root.testWindow.visibility = Window.AutomaticVisibility
        }
    }


    Rectangle{

        id: colTransactions
        visible: true
        anchors.left: colWallet.right
        width: 2* root.width / 3
        height: root.height

        Button {
               id: addTransaction

               x: colTransactions.width /2 - width/2
               y: colTransactions.height - 80
              // anchors.bottom: parent
              // width: col.cellWidth
               text: "Add Transaction"
               //onClicked: root.testWindow.visibility = Window.AutomaticVisibility
        }
    }
}
