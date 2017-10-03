import QtQuick 2.7
import QtQuick.Controls 1.5
import "../elements/"

Item
{
    id: main
    anchors.fill: parent
    Row
    {
        anchors.fill: parent
        Item
        {
            width: parent.width/5
            height: parent.height
            Eq
            {
                dialFreq: "20 Hz 220"
            }
        }

        Item
        {
            width: parent.width/5
            height: parent.height
            Eq
            {
                dialFreq: "260 Hz 460"
            }
        }

        Item
        {
            width: parent.width/5
            height: parent.height
            Eq
            {
                dialFreq: "600 Hz 1k"
            }
        }

        Item
        {
            width: parent.width/5
            height: parent.height
            Eq
            {
                dialFreq: "1k Hz 3k"
            }
        }
        Item
        {
            width: parent.width/5
            height: parent.height
            Eq
            {
                dialFreq: "1k Hz 11k"
            }
        }
    }
}
