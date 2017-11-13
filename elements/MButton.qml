import QtQuick 2.7
import QtQuick.Controls 1.5
import "../elements/"

Item
{
    id: main
    property string fonColor: "#EBECEC"
    property string devColor: "#5E5971"
    property string text: text
    property int    value: 0
    property double scaleText: 1
    property bool  checked: false
    signal clicked();
    anchors.fill:  parent

    Rectangle
    {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter:  parent.verticalCenter
        width:  parent.width/1.5
        height: width/2
        radius: height/2
        color:  main.checked?"Salmon":fonColor
        clip: true

        MaterialButton
        {
            id: material
        }

        Text
        {
            anchors.fill:  parent
            font.family: "Arial Black"
            font.bold: true
            font.pixelSize: parent.height/2*scaleText
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment:   Text.AlignVCenter
            text: main.text
            color: devColor
            opacity: main.enabled?1:0.3
            Behavior on opacity  {NumberAnimation { duration:500 }}
        }
        MouseArea
        {
            anchors.fill:  parent
            hoverEnabled: true
            cursorShape: Qt.PointingHandCursor
            onClicked: {main.clicked(); material.start(mouseX, mouseY);}
        }
    }
}
