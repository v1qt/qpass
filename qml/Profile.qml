import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import QtQuick.Dialogs 1.0
import "."
import QtQuick.Extras 1.4
import Qt.labs.calendar 1.0




Item {
    id: profile
    width: 400
    height: 700


    Label {
        id: label_profile
        height: 52
        text: qsTr("Create Profile")
        font.bold: false
        verticalAlignment: Text.AlignTop
        anchors.top: parent.top
        anchors.topMargin: 8
        anchors.left: parent.left
        anchors.leftMargin: 8
        anchors.right: parent.right
        anchors.rightMargin: 216
        font.family: "Verdana"
        fontSizeMode: Text.HorizontalFit
        font.pointSize: 18
        font.weight: Font.ExtraLight
        color: "Orange"
    }

    Item {
        id: item_name
        y: 82
        height: 42
        anchors.right: parent.right
        anchors.rightMargin: 175
        anchors.left: parent.left
        anchors.leftMargin: 8
        antialiasing: true
        Rectangle {
            id: rec_name
            color: "#2e3436"
            border.width: profile_ti_name.activeFocus ? 2 : 1
            anchors.fill: parent
            border.color: "Orange"
            TextInput {
                id: profile_ti_name
                color: "#ffffff"
                text: "Name"
                selectByMouse: true
                verticalAlignment: Text.AlignVCenter
                anchors.right: parent.right
                anchors.rightMargin: 8
                anchors.left: parent.left
                anchors.leftMargin: 8
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 8
                anchors.top: parent.top
                anchors.topMargin: 8
                font.weight: Font.Normal
                font.family: "Tahoma"
                font.capitalization: Font.MixedCase
                font.pixelSize: 12
                font.bold: false
                Keys.onReturnPressed: profile_ti_surname.forceActiveFocus()
                Keys.onTabPressed: profile_ti_surname.forceActiveFocus()
            }
        }

    }

    Item {
        id: item_surname
        x: -7
        y: 131
        height: 42
        anchors.right: parent.right
        anchors.leftMargin: 8
        anchors.left: parent.left
        anchors.rightMargin: 175
        antialiasing: true
        Rectangle {
            id: rect_surname
            color: "#2e3436"
            border.width: profile_ti_surname.activeFocus ? 2 : 1
            anchors.fill: parent
            border.color: "Orange"
            TextInput {              
                id: profile_ti_surname
                selectByMouse: true
                color: "#ffffff"
                text: "Surname"
                verticalAlignment: Text.AlignVCenter
                font.pixelSize: 12
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.right: parent.right
                anchors.bottomMargin: 8
                font.weight: Font.Normal
                anchors.leftMargin: 8
                anchors.left: parent.left
                font.capitalization: Font.MixedCase
                font.family: "Tahoma"
                font.bold: false
                anchors.rightMargin: 8
                anchors.topMargin: 8
                Keys.onReturnPressed: profile_ti_email.forceActiveFocus()
                Keys.onTabPressed: profile_ti_email.forceActiveFocus()
            }
        }       
    }

    Item {
        id: item_email
        x: 2
        y: 179
        height: 42
        anchors.right: parent.right
        anchors.leftMargin: 8
        anchors.left: parent.left
        anchors.rightMargin: 175
        antialiasing: true
        Rectangle {
            id: rect_email
            color: "#2e3436"
            border.width: profile_ti_email.activeFocus ? 2 : 1
            anchors.fill: parent
            border.color: "Orange"
            TextInput {
                id: profile_ti_email
                selectByMouse: true
                color: "#ffffff"
                validator: RegExpValidator {regExp:/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/}
                text: "string@domain.com"
                verticalAlignment: Text.AlignVCenter
                font.pixelSize: 12
                anchors.top: parent.top
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 8
                anchors.leftMargin: 8
                font.weight: Font.Normal
                anchors.left: parent.left
                anchors.rightMargin: 8
                font.family: "Tahoma"
                anchors.topMargin: 8
                onTextChanged: {
                    if (profile_ti_email.acceptableInput)
                        {
                           rect_email.border.color = "green"
                        }
                    else
                        {
                           rect_email.border.color = "red"
                        }
                }
                Keys.onReturnPressed: profile_ti_newpassword.forceActiveFocus()
                Keys.onTabPressed: profile_ti_newpassword.forceActiveFocus()
             }
        }
    }


    Label{
        id: infotext
        x: 8
        y: 250
        width: 217
        height: 14
        color: "Orange"
        text: "min. 6  Charakters"
        font.pixelSize: 12
        font.family: "Tahoma"
    }
    Label{
        id: infotext2
        x: 8
        y: 270
        width: 217
        height: 14
        text: qsTr("lower & upper case + spec. Charakters")
        color: "Orange"
        font.pixelSize: 12
        font.family: "Tahoma"
    }

    Item {
        id: item_newpassword
        x: 3
        y: 324
        height: 42
        anchors.right: parent.right
        anchors.leftMargin: 8
        anchors.left: parent.left
        anchors.rightMargin: 175
        antialiasing: true
        Rectangle {
            id: rect_newpassword
            color: "#2e3436"
            anchors.rightMargin: 0
            anchors.bottomMargin: 16
            anchors.leftMargin: 0
            anchors.topMargin: -16
            border.width: profile_ti_newpassword.activeFocus ? 2 : 1
            anchors.fill: parent
            border.color: "Orange"
            TextInput {
                id: profile_ti_newpassword              
                color: "#ffffff"
                text: "New Password"
                selectByMouse: true
                font.pixelSize: 12
                anchors.top: parent.top
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 8
                verticalAlignment: Text.AlignVCenter
                anchors.leftMargin: 8
                font.weight: Font.Normal
                anchors.left: parent.left
                font.capitalization: Font.MixedCase
                anchors.rightMargin: 8
                font.bold: false
                font.family: "Tahoma"
                anchors.topMargin: 8
                echoMode: TextInput.Password
                Keys.onReturnPressed: profile_ti_repeat.forceActiveFocus()
                Keys.onTabPressed:profile_ti_repeat.forceActiveFocus()
                validator: RegExpValidator {regExp:/^.*(?=.{8,})(?=.*[a-zA-Z])(?=.*\d)(?=.*[!#$%&? "]).*$/}
                onTextChanged: {
                    if (profile_ti_newpassword.acceptableInput)
                        {
                           rect_newpassword.border.color = "green" ;
                        }
                    else
                        {
                           rect_newpassword.border.color = "red";
                        }
                }
            }
        }
    }
    Item {
        id: item_repeat
        x: 12
        y: 372
        height: 42
        anchors.right: parent.right
        anchors.leftMargin: 8
        anchors.left: parent.left
        anchors.rightMargin: 175
        antialiasing: true
        Rectangle {
            id: rect_repeat
            color: "#2e3436"
            anchors.rightMargin: 0
            anchors.bottomMargin: 13
            anchors.leftMargin: 0
            anchors.topMargin: -13
            border.width: profile_ti_repeat.activeFocus ? 2 : 1
            anchors.fill: parent
            border.color: "Orange"
            TextInput {
                id: profile_ti_repeat
                selectByMouse: true
                color: "#ffffff"
                text: "Repeat Password"
                font.pixelSize: 12
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.right: parent.right
                anchors.bottomMargin: 8
                verticalAlignment: Text.AlignVCenter
                font.weight: Font.Normal
                anchors.leftMargin: 8
                anchors.left: parent.left
                font.capitalization: Font.MixedCase
                font.family: "Tahoma"
                font.bold: false
                anchors.rightMargin: 8
                anchors.topMargin: 8
                echoMode: TextInput.Password
                Keys.onReturnPressed: button_add_pic.forceActiveFocus()
                Keys.onTabPressed: button_add_pic.forceActiveFocus()

                onTextChanged: {
                    if (profile_ti_newpassword.text == profile_ti_repeat.text)
                        {
                           rect_repeat.border.color = "green" ;
                        }
                    else
                        {
                           rect_repeat.border.color = "red";
                        }
                }

            }  
        }
    }

    Rectangle {
        id: imageframe
        x: 247
        y: 77
        width: 140
        height: 150
        color: "#00000000"
        border.color: "Orange"
        border.width: button_add_pic.activeFocus ? 2:1
        Image {
            id: image
            y: 197
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 2
            anchors.left: parent.left
            anchors.leftMargin: 2
            anchors.right: parent.right
            anchors.rightMargin: 2
            anchors.top: parent.top
            anchors.topMargin: 2

        }
    }

    FileDialog {
        id: fileDialog
        title: "Please choose a file"
        folder: shortcuts.home
        nameFilters: [ "Image files (*.png *.jpg)" ]
        onAccepted: {
            image.source = fileDialog.fileUrl
            console.log("You chose: " + fileDialog.fileUrl)
            console.log("You chose: " + image.source)
                  console.log("?!" + image.sourceSize )
        }
        onRejected: {
            console.log("Canceled")
        }
    }

    Button {
        id: button_add_pic
        x: 282
        width: 70
        height: 70
        text: "New Pic"
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.rightMargin: 48
        anchors.topMargin: 233
        background: Rectangle{
            color: button_add_pic.down ? "Orange" : "#2e3436"
            radius: 100
            anchors.fill: parent
            implicitWidth: 70
            border.color: button_add_pic.down ? "Orange" : "Orange"
            implicitHeight: 70
            border.width: button_add_pic.activeFocus ? 2 : 1
        }
        contentItem: Text{
            y: 8
            height: 26
            color: button_add_pic.down ? "#2e3436" :  "Orange"
            text: "New"
            anchors.right: parent.right
            anchors.rightMargin: 0
            anchors.left: parent.left
            anchors.leftMargin: 0
            styleColor: "#f93434"
            horizontalAlignment: Text.AlignHCenter
            elide: Text.ElideRight
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 12
        }
        onClicked: {
            fileDialog.open()
        }
    }
    Button {
        id: button_pr_create
        x: 267
        y: 3
        width: 100
        height: 100
        text: "Create"
        visible: true
        anchors.topMargin: 576
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.rightMargin: 33
        background: Rectangle {
            color: button_pr_create.down ? "Orange" : "#2e3436"
            radius: 100
            border.width: button_pr_create.activeFocus ? 2 : 1
            border.color: button_pr_create.down ? "Orange" : "Orange"
            implicitWidth: 70
            implicitHeight: 70
            anchors.fill: parent
        }
        contentItem: Text {
            y: 8
            height: 26
            color: button_pr_create.down ? "#2e3436" :  "Orange"
            text: "Create"
            horizontalAlignment: Text.AlignHCenter
            anchors.left: parent.left
            font.pointSize: 15
            verticalAlignment: Text.AlignVCenter
            elide: Text.ElideRight
            styleColor: "#f93434"
            anchors.right: parent.right
            anchors.leftMargin: 0
            anchors.rightMargin: 0
        }
        onClicked: {

            userCTRL.Name = profile_ti_name.text
            userCTRL.Surname = profile_ti_surname.text
            userCTRL.Email = profile_ti_email.text
            userCTRL.Password = profile_ti_repeat.text
            userCTRL.ImageUrl = fileDialog.fileUrl
            console.log("userCTRL Image Data Log", userCTRL.ImageUrl)

            if(userCTRL.createProfile()){
                logedUserName = userCTRL.Name
                userID =userCTRL.getUserID(logedUserName)
                profile.visible = false
                q_BaseView.visible = true
                //passCTRL.loadData()
            }
        }
    }
    Button {
        id: button_pr_update
        x: 267
        y: 3
        width: 100
        height: 100
        text: "Update"
        visible: false
        anchors.topMargin: 576
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.rightMargin: 33
        background: Rectangle {
            color: button_pr_update.down ? "Orange" : "#2e3436"
            radius: 100
            border.width: button_pr_update.activeFocus ? 2 : 1
            border.color: button_pr_update.down ? "Orange" : "Orange"
            implicitWidth: 70
            implicitHeight: 70
            anchors.fill: parent
        }
        contentItem: Text {
            y: 8
            height: 26
            color: button_pr_update.down ? "#2e3436" :  "Orange"
            text: "Update"
            horizontalAlignment: Text.AlignHCenter
            anchors.left: parent.left
            font.pointSize: 15
            verticalAlignment: Text.AlignVCenter
            elide: Text.ElideRight
            styleColor: "#f93434"
            anchors.right: parent.right
            anchors.leftMargin: 0
            anchors.rightMargin: 0
        }
        onClicked: {
            userCTRL.Name = profile_ti_name.text
            userCTRL.Surname = profile_ti_surname.text
            userCTRL.Email = profile_ti_email.text
            userCTRL.Password = profile_ti_repeat.text
            if(userCTRL.updateProfile()){
                profile.visible = false
                button_pr_update.visible = false
                button_pr_delete.visible = false
                button_pr_create.visible = true
                q_BaseView.visible = true
            }
        }
    }

    Button {
        id: button_pr_delete
        x: 173
        y: 3
        width: 70
        height: 70
        text: "Delete"
        visible: false
        anchors.topMargin: 591
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.rightMargin: 157
        background: Rectangle {
            color: button_pr_delete.down ? "Orange" : "#2e3436"
            radius: 100
            border.width: button_pr_delete.activeFocus ? 2 : 1
            border.color: button_pr_delete.down ? "Orange" : "Orange"
            implicitWidth: 70
            implicitHeight: 70
            anchors.fill: parent
        }
        contentItem: Text {
            y: 8
            height: 26
            color: button_pr_delete.down ? "#2e3436" :  "Orange"
            text: "Delete"
            horizontalAlignment: Text.AlignHCenter
            anchors.left: parent.left
            font.pointSize: 13
            verticalAlignment: Text.AlignVCenter
            elide: Text.ElideRight
            styleColor: "#f93434"
            anchors.right: parent.right
            anchors.leftMargin: 0
            anchors.rightMargin: 0
        }
        onClicked: {
               userCTRL.deleteProfile()
               pwlistmodel.clear()
               loginView.visible = true
               profile.visible = false
            }
        }

    Button {
        id: button_pr_cancel
        x: 34
        y: -6
        width: 70
        height: 70
        text: "Cancel"
        visible: true
        anchors.topMargin: 591
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.rightMargin: 296
        background: Rectangle {
            color: button_pr_cancel.down ? "#f80000" : "#2e3436"
            radius: 100
            border.width: button_pr_cancel.activeFocus ? 2 : 1
            border.color: button_pr_cancel.down ? "#f80000" : "#f80000"
            implicitWidth: 70
            implicitHeight: 70
            anchors.fill: parent
        }
        contentItem: Text {
            y: 8
            height: 26
            color: button_pr_cancel.down ? "#2e3436" :  "#f80000"
            text: "Cancel"
            horizontalAlignment: Text.AlignHCenter
            anchors.left: parent.left
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 12
            elide: Text.ElideRight
            styleColor: "#f93434"
            anchors.right: parent.right
            anchors.leftMargin: 0
            anchors.rightMargin: 0
        }
        Keys.onReturnPressed: profile_ti_name.forceActiveFocus()
        Keys.onTabPressed: profile_ti_name.forceActiveFocus()

        onClicked: {
            profile.visible = false
            loginView.visible = true
        }
    }
    Button {
        id: button_pr_return
        x: 34
        y: -6
        width: 70
        height: 70
        text: "Return"
        visible: false
        anchors.topMargin: 591
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.rightMargin: 296
        background: Rectangle {
            color: button_pr_return.down ? "#f80000" : "#2e3436"
            radius: 100
            border.width: button_pr_return.activeFocus ? 2 : 1
            border.color: button_pr_return.down ? "#f80000" : "#f80000"
            implicitWidth: 70
            implicitHeight: 70
            anchors.fill: parent
        }
        contentItem: Text {
            y: 8
            height: 26
            color: button_pr_return.down ? "#2e3436" :  "#f80000"
            text: "Return"
            horizontalAlignment: Text.AlignHCenter
            anchors.left: parent.left
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 12
            elide: Text.ElideRight
            styleColor: "#f93434"
            anchors.right: parent.right
            anchors.leftMargin: 0
            anchors.rightMargin: 0
        }
        Keys.onReturnPressed: profile_ti_name.forceActiveFocus()
        Keys.onTabPressed: profile_ti_name.forceActiveFocus()

        onClicked: {
            profile.visible = false
            q_BaseView.visible = true
            button_pr_return.visible = true
        }
    }


    Label {
        id: infotext3
        x: 8
        y: 290
        width: 217
        height: 14
        color: "Orange"
        text: qsTr("")
        font.pixelSize: 12
        font.family: "Tahoma"
    }

    function laodProfile(){
         button_pr_update.visible = true
         button_pr_delete.visible = true
         button_pr_return.visible = true
         button_pr_create.visible = false
         button_pr_cancel.visible = false
         userCTRL.UserID = userID
         console.log("Current User ID",userCTRL.UserID)
         userCTRL.getProfile()
         profile_ti_name.text= userCTRL.Name
         profile_ti_surname.text = userCTRL.Surname
         profile_ti_email.text = userCTRL.Email
         profile_ti_newpassword.text = userCTRL.Password
         profile_ti_repeat.text = userCTRL.Password
    }

}
