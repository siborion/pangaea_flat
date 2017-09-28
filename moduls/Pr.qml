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
        id: common
        anchors.fill: parent
        header: "PR"
        Column
        {
            anchors.fill: parent
            Item
            {
                width:  parent.width
                height: parent.height/5*4
            }

            Item
            {
                width:  parent.width
                height: parent.height/5
                Dial
                {
                    enabled: common.on
                    name: "PRESENCE"
                }
            }
        }
    }
}
