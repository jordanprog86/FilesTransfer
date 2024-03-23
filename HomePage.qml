import QtQuick 2.12
import QtQuick.Controls 2.5
import "qrc:"
Page {

    title: qsTr("Home")
    id:homePage
    footer:  Rectangle
    {
        width: parent.width
        height: 200
        color: "#c6c5c5"
        //border.color: "#28a496"
        //border.width: 1
        Column
        {
            anchors.centerIn: parent
            spacing: 5
            Text {

                text: qsTr("Supported files")
                font.bold: true
                font.pointSize: 16
                anchors.horizontalCenter: parent.horizontalCenter
            }
            Text {

                text: qsTr("Zip , Rar, Mp3, Pdf, txt")
                font.pointSize: 14
                 anchors.horizontalCenter: parent.horizontalCenter
            }
            Text {

                text: qsTr(" Copyright © 2023 Ronel Tchoulayeu")
                font.pointSize: 12
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }
    }

Column{
    anchors.centerIn: parent
    spacing: 7
    Image {
        id: logo
        source:"/images/quickshare.png"
        anchors.horizontalCenter: parent.horizontalCenter
        width: 240
        height: 250
    }
    Text {
        text: qsTr("Quick Share")
        font.family: "Myanmar Text"
        font.bold: true
        font.pointSize: 18
        anchors.horizontalCenter: parent.horizontalCenter
    }

    /*Button
    {
        anchors.horizontalCenter: parent.horizontalCenter
        text: qsTr("Start")
        onClicked: homePage.parent.gotoModePage()
    }*/
    Button
            {
              id:yesButton
              text: qsTr("Start")
              font.pointSize: 20
              font.bold: true
              width: 150
              height: 80
              anchors.horizontalCenter: parent.horizontalCenter
              MouseArea
              {
                anchors.fill: yesButton
                id:mouseAreaBtn2
                 onClicked:
                 {
                        onClicked: homePage.parent.gotoModePage()
                 }

              }
              Gradient {
                  id:greengrad
                  GradientStop {
                                 position: 0.00;
                                 color: "#5ca043";
                                      }
                         GradientStop {
                                 position: 1.00;
                                 color: "#23dd33";
                                      }
                      }
              Gradient {
                  id:greegradClicked
                  GradientStop {
                                 position: 0.00;
                                 color: "#5ca043";
                                      }
                         GradientStop {
                                 position: 1.00;
                                 color: "#5ca043";
                                      }
                      }


                    background: Rectangle {
                        implicitWidth: 100
                        implicitHeight: 25
                       // border.width: control.activeFocus ? 2 : 1
                        border.color: "#77eea5"
                        radius: 4
                        gradient:mouseAreaBtn2.containsMouse ? greengrad:greegradClicked
    //
                    }

}
    Text {
        anchors.horizontalCenter: parent.horizontalCenter
        text: qsTr("Share files through Wifi in few steps")
        font.italic: true
        font.pointSize: 12
    }


}
}
