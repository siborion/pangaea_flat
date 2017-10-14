import QtQuick 2.7
import QtQuick.Controls 1.5
import "../elements/"

Item
{
    property string fonColor: "#EBECEC"
    property string devColor: "#5E5971"

    id: main
    anchors.fill: parent
    Rectangle
    {
        anchors.fill: parent
        color: devColor
    }
}
