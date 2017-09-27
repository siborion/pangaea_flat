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
        anchors.fill: parent
        header: "GT"
        Column
        {
            anchors.fill: parent
            Item
            {
                width:  parent.width
                height: parent.height/5*3
            }
            Item
            {
                width:  parent.width
                height: parent.height/5
                Dial
                {
                    name: "THRESH"

                }
            }
            Item
            {
                width:  parent.width
                height: parent.height/5
                Dial
                {
                    name: "VOLUME"
                }
            }
        }
    }
}
