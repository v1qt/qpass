import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import "."

Rectangle{
    id: listViewRect
    width: 320
    height: 410
    color: "#00000000"
    property string currentItemId: ""
    property int listIndex: 0

ListView
{
        id: passList
        anchors.fill: parent
        clip: true
        keyNavigationWraps: true
        highlightMoveDuration: 1
        flickableDirection: Flickable.AutoFlickDirection
        header:  Label {
                id: label_qb_main
                y: 86
                height: 80
                font.bold: true
                verticalAlignment: Text.AlignVCenter
                anchors.left: parent.left
                anchors.leftMargin: 10
                anchors.right: parent.right
                anchors.rightMargin: 217
                font.family: "Verdana"
                fontSizeMode: Text.HorizontalFit
                font.pointSize: 18
                font.weight: Font.ExtraLight
                color: "orange"
                text: qsTr("Password List ")
                horizontalAlignment: Text.AlignLeft
        }
        /*footer: Button {
            id: pview_btn_create
            width: rootRect.width
            height: 80
            background: Rectangle {
                id: rectcreatebtn
                width: rootRect.width
                height: 80
                color: pview_btn_create.down ? "Orange" : "#00000000"
                anchors.left: parent.left
                anchors.right: parent.right
                border.width: pview_btn_create.activeFocus ? 2 : 1
                border.color: pview_btn_create.down ? "Orange" : "Orange"
            }
            contentItem: Text {
                width: rootRect.width
                height: 80
                color: pview_btn_create.down ? "#2e3436" :  "Orange"
                text: "New Password"
                font.pointSize: 14
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.bold: false
                styleColor: "#f93434"
                anchors.left: parent.left
                anchors.right: parent.right
            }
            onClicked: {
                myModel.append({ "sender": "New" , "title": "This is a New Item", "imageSource":"../images/Git.png"  })
                 //mainRect.currentIndex = 1;
            }
        }*/    
        currentIndex: 0
        focus: true
        snapMode: ListView.SnapToItem
        model: pwlistmodel
        delegate:
            Component {
                    id: listDelegate
                    Item {
                        id: wrapper
                        width: parent.width; height: 55

                        Row {
                            width:parent.width
                            Text { text: model.itemname
                                   color: "white"
                                   font.family: "Verdana"
                                   fontSizeMode: Text.HorizontalFit
                                   font.pointSize: 14
                                   leftPadding: 10
                            }
                            Text {  text: " "+ model.itemid
                                    color: "white"
                                    font.family: "Verdana"
                                    fontSizeMode: Text.HorizontalFit
                                    font.pointSize: 14

                                    visible: false
                            }
                            Image{
                                width: 40
                                height: 40
                                //source: imageSource
                                antialiasing: true
                                smooth: true
                                }
                        }
                        // indent the item if it is the current item
                        /*
                        states: State {
                            name: "Current"
                            when: wrapper.ListView.isCurrentItem
                            PropertyChanges { target: wrapper; x: 20 }
                        }
                        transitions: Transition {
                            NumberAnimation { properties: "x"; duration: 200 }
                        }
                        */

                        MouseArea {
                            id: msArea
                            anchors.fill: parent
                            onClicked: {
                               //wrapper.ListView.view.currentIndex = index
                                if (passList.currentIndex == index)
                                  {
                                    console.log("Aktueller Index der ListView = ", passList.currentIndex)
                                    listViewRect.listIndex=passList.currentIndex
                                    console.log("Aktueller Index in Propertie gespeichert",listIndex)
                                    console.log("Wert im Model = ", pwlistmodel.get(passList.currentIndex).itemid)
                                    currentItemId = pwlistmodel.get(passList.currentIndex).itemid
                                    console.log("Current Item ID = ",parseInt(currentItemId))
                                    passCTRL.loadEntry(parseInt(currentItemId));
                                    passwordsview.populatePasswordView()
                                    mainRect.currentIndex = 1;
                                }
                                else
                                    passList.currentIndex = index;
                            }
                        }
                    }
                }

        ScrollIndicator.vertical: ScrollIndicator{    }
        highlight: Rectangle
                      {
                          width: parent.width
                          height: 55
                          color:"Orange"
                      }




    }
function setPassListOnLastItem(){
    passList.currentIndex = 0
}
}
