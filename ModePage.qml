import QtQuick 2.12
import QtQuick.Controls 2.5

Page {
    id:modePage
    title: qsTr("ModePage")
Column{
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.verticalCenter: parent.verticalCenter
    width: parent.width
    spacing: 10
    SwipeView {
         id: view
         anchors.horizontalCenter: parent.horizontalCenter
         width: parent.width
         height: 200
         currentIndex: 0
         //anchors.fill: parent

         Page {
             id: firstPage

             Column
             {
                 anchors.centerIn: parent
                 spacing: 8
                 Text {

                     text: qsTr("How To Use ?")
                     font.bold: true
                     font.pointSize: 18
                     anchors.horizontalCenter: parent.horizontalCenter
                 }
                 Text {
                     anchors.horizontalCenter: parent.horizontalCenter
                     font.pointSize: 16
                     text: qsTr("1- Make sure that the sender and the receiver are connected Through Wifi")
                 }
                 Text {
                      font.pointSize: 16
                     anchors.horizontalCenter: parent.horizontalCenter
                     text: qsTr("2- Sender and receiver must remain connected during the transfert")
                 }
             }
         }
         Page {
             id: secondPage
             Column
             {
                 spacing: 8
                 anchors.centerIn: parent
                 Text {

                     text: qsTr("How To Send ?")
                     font.bold: true
                     font.pointSize: 18
                     anchors.horizontalCenter: parent.horizontalCenter
                 }
                 Text {
                     font.pointSize: 18
                     anchors.horizontalCenter: parent.horizontalCenter
                     text: qsTr("1- Click on send files")
                 }
                 Text {
                     font.pointSize: 18
                     anchors.horizontalCenter: parent.horizontalCenter
                     text: qsTr("2- Click on select files, then choose the file")
                 }
                 Text {
                     font.pointSize: 18
                     anchors.horizontalCenter: parent.horizontalCenter
                     text: qsTr("3- Click on send file.The transfert begin")
                 }
             }
         }
         Page {
             id: thirdPage
             Column
             {
                 spacing: 8
                 anchors.centerIn: parent
                 Text {

                     text: qsTr("How To Receive ?")
                     font.bold: true
                     font.pointSize: 18
                     anchors.horizontalCenter: parent.horizontalCenter
                 }
                 Text {
                     font.pointSize: 18
                     anchors.horizontalCenter: parent.horizontalCenter
                     text: qsTr("1- Click on receive files")
                 }
                 Text {
                     font.pointSize: 18
                     anchors.horizontalCenter: parent.horizontalCenter
                     text: qsTr("2- Wait for the sender to send the files")
                 }

             }
         }
         /*Item {
             id: thirdPage
         }
         Item {
             id: fourthPage
         }
         Item {
             id: fifthPage
         }*/
     }
    PageIndicator {
         id: indicator

         count: view.count
         currentIndex: view.currentIndex

         anchors.horizontalCenter: parent.horizontalCenter
     }
    Text {
        text: qsTr("Select an Option")
        font.family: "Myanmar Text"
        font.pointSize: 18
        anchors.horizontalCenter: parent.horizontalCenter
    }
    Button
    {
        anchors.horizontalCenter: parent.horizontalCenter
        text: qsTr("Send Files")
        font.pointSize: 20
        id:sendButton
        onClicked:
        {
          //  backend.setMode(1);
          //  modePage.parent.gotoSendPage()

        }
        MouseArea
        {
          anchors.fill: sendButton
          id:mouseAreaBtn2
           onClicked:
           {
                //  onClicked: homePage.parent.gotoModePage()
               backend.setMode(1);
               modePage.parent.gotoSendPage()
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
                  implicitHeight: 50
                 // border.width: control.activeFocus ? 2 : 1
                  border.color: "#77eea5"
                  radius: 4
                  gradient:mouseAreaBtn2.containsMouse ? greengrad:greegradClicked
//
              }
    }
    Button
    {
        anchors.horizontalCenter: parent.horizontalCenter
        text: qsTr("Receive Files")
        id:receiveButton
        font.pointSize: 20
        onClicked: {
           // backend.setMode(0);
          //  modePage.parent.gotoReceivePage()

        }
        MouseArea
        {
          anchors.fill: receiveButton
          id:mouseAreaBtn
           onClicked:
           {
                  onClicked: backend.setMode(0);
                  modePage.parent.gotoReceivePage()
           }

        }
        Gradient {
            id:bluegradClicked
            GradientStop {
                           position: 0.00;
                           color: "#0549ad";
                                }
                   GradientStop {
                           position: 1.00;
                           color: "#0675ad";
                                }
                }
        Gradient {
            id:bluegrad
            GradientStop {
                           position: 0.00;
                           color: "#44a9e8";
                                }
                   GradientStop {
                           position: 1.00;
                           color: "#0675ad";
                                }
                }


              background: Rectangle {
                  implicitWidth: 100
                  implicitHeight: 50
                 // border.width: control.activeFocus ? 2 : 1
                  border.color: "#20d5f1"
                  radius: 4
                  gradient:mouseAreaBtn.containsMouse ? bluegrad:bluegradClicked
//
              }
    }
}
}
