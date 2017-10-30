import QtQuick 2.7
import QtQuick.Controls 1.5
import "../elements/"
Item
{
    id: main
    property string fonColor: "#EBECEC"
    property string devColor: "#5E5971"
    property bool copyFirst: false
    anchors.fill: parent
    Rectangle
    {
        anchors.fill: parent
        color: devColor
        Column
        {
            anchors.fill: parent
            Item
            {
                width:  parent.width
                height: parent.height/2
                MButton
                {
                    text: "COPY"
                    enabled: editable
                    onClicked: {_core.setValue("copy", 0); copyFirst=true;}
                }
            }

            Item
            {
                width:  parent.width
                height: parent.height/2
                MButton
                {
                    text: "PAST"
                    enabled: editable & copyFirst
                    onClicked: _core.setValue("past", 0)
                }
            }
        }
    }
}
