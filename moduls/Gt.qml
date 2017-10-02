import QtQuick 2.7
import QtQuick.Controls 1.5
import "../elements/"

Item
{
    property bool on: false
    anchors.fill: parent
    id: main
    Common
    {
        id:common
        anchors.fill: parent
        header: "GT"
        Column
        {
            anchors.fill: parent
            Item
            {
                width:  parent.width
                height: parent.height/6*4
            }
            Item
            {
                width:  parent.width
                height: parent.height/6
                Dial
                {
                    enabled: common.on
                    name: "THRESH"
                }
            }
            Item
            {
                width:  parent.width
                height: parent.height/6
                Dial
                {
                    enabled: common.on
                    name: "VOLUME"
                }
            }
        }
    }
}
