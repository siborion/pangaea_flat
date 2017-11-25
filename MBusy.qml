import QtQuick 2.5
import QtQuick.Controls 2.2

Item
{
    property bool busy: false

    id : rWait
    width:  busy?(parent.width):0
    height: busy?(parent.height):0
    anchors.centerIn: parent

    BusyIndicator
    {
        id : bI
        visible: busy
        width:  busy?(parent.width/10):0
        height: busy?(parent.width/10):0
        anchors.centerIn: parent
        onVisibleChanged:
        {

        }
    }

    MouseArea
    {
        id : mWait
        enabled: busy
        anchors.fill: parent
        onEnabledChanged:
        {

        }
    }
}
