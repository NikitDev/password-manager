import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import "../LeftPanel"
import "../MiddlePanel"


ApplicationWindow{

    id: window
    width: 1200
    height: 700
    visible: true
    title: qsTr('Password manager')

    flags: Qt.WindowCloseButtonHint | Qt.WindowMinimizeButtonHint | Qt.CustomizeWindowHit | Qt.MSWindowsFixedSizeDialogHint | Qt.WindowTitleHint


//LEFT COLUMN
    Rectangle {

        id: left_column

        width: window.width * 0.15
        height: window.height * 0.95
        color: '#e3e3e3'

        // LEFT COLUMN MENU
        LeftPanelOptions {text: 'pokaż hasła'; anchors.topMargin: 50}
        LeftPanelOptions {text: 'importy'; anchors.topMargin: 100}
        LeftPanelOptions {text: 'ustawienia'; anchors.topMargin: parent.height - 50}
        LeftPanelOptions {text: 'dodaj stronę'; anchors.topMargin: 150}

    }


//MIDDLE COLUMN
    Rectangle {
        id: middle_column

        width: window.width * 0.7
        height: window.height * 0.95
        color: '#d4d4d4'
        anchors.left: left_column.right

        //MIDDLE PANEL ADD PAGE
        MiddlePanelAddPage {text: 'e-mail'; anchors.topMargin: 50}
        MiddlePanelAddPage {text: 'login'; anchors.topMargin: 100}
        MiddlePanelAddPage {text: 'password'; anchors.topMargin: 150}
    }


//RIGHT COLUMN
    Rectangle {
        id: right_column

        width: window.width * 0.15
        height: window.height * 0.95
        color: '#e3e3e3'
        anchors.left: middle_column.right

    }


//BOTTOM COLUMN
    Rectangle {
        id: bottom_column
        width: window.width
        height: window.width * 0.05
        color: '#e3e3e3'
        anchors.top: left_column.bottom
    }

}
