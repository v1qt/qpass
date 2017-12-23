import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import QtQuick.Dialogs 1.0
import "."

Item {
    id: passView
    width: 400
    height: 525

    Rectangle{
        id: pw_mainFrame
        x: 0
        y: -8
        color: "#00000000"
        width: parent.width
        height: parent.height
        Rectangle{
            id: editRect
            width: 400
            height: 320
            color: "#00000000"
        }

        //Items Textfelder
        Item {
            id: item_pw_itemname
            x: -2
            y: 38
            width: 250
            height: 53
            anchors.rightMargin: 18
            antialiasing: true
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.leftMargin: 18
            Rectangle {
                id: rect_pw_itemname
                color: "#2e3436"
                anchors.rightMargin: 0
                anchors.bottomMargin: 0
                anchors.topMargin: 0
                anchors.leftMargin: 0
                border.width: ti_pw_itemname.activeFocus ? 2 : 1
                TextInput {
                    id: ti_pw_itemname
                    color: "#ffffff"
                    text: "Item Name"
                    font.family: "Tahoma"
                    font.capitalization: Font.MixedCase
                    anchors.rightMargin: 8
                    verticalAlignment: Text.AlignVCenter
                    anchors.bottomMargin: 8
                    font.bold: false
                    anchors.left: parent.left
                    anchors.topMargin: 8
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.leftMargin: 8
                    selectByMouse: true
                    anchors.bottom: parent.bottom
                    font.weight: Font.Normal
                    font.pixelSize: 12
                    readOnly: true
                    cursorVisible: false
                    onEditingFinished: passCTRL.itemName= ti_pw_itemname.text
                    Keys.onReturnPressed: ti_pw_username.forceActiveFocus()
                    Keys.onTabPressed: ti_pw_username.forceActiveFocus()
                }
                anchors.fill: parent
                border.color: "#ffa500"
            }
        }
        Item {
            id: item_pw_username
            x: -7
            y: 97
            width: 250
            height: 53
            anchors.right: parent.right
            anchors.leftMargin: 18
            anchors.left: parent.left
            anchors.rightMargin: 18
            antialiasing: true
            Rectangle {
                id: rect_pw_username
                color: "#2e3436"
                anchors.rightMargin: 0
                anchors.bottomMargin: 0
                anchors.leftMargin: 1
                anchors.topMargin: 0
                anchors.fill: parent
                border.width: ti_pw_username.activeFocus ? 2 : 1
                border.color: "Orange"
                TextInput {
                    id: ti_pw_username
                    selectByMouse: true
                    color: "#ffffff"
                    text: "Username"
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
                    Keys.onReturnPressed: ti_pw_password.forceActiveFocus()
                    Keys.onTabPressed: ti_pw_password.forceActiveFocus()
                    readOnly: true
                    onEditingFinished: passCTRL.nickName = ti_pw_username.text
                }
            }
        }
        Item {
            id: item_pw_password
            x: -1
            y: 156
            width: 250
            height: 53
            antialiasing: true
            anchors.leftMargin: 18
            Rectangle {
                id: rect_pw_password
                color: "#2e3436"
                anchors.fill: parent
                anchors.bottomMargin: 0
                border.color: "Orange"
                border.width: ti_pw_password.activeFocus ? 2 : 1
                anchors.leftMargin: 0
                TextInput {
                    id: ti_pw_password
                    color: "#ffffff"
                    text: "Passwort"
                    font.bold: false
                    anchors.top: parent.top
                    selectByMouse: true
                    verticalAlignment: Text.AlignVCenter
                    font.family: "Tahoma"
                    anchors.bottomMargin: 8
                    anchors.bottom: parent.bottom
                    font.capitalization: Font.MixedCase
                    anchors.leftMargin: 8
                    font.weight: Font.Normal
                    anchors.right: parent.right
                    anchors.left: parent.left
                    anchors.rightMargin: 8
                    font.pixelSize: 12
                    anchors.topMargin: 8
                    Keys.onReturnPressed: ti_pw_webdomain.forceActiveFocus()
                    Keys.onTabPressed: ti_pw_webdomain.forceActiveFocus()
                    readOnly: true
                    onEditingFinished: passCTRL.password = ti_pw_password.text
                }
                anchors.rightMargin: 0
                anchors.topMargin: 0
            }
            anchors.right: parent.right
            anchors.left: parent.left
            anchors.rightMargin: 18
        }
        Item {
            id: item_pw_webdomain
            x: -6
            y: 215
            width: 250
            height: 53
            antialiasing: true
            anchors.leftMargin: 18
            Rectangle {
                id: rect_pw_webdomain
                color: "#2e3436"
                anchors.fill: parent
                anchors.bottomMargin: 0
                border.color: "#ffa500"
                border.width: ti_pw_webdomain.activeFocus ? 2 : 1
                anchors.leftMargin: 0
                TextInput {
                    id: ti_pw_webdomain
                    color: "#ffffff"
                    text: "Web Domain"
                    font.bold: false
                    anchors.top: parent.top
                    selectByMouse: true
                    verticalAlignment: Text.AlignVCenter
                    font.family: "Tahoma"
                    anchors.bottomMargin: 8
                    anchors.bottom: parent.bottom
                    font.capitalization: Font.MixedCase
                    anchors.leftMargin: 8
                    font.weight: Font.Normal
                    anchors.right: parent.right
                    anchors.left: parent.left
                    anchors.rightMargin: 8
                    font.pixelSize: 12
                    anchors.topMargin: 8
                    readOnly: true
                    onEditingFinished: passCTRL.domain = ti_pw_webdomain.text
                    Keys.onReturnPressed: pview_btn_save.forceActiveFocus()
                    Keys.onTabPressed: pview_btn_save.forceActiveFocus()
                }
                anchors.rightMargin: 0
                anchors.topMargin: 0
            }
            anchors.right: parent.right
            anchors.left: parent.left
            anchors.rightMargin: 18
        }
        //Buttons
        Button {
                   id: pview_btn_save
                   x: 282
                   y: 339
                   width: 100
                   height: 100
                   visible: false
                   background: Rectangle {
                       id: rectsavebtn
                       x: 0
                       y: 1
                       width: parent.width
                       height: parent.height
                       color: pview_btn_save.down ? "Orange" : "#2e3436"
                       radius: 100
                       border.width: pview_btn_save.activeFocus ? 2 : 1
                       border.color: pview_btn_save.down ? "Orange" : "Orange"                 
                   }
                   contentItem: Text {
                       x: -7
                       y: 1
                       width: parent.width
                       height: parent.height
                       color: pview_btn_save.down ? "#2e3436" :  "Orange"
                       text: "Save"
                       font.pointSize: 14
                       horizontalAlignment: Text.AlignHCenter
                       verticalAlignment: Text.AlignVCenter
                       font.bold: false
                       styleColor: "#f93434"
                       elide: Text.ElideRight
                   }

                   onClicked:{
                       //achtung Daten müssen auch in andere Richtung in die Properties geladen werden, aus C++ Code heraus, esseidenn wie beim Login?!
                       console.log(" " +passCTRL.userId+
                                   " " +passCTRL.itemName +
                                   " " +passCTRL.nickName +
                                   " " +passCTRL.password +
                                   " " +passCTRL.domain)
                       passCTRL.saveEntry()
                       passCTRL.getEntryList()
                       pwlistmodel.clear()
                       loginView.loadListView()
                       rootList.currentIndex=0
                       setEditModeOff()
                       setFieldsDefault()

                   }
               }
        Button {
            id: pview_btn_edit
            x: 282
            y: 339
            width: 100
            height: 100
            background: Rectangle {
                id: recteditbtn
                x: 0
                y: 1
                width: parent.width
                height: parent.height
                color: pview_btn_edit.down ? "Orange" : "#2e3436"
                radius: 100
                border.width: pview_btn_edit.activeFocus ? 2 : 1
                border.color: pview_btn_edit.down ? "Orange" : "Orange"
                implicitHeight: 70
                implicitWidth: 70
            }
            contentItem: Text {
                x: -7
                y: 1
                width: parent.width
                height: parent.height
                color: pview_btn_edit.down ? "#2e3436" :  "Orange"
                text: "Edit"
                font.pointSize: 14
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.bold: false
                styleColor: "#f93434"
                elide: Text.ElideRight
            }
            onClicked:{

                if(ti_pw_itemname.readOnly ==true){
                    setEditModeOn()
                }
                else{
                    setEditModeOff()
                }
            }
        }

        Button {
                   id: pview_btn_update
                   x: 186
                   y: 349
                   width: 90
                   height: 90
                   visible: false
                   background: Rectangle {
                       id: rectupdatebtn
                       x: 0
                       y: 1
                       width: parent.width
                       height: parent.height
                       color: pview_btn_update.down ? "Orange" : "#2e3436"
                       radius: 100
                       border.width: pview_btn_update.activeFocus ? 2 : 1
                       border.color: pview_btn_update.down ? "Orange" : "Orange"                  
                   }
                   contentItem: Text {
                       x: -7
                       y: 1
                       width: parent.width
                       height: parent.height
                       color: pview_btn_update.down ? "#2e3436" :  "Orange"
                       text: "Update"
                       font.pointSize: 12
                       horizontalAlignment: Text.AlignHCenter
                       verticalAlignment: Text.AlignVCenter
                       font.bold: false
                       styleColor: "#f93434"
                       elide: Text.ElideRight
                   }

                   onClicked:{
                       //achtung Daten müssen auch in andere Richtung in die Properties geladen werden, aus C++ Code heraus, esseidenn wie beim Login?!

                       passCTRL.itemName = ti_pw_itemname.text
                       passCTRL.nickName = ti_pw_username.text
                       passCTRL.password = ti_pw_password.text
                       passCTRL.domain = ti_pw_webdomain.text
                       passCTRL.itemId = pwlistView.currentItemId
                       console.log(" " +passCTRL.userId+
                                   " " +passCTRL.itemId+
                                   " " +passCTRL.itemName +
                                   " " +passCTRL.nickName +
                                   " " +passCTRL.password +
                                   " " +passCTRL.domain)


                       //Evtl Validieren?!?!
                            passCTRL.updateEntry()
                            passCTRL.getEntryList()
                            pwlistmodel.clear()
                            loginView.loadListView()
                            rootList.currentIndex=0
                            setEditModeOff()
                            setFieldsDefault()
                      // alert("Update fehlgeschlagen")

                   }
               }
        Button {
            id: pview_btn_delete
            x: 100
            y: 359
            width: 80
            height: 80
            visible: false
                   background: Rectangle {
                       id: rectdeletebtn
                       x: 0
                       y: 1
                       width: parent.width
                       height: parent.height
                       color: pview_btn_delete.down ? "Orange" : "#2e3436"
                       radius: 100
                       border.width: pview_btn_delete.activeFocus ? 2 : 1
                       border.color: pview_btn_delete.down ? "Orange" : "Orange"
                   }
                   contentItem: Text {
                       x: -7
                       y: 1
                       width: parent.width
                       height: parent.height
                       color: pview_btn_delete.down ? "#2e3436" :  "Orange"
                       text: "Delete"
                       font.pointSize: 12
                       horizontalAlignment: Text.AlignHCenter
                       verticalAlignment: Text.AlignVCenter
                       font.bold: false
                       styleColor: "#f93434"
                       elide: Text.ElideRight
                   }
                   onClicked:{
                       passCTRL.itemId = pwlistView.currentItemId
                       console.log("to Delete user ID: " +passCTRL.userId+
                                   "to Delete item ID: " +passCTRL.itemId)
                        passCTRL.deleteEntry()
                        passCTRL.getEntryList()
                        pwlistmodel.clear()
                        loginView.loadListView()
                        rootList.currentIndex=0
                        setFieldsDefault()
                        setEditModeOff()
                   }
                }

        Button {
            id: button_pr_cancel
            x: 24
            y: 6
            width: 70
            height: 70
            background: Rectangle {
                color: button_pr_cancel.down ? "#f93434" : "#2e3436"
                radius: 100
                width: parent.width
                height: parent.height
                border.color: "#f93434"
                border.width: button_pr_cancel.activeFocus ? 2 : 1
                anchors.fill: parent
            }
            contentItem: Text {
                y: 9
                width: parent.width
                height: parent.height
                color: button_pr_cancel.down ? "#2e3436" :  "#f93434"
                text: "Cancel"
                styleColor: "#f93434"
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                anchors.rightMargin: 0
                font.pointSize: 10
                elide: Text.ElideRight
                anchors.left: parent.left
                anchors.right: parent.right  
                anchors.leftMargin: 0
            }
            anchors.topMargin: 369
            anchors.rightMargin: 306
            anchors.right: parent.right
            anchors.top: parent.top
            onClicked: {
                setEditModeOff()
                pview_btn_save.visible = false
                pview_btn_update.visible = false
                pview_btn_edit.visible = true
                rootList.currentIndex = 0
            }
        }
    }
    //Java Script Funktionen
    function populatePasswordView(){
        ti_pw_itemname.text = passCTRL.itemName
        ti_pw_username.text = passCTRL.nickName
        ti_pw_password.text = passCTRL.password
        ti_pw_webdomain.text = passCTRL.domain
    }
    function setEditModeOff(){
            ti_pw_itemname.readOnly = true
            ti_pw_itemname.cursorVisible= false

            ti_pw_username.readOnly = true
            ti_pw_username.cursorVisible= false

            ti_pw_password.readOnly = true
            ti_pw_password.cursorVisible= false

            ti_pw_webdomain.readOnly = true
            ti_pw_webdomain.cursorVisible= false

            editRect.color = "#00000000"
            pview_btn_update.visible = false
            pview_btn_save.visible = false
            pview_btn_delete.visible = false
            pview_btn_edit.visible = true
    }
    function setEditModeOn(){
             ti_pw_itemname.readOnly = false
             ti_pw_itemname.cursorVisible = true

             ti_pw_username.readOnly = false
             ti_pw_username.cursorVisible= true

             ti_pw_password.readOnly = false
             ti_pw_password.cursorVisible= true

             ti_pw_webdomain.readOnly = false
             ti_pw_webdomain.cursorVisible= true

             editRect.color = "Orange"
             pview_btn_update.visible = true
             pview_btn_save.visible = false
             pview_btn_delete.visible = true
    }
    function setCreateMode(){

             ti_pw_itemname.readOnly = false
             ti_pw_itemname.cursorVisible = true

             ti_pw_username.readOnly = false
             ti_pw_username.cursorVisible= true

             ti_pw_password.readOnly = false
             ti_pw_password.cursorVisible= true

             ti_pw_webdomain.readOnly = false
             ti_pw_webdomain.cursorVisible= true

             editRect.color = "Orange"
             pview_btn_update.visible = false
             pview_btn_save.visible = true
             pview_btn_delete.visible = false
             pview_btn_edit.visible = false
    }
    function setFieldsDefault(){
        ti_pw_itemname.text = "New Item Name"
        ti_pw_username.text = "New Nick Name"
        ti_pw_password.text = "New Password"
        ti_pw_webdomain.text = "New Domain"
    }
}
