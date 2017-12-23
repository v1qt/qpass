import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import QtQuick.Dialogs 1.0
import QtQml.Models 2.1
import "."

Item {
    id: qbase
    width: 400
    height: 800
    onVisibleChanged: {
       text_ip_qb_name.text = logedUserName
    }


    ToolBar {
        id: toolB
        height: 60
        anchors.rightMargin: 0
        anchors.bottomMargin: 737
        anchors.leftMargin: 0
        anchors.topMargin: 0
        anchors.fill: parent
        background: Rectangle{
        color: "Orange"
        }

        TextInput {
            id: text_ip_qb_surname
            text: "Hallo!"
            anchors.top: parent.top
            anchors.topMargin: 6
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 34
            anchors.left: parent.left
            anchors.leftMargin: 9
            anchors.right: parent.right
            anchors.rightMargin: 285
            font.pixelSize: 12
            color: "#2e3436"
            font.weight: Font.ExtraLight
            font.family: "Verdana"
            verticalAlignment: Text.AlignVCenter
            readOnly: true
            selectByMouse: false
            cursorVisible: false
        }

        TextInput {
            id: text_ip_qb_name
            text: "Name"
            anchors.top: parent.top
            anchors.topMargin: 35
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 5
            anchors.left: parent.left
            anchors.leftMargin: 9
            anchors.right: parent.right
            anchors.rightMargin: 265
            font.pixelSize: 18
            color: "#2e3436"
            font.weight: Font.ExtraLight
            font.family: "Verdana"
            verticalAlignment: Text.AlignVCenter
            selectByMouse: false
            cursorVisible: false
        }

        Image {
            id: image
            x: 148
            y: 6
            width: 50
            height: 50
            fillMode: Image.PreserveAspectFit
            source: "../images/pingu.png"
        }

        Button {
            id: button_qb_edit
            x: 342
            y: -6
            width: 50
            height: 50
            anchors.topMargin: 6
            anchors.rightMargin: 8
            anchors.right: parent.right
            anchors.top: parent.top
            background: Rectangle {
                color: button_qb_edit.down ? "#ffffff" : "Orange"
                radius: 100
                implicitWidth: 70
                border.color:  "#2e3436"
                implicitHeight: 70
                border.width: button_qb_edit.activeFocus ? 2 : 1
                anchors.fill: parent
            }
            contentItem: Text {
                y: 8
                height: 15
                color: button_qb_edit.down ? "Orange" :  "#2e3436"
                text: "Edit"
                font.bold: true
                anchors.rightMargin: 0
                anchors.leftMargin: 0
                anchors.right: parent.right
                anchors.left: parent.left
                horizontalAlignment: Text.AlignHCenter
                font.pointSize: 8
                elide: Text.ElideRight
                verticalAlignment: Text.AlignVCenter

            }
            onClicked: {
                console.log("Profile Edit")

                profile.laodProfile()
                q_BaseView.visible= false
                profile.visible = true
            }
        }


    }

    Rectangle{
        id: mainRect
        height: 526
        color: "#00000000"

        property alias currentIndex: rootList.currentIndex

        anchors.top: parent.top
        anchors.topMargin: 122
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0


        ListView {
            id: rootList
            width: parent.width; height: parent.height;
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            snapMode: ListView.SnapOneItem
            highlightRangeMode: ListView.StrictlyEnforceRange
            highlightMoveDuration: 250
            focus: false
            orientation: ListView.Horizontal
            boundsBehavior: Flickable.StopAtBounds
            keyNavigationWraps: true

            model: ObjectModel{
                PWListView {
                    id: pwlistView
                    width: rootList.width
                    height: rootList.height

                }
                PasswordsView {
                    id: passwordsview
                    width: rootList.width
                    height: rootList.height
                }
            }
            onCurrentIndexChanged: {
                if(rootList.currentIndex==1)
                    pview_btn_create.visible=false
                if(rootList.currentIndex==0)
                    passwordsview.setEditModeOff()
                    pview_btn_create.visible=true

            }
        }

        Button {
            id: button_pr_logout
            x: 30
            y: 6
            width: 70
            height: 70
            background: Rectangle {
                color: button_pr_logout.down ? "#f93434" : "#2e3436"
                radius: 100
                implicitWidth: 70
                border.color: "#f93434"
                implicitHeight: 70
                border.width: button_pr_logout.activeFocus ? 2 : 1
                anchors.fill: parent
            }

            contentItem: Text {
                y: 9
                width: 60
                height: 38
                color: button_pr_logout.down ? "#2e3436" :  "#f93434"
                text: "Logout"
                styleColor: "#f93434"

                horizontalAlignment: Text.AlignHCenter
                anchors.rightMargin: 0
                font.pointSize: 9
                elide: Text.ElideRight
                anchors.left: parent.left
                anchors.right: parent.right
                verticalAlignment: Text.AlignVCenter
                anchors.leftMargin: 0
            }
            anchors.topMargin: 566
            anchors.rightMargin: 300
            anchors.right: parent.right
            anchors.top: parent.top
            onClicked: {
                pwlistmodel.clear()
                q_BaseView.visible =false
                loginView.visible=true
            }
        }

        Button {
            id: pview_btn_create
            x: 258
            y: 551
            width: 100
            height: 100
            background: Rectangle {
                id: rectcreatebtn
                x: 0
                y: 1
                width: 100
                height: 100
                color: pview_btn_create.down ? "Orange" : "#2e3436"
                radius: 100
                border.width: pview_btn_create.activeFocus ? 2 : 1
                border.color: pview_btn_create.down ? "Orange" : "Orange"
                implicitHeight: 70
                implicitWidth: 70
            }
            contentItem: Text {
                x: -7
                y: 1
                width: 100
                height: 100
                color: pview_btn_create.down ? "#2e3436" :  "Orange"
                text: "+"
                font.pointSize: 18
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.bold: false
                styleColor: "#f93434"
                elide: Text.ElideRight
            }

            onClicked:{
                passwordsview.setFieldsDefault()
                passwordsview.setCreateMode()
                rootList.currentIndex=1
            }
        }
    }
    function setPassListIndex()
    {
        pwlistView.setPassListOnLastItem()

    }

}




