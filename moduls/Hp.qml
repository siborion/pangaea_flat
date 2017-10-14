import QtQuick 2.7
import QtQuick.Controls 1.5
import "../elements/"

Item
{
    property string fonColor: "#EBECEC"
    property string devColor: "#5E5971"
    property string name:     "HP"

    property bool on: false
    anchors.fill: parent
    id: main
    Rectangle
    {
        anchors.fill: parent
        color: devColor
        MouseArea
        {
            anchors.fill: parent
            hoverEnabled: true
            cursorShape:  Qt.PointingHandCursor
            onClicked: main.on = (!main.on);
        }
        Column
        {
            anchors.fill: parent
            Item
            {
                width:  parent.width
                height: parent.height/1000*70
                Common
                {
                    id:common
                    anchors.fill: parent
                    header: name
                    on: main.on
                }
            }
            Item
            {
                width:  parent.width
                height: parent.height/1000*80
            }

            Item
            {
                width:  parent.width
                height: parent.height/1000*165
//                Dial
//                {
//                }
            }
            Item
            {
                width:  parent.width
                height: parent.height/1000*165
//                Dial
//                {
//                }
            }
            Item
            {
                width:  parent.width
                height: parent.height/1000*165
//                Dial
//                {
//                }
            }
            Item
            {
                width:  parent.width
                height: parent.height/1000*165
//                Dial
//                {
//                    enabled: main.on
//                    name: "THRESH"
//                }
            }
            Item
            {
                width:  parent.width
                height: parent.height/1000*165
                Dial
                {
                    enabled: main.on
                    name: "20 Hz 1k"
                    checkable: false
                }
            }
            Item
            {
                width:  parent.width
                height: parent.height/1000*25
            }
        }
    }
}
