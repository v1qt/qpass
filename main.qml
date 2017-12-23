import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import io.qt.mycontrolls.userctrl 1.0
import io.qt.mycontrolls.loginctrl 1.0
import io.qt.mycontrolls.passctrl 1.0
import "qml"

ApplicationWindow {
    id: applicationWindow
    visible: true
    maximumHeight: 800
    maximumWidth: 400
    width: 400
    height: 800
    color: "#2e3436"
    title: qsTr("QPass")

    property string logedUserName: ""
    property string logedUserLastName: ""
    property int userID: 0
    property int listID: 0

    UserCTRL{
        id: userCTRL
    }
    LoginCTRL{
        id: logi
    }
    PassCTRL{
        id: passCTRL
    }

    PWListModel{
        id: pwlistmodel
    }

    Login{
        id: loginView
        x: 0
        y: 0
        height: 800
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        visible: true

        Image {
            id: image
            x: 206
            y: 8
            width: 179
            height: 158
            clip: false
            fillMode: Image.PreserveAspectFit
            source: "images/qpass.png"
        }
    }

    Q_Base {
        id: q_BaseView
        x: 0
        y: 0
        width: 400
        height: 800
        visible: false
    }

    Profile {
        id: profile
        x: 0
        y: 0
        width: 400
        height: 800
        visible: false
        }


}

