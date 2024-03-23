import QtQuick 2.5
import QtQuick.Controls 2.0
Page {

Column
{
    anchors.centerIn: parent

    spacing: 5
    Text {

        text: qsTr("Support Us")
        font.bold: true
        font.pointSize: 16
        anchors.horizontalCenter: parent.horizontalCenter
    }
    Text {
        color: "#f39033"

        text: qsTr("Orange Money:+237 655275109")
        font.pointSize: 14
         anchors.horizontalCenter: parent.horizontalCenter
    }
    Text {
        color: "#dde013"

        text: qsTr("Mobile Money:+237 679061371")
        font.pointSize: 14
        anchors.horizontalCenter: parent.horizontalCenter
    }
    /*Text {
        color: "#25f8ff"

        text: qsTr("Paypal")
        font.pointSize: 14
        anchors.horizontalCenter: parent.horizontalCenter
    }*/
}

}
