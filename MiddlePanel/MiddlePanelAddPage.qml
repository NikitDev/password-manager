import QtQuick 2.15
import QtQuick.Controls 2.15

Rectangle {
    id: add_field
    width: 500
    height: 50
    property var text: ''
    property var fontSize: 15

    anchors {
        top: parent.top
        horizontalCenter: parent.horizontalCenter
    }

    TextField {
        id: kind
        width: 80
        height: 30
        verticalAlignment: TextInput.AlignVCenter
        horizontalAlignment: TextInput.AlignRight
        font.pixelSize: parent.fontSize
        antialiasing: true

        anchors {
            verticalCenter: parent.verticalCenter
            rightMargin: 10
            right: input_area.left
        }
        readOnly: true
        text: parent.text
    }
    TextField {
        id: input_area
        width: 250
        height: 30
        verticalAlignment: TextField.AlignVCenter
        font.pixelSize: parent.fontSize
        antialiasing: true

        background: Rectangle {
            color: iar.containsMouse ? 'gold': '#333'
            //radius: 2
            //implicitWidth: 100
            //implicitHeight: 24
            border.color: "#333"
            border.width: 2

            MouseArea {
                id: iar
                hoverEnabled: true
                anchors.fill: parent
            }
        }

        anchors {
            verticalCenter: parent.verticalCenter
            horizontalCenter: parent.horizontalCenter
            //left: kind.right
        }
    }
}
