import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import QtQuick.Dialogs 1.3
import "qrc:"
Page {
    property string fileName: ""
    header: Rectangle{
    width: parent.width
    height: 75
   // color: "#e6e6e6"
    color: "white"
    RowLayout
    {
       anchors.fill: parent
       Rectangle
       {
           width: 50
           height: 50
           //color: "#1c94af"
            color: "transparent"
          // visible: false
       }
        TextField
        {
        Layout.fillWidth: true
        id:pathField
           font.pointSize: 18
        background: Rectangle {
                  implicitWidth: 200
                  implicitHeight: 40
                  color: pathField.enabled ? "white" : "#353637"
                  border.color: pathField.enabled ?  "white":"#21be2b"
              }
        }
        Button
        {
            text: qsTr("Select File")
            id:selectButton
            onClicked: fileDialog.visible=true
            font.pointSize: 18

        }
        Button{
             text: qsTr("Send file")
              font.pointSize: 18
             enabled: pathField.text != ""
             onClicked:
             {
               // pathField.text= fileDialog.fileUrl
                 backend.setCurrentFile(fileName)
                 listModel.append({"currentfile": backend.currentFile(), "status":"Sending....", "value":backend.uploadMV()-backend.uploadV()})

             }
        }
    }
    }


    ListView
    {

        anchors.fill: parent
        clip: true



        model:ListModel
        {
          id:listModel
         /*ListElement {
                   name: "Apple"
                   cost: "2.45"
                   type:"Transferts"
               }
               ListElement {
                   name: "Orange"
                   cost: "3.25"
                   type:"Transferts"
               }
               ListElement {
                   name: "Banana"
                   cost: "1.95"
                   type:"Transferts"
               }*/
        }

        Component
        {
            id: sendingDelegate
            Rectangle
            {
                id:itemRect
                width: parent.width
                height: 100
                //color: "#e6e6e6"
                color: "white"
                border.color: "#192324"
                border.width: 3
                RowLayout
                {
                    anchors.fill: parent
                    CustomProgressBar
                    {
                       width: 100
                       height: 100
                       value: model.value<0 ?0:model.value
                      // value: 50
                    }
                    Text {

                        text: qsTr(currentfile)
                        Layout.fillWidth: true
                        font.pointSize: 16
                    }
                    Text {

                        text: qsTr(status)
                         font.pointSize: 16
                    }

                }
                /*ProgressBar
                {

                    anchors.top: itemRect.bottom
                    width: parent.width
                    id: progressbar
                    value: model.value

                }*/

                Rectangle
                {
                    id:spacer
                    anchors.top: itemRect.bottom
                    width: parent.width
                    height: 25
                    color: "white"

                }

            }




        }

        delegate:sendingDelegate
    }

    FileDialog {
         id: fileDialog
         title: "Please choose a file"
         folder: shortcuts.home
         onAccepted: {
             console.log("You chose: " + fileDialog.fileUrls)
               pathField.text= fileDialog.fileUrl
             pathField.cursorPosition= 0
             fileName = fileDialog.fileUrl
         //    Qt.quit()
         }
         onRejected: {
             console.log("Canceled")
          //   Qt.quit()
         }
       //  Component.onCompleted: visible = true
     }

}
