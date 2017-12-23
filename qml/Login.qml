import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import io.qt.mycontrolls.loginctrl 1.0
import "."


Item {
    id: loginfields
    width: 400
    height: 800
    visible: true



    Label {
        id: label_user
        y: 197
        height: 30
        text: qsTr("User Name")
        verticalAlignment: Text.AlignVCenter
        anchors.left: parent.left
        anchors.leftMargin: 65
        anchors.right: parent.right
        anchors.rightMargin: 185
        font.family: "Verdana"
        fontSizeMode: Text.FixedSize
        font.pointSize: 14
        font.weight: Font.Normal
        color: "Orange"
    }

    Item {
        id: username
        y: 241
        height: 50
        anchors.right: parent.right
        anchors.rightMargin: 65
        anchors.left: parent.left
        anchors.leftMargin: 65
        antialiasing: true

             Rectangle {
                id: rectusername
                y: 0
                height: 50
                color: "#2e3436"
                border.width: inputname.activeFocus ? 2 : 1
                anchors.left: parent.left
                anchors.leftMargin: 0
                anchors.right: parent.right
                anchors.rightMargin: 0
                border.color: "Orange"

                TextInput {
                    id: inputname
                    x: 8
                    y: 8
                    width: 254
                    height: 34
                    selectByMouse: true
                    color: "#ffffff"
                    font.weight: Font.Light
                    font.family: "Tahoma"
                    font.capitalization: Font.MixedCase
                    font.pixelSize: 25
                    font.bold: true
                    maximumLength: 16
                    selectionColor: "#ff9e24"
                    KeyNavigation.tab: rectpassword
                    activeFocusOnPress: true
                    Keys.onReturnPressed: inputpassw.forceActiveFocus()
                    Keys.onTabPressed: inputpassw.forceActiveFocus()

                }
        }

    }

    Label {
        id: label_passw
        y: 312
        height: 30
        text: qsTr("Password")
        verticalAlignment: Text.AlignVCenter
        anchors.right: parent.right
        anchors.rightMargin: 185
        anchors.left: parent.left
        anchors.leftMargin: 65
        fontSizeMode: Text.FixedSize
        font.family: "Verdana"
        font.pointSize: 14
        font.weight: Font.Normal
        color: "Orange"
    }
    Item {
        id: password
        y: 353
        height: 50
        anchors.right: parent.right
        anchors.rightMargin: 65
        anchors.left: parent.left
        anchors.leftMargin: 65

        Rectangle {
            id: rectpassword
            y: 0
            height: 50
            color: "#2e3436"
            border.width: inputpassw.activeFocus ? 2 : 1
            anchors.right: parent.right
            anchors.rightMargin: 0
            anchors.left: parent.left
            anchors.leftMargin: 0
            border.color: "Orange"
            NumberAnimation { property: "scale"; easing.type: Easing.OutExpo; from: 1.0; to:0; duration: 800 }
            TextInput {
                id: inputpassw
                x: 8
                y: 8
                width: 254
                height: 34
                selectByMouse: true
                color: "#ffffff"
                selectionColor: "#ff9e24"
                font.pixelSize: 25
                font.bold: true               
                cursorVisible: false
                font.weight: Font.Light
                echoMode: TextInput.Password
                maximumLength: 16
                KeyNavigation.tab: loginbutton
                activeFocusOnPress: true
                Keys.onReturnPressed: loginbutton.forceActiveFocus()
                Keys.onTabPressed: loginbutton.forceActiveFocus()
            }
        }
    }
    Button {
        id: loginbutton
        x: 209
        width: 100
        height: 100
        enabled: true
        anchors.right: parent.right
        anchors.rightMargin: 91
        anchors.top: parent.top
        anchors.topMargin: 430
        checked: false
        checkable: false
        contentItem: Text {
              y: 12
              height: 76
              color: loginbutton.down ? "#2e3436" :  "Orange"
              text: "Login"
              anchors.left: parent.left
              anchors.leftMargin: 0
              anchors.right: parent.right
              anchors.rightMargin: 0
              font.weight: Font.Normal
              font.bold: false
              font.pointSize: 15
              styleColor: "#f93434"
              horizontalAlignment: Text.AlignHCenter
              verticalAlignment: Text.AlignVCenter
              elide: Text.ElideRight
          }
        background: Rectangle {
              id: rectloginbtn
              implicitWidth: 100
              implicitHeight: 100
              color: loginbutton.down ? "Orange" : "#2e3436"
              border.color: loginbutton.down ? "Orange" : "Orange"
              border.width: loginbutton.activeFocus ? 2 : 1
              radius: 100
           }
        onClicked: {

            logi.userName = inputname.text
            logi.password = inputpassw.text
             if(logi.verifyUser())
                {

                    logedUserName =  logi.userName
                    userID=logi.getUserID()
                    passCTRL.userId = userID
                    console.log("User ID an passCTRL übergeben", passCTRL.userId )
                    passCTRL.getEntryList()
                    console.log("Einträge geholt mit Anzahl = ", passCTRL.entryCounter)
                    pwlistmodel.clear()
                    //pwlistmodel.insert(0,{ "itemname": passCTRL.getItemNameAt(0),"itemid": passCTRL.getItemIdAt(0)})
                    loadListView()
                    q_BaseView.setPassListIndex()
                    console.log("Funktion Lade in Liste ausgeführt ! ")
                    loginView.visible = false
                    q_BaseView.visible = true
                    verifyLabel.visible = false

                }
                else
                verifyLabel.visible = true
            }
    }
    Label{
        id:verifyLabel
        x: 69
        y: 430
        text: qsTr("Login Failed!")
        color: "red"
        width: 100
        height: 40
        visible: false

    }
    Button {
        id: createbutton
        x: 89
        width: 80
        height: 80
        anchors.right: parent.right
        anchors.rightMargin: 231
        anchors.top: parent.top
        anchors.topMargin: 499
        contentItem: Text {
            y: 9
            height: 52
            color: createbutton.down ? "##2e3436" :  "Orange"
            text: "Create"
            anchors.right: parent.right
            anchors.rightMargin: 0
            anchors.left: parent.left
            anchors.leftMargin: 0
            font.bold: false
            font.pointSize: 11
            styleColor: "#f93434"
            horizontalAlignment: Text.AlignHCenter
              verticalAlignment: Text.AlignVCenter
              elide: Text.ElideRight
        }
        background: Rectangle {
            id:rectcreatebtn
            x: 0
            y: 0
            implicitWidth: 80
            implicitHeight: 80
            color: createbutton.down ? "Orange" : "#2e3436"
            border.color: createbutton.down ? "Orange" : "Orange"
            border.width: createbutton.activeFocus ? 2 : 1
            radius: 100
        }

        onClicked: {
                    loginView.visible = false
                    profile.visible = true

        }

    }
    Label {
        id: label_valid
        x: -8
        height: 30
        text: qsTr("")
        anchors.top: parent.top
        anchors.topMargin: 417
        verticalAlignment: Text.AlignVCenter
        font.family: "Verdana"
        fontSizeMode: Text.HorizontalFit
        anchors.left: parent.left
        font.weight: Font.ExtraLight
        font.pointSize: 14
        anchors.leftMargin: 65
        anchors.rightMargin: 197
        anchors.right: parent.right
    }
    Button {
        id: quit
        x: 193
        y: -3
        width: 70
        height: 70
        anchors.topMargin: 575
        anchors.top: parent.top
        anchors.right: parent.right
        background: Rectangle {
            id: rectquitbtn
            x: 0
            y: 0
            color: quit.down ? "#f80000" : "#2e3436"
            radius: 100
            border.width:  quit.activeFocus ? 2 : 1
            border.color: quit.down ? "#f80000" : "#f80000"
            implicitWidth: 70
            implicitHeight: 70
        }
        anchors.rightMargin: 137
        contentItem: Text {
            y: 12
            height: 48
            color: quit.down ? "#2e3436" :  "#f80000"
            text: "Quit"
            anchors.left: parent.left
            anchors.leftMargin: 0
            anchors.right: parent.right
            anchors.rightMargin: 0
            font.bold: false
            horizontalAlignment: Text.AlignHCenter
            font.pointSize: 11
            verticalAlignment: Text.AlignVCenter
            elide: Text.ElideRight
            styleColor: "#f93434"
        }
        Keys.onReturnPressed: inputname.forceActiveFocus()
        Keys.onTabPressed: inputname.forceActiveFocus()

        onClicked: {
            Qt.quit()
        }       
    }

    function loadListView()
    {
        for(var i=0;i<=(passCTRL.entryCounter)-1;i++){
            pwlistmodel.insert(0,{ "itemname": passCTRL.getItemNameAt(i),"itemid": passCTRL.getItemIdAt(i)})
        }

        return 1;
    }


}
