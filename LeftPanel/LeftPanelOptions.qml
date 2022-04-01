import QtQuick 2.15
import QtQuick.Controls 2.15


Text {
    id: left_column_option

    // PROPERTIES

    property color colorDefault: "gray"
    property color colorMouseOver: "#3c3939"
    property color colorPressed: "#601f1f"
    property var xValue: (parent.width / 2) - (width / 2)

    font.family: 'Roboto'
    font.pixelSize: 20
    text: parent.text
    antialiasing: true

    anchors {
        top: parent.top
        //topMargin: parent.topMargin
    } 

    color: malpp.pressed ? colorPressed: malpp.containsMouse ? colorMouseOver: colorDefault

    NumberAnimation on x {
        running: malpp.containsMouse
        from: xValue
        to: xValue + 5
        duration: 100
    }
    NumberAnimation on x {
        running: !malpp.containsMouse
        from: xValue
        to: xValue - 5
        duration: 100
    }
    
    MouseArea {
        id: malpp
        hoverEnabled: true
        anchors.fill: parent
        onClicked: {
            left_column_option.rotation = backend.val()
        }
    }
}
