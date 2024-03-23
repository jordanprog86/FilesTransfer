import QtQuick 2.12
import QtQuick.Controls 2.5

ApplicationWindow {
    id: window
    visible: true
    width: 640
    height: 480
    title: qsTr("Quick Share")

    header: ToolBar {
        contentHeight: toolButton.implicitHeight
        background: Rectangle{
            width: parent.width
            height: 40

        }

        ToolButton {
            id: toolButton
            text: stackView.depth > 1 ? "\u25C0" : "\u2630"

            font.pixelSize: Qt.application.font.pixelSize * 1.6
            onClicked: {
                if (stackView.depth > 1) {
                    stackView.pop()
                } else {
                    drawer.open()
                }
            }
        }

        Label {
            text: stackView.currentItem.title
            font.pointSize: 18
            anchors.centerIn: parent
        }
    }

    Drawer {
        id: drawer
        width: window.width * 0.66
        height: window.height

        Column {
            anchors.fill: parent

            ItemDelegate {
                text: qsTr("Support Us")
                width: parent.width
                onClicked: {
                    stackView.push("Support.qml")
                    drawer.close()
                }
            }
            /*ItemDelegate {
                text: qsTr("About")
                width: parent.width
                onClicked: {
                    stackView.push("")
                    drawer.close()
                }
            }*/
        }
    }

    StackView {
        id: stackView
        initialItem: "HomePage.qml"
        anchors.fill: parent

        function gotoSendPage()
        {
              stackView.push("SendPage.qml")
        }
        function gotoReceivePage()
        {
              stackView.push("ReceivePage.qml")
        }
        function gotoModePage()
        {
            stackView.push("ModePage.qml")
        }

    }
}
