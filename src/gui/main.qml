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
             MenuItem {
                    text: qsTr("Exit")
                    onTriggered: Qt.quit();
                }
        }

    }


    Rectangle{

        id: colWallet
        objectName: "walletColumn"
        visible: true
        width: root.width / 3
        height: root.height
        color: "#FF8C00"

        signal addedWallet()

        ListView {
            id: walletList
            model: WalletModel
            spacing: 5
            anchors.fill: parent
            delegate: Rectangle {

                id: walletRect
                width: parent.width
                height: 30
                color: "#d0d1d2"
                Text {
                    text: name
                    font.pointSize: 12
                    color: "#FF8C00"
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                }

                Text {
                    id: textAmount
                    text: amount
                    visible: false
                    font.pointSize: 12
                    color: 'black'
                    //anchors.verticalCenter: parent.verticalCenter
                    anchors.centerIn: parent
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        textAmount.visible = !textAmount.visible
                        colWallet.addedWallet()
                    }
                }
            }
        }

        Button {
               id: addWallet

               x: colWallet.width /2 - width/2
               y: colWallet.height - 80
              // anchors.bottom: parent
              // width: col.cellWidth
               text: "New Wallet"
               onClicked: {
                   //root.testWindow.visibility = Window.AutomaticVisibility
                   //colWallet.addedWallet()
                   addWalletDialog.open()
               }
        }

    }


    Dialog {

        id: addWalletDialog
        title: "Add Wallet"
        width: root.width/2
        height: root.height/2
        x: (parent.width - width) / 2
        y: (parent.height - height) / 2

        standardButtons:  Dialog.Ok | Dialog.Cancel

        Text {
            id: textNameDlg
            text: "Wallet name:"
            visible: true
            font.pointSize: 10
            color: 'black'
            //anchors.verticalCenter: parent.verticalCenter
           // anchors.centerIn: parent
        }
        TextField {
            id: enterName
            placeholderText: qsTr("Enter wallet name")
            anchors.left: textAmountDlg.right
        }
        Text {
            id: textAmountDlg
            text: "Wallet amount:"
            visible: true
            font.pointSize: 10
            color: 'black'
            anchors.top: textNameDlg.bottom
            //anchors.verticalCenter: parent.verticalCenter
           // anchors.centerIn: parent
        }
        TextField {
            id: enterAmount
            placeholderText: qsTr("Enter wallet amount")

            anchors.top: textNameDlg.bottom
            anchors.left: textAmountDlg.right

        }

        CheckBox {
                id: onChainBox
                text: qsTr("On-chain")
                anchors.top: textAmountDlg.bottom
                anchors.left: textAmountDlg.right
                //checkState: childGroup.checkState
        }
        CheckBox {
                id: lightingBox
                text: qsTr("Lighting")
                anchors.top: textAmountDlg.bottom
                anchors.left: onChainBox.right
                //checkState: childGroup.checkState
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
