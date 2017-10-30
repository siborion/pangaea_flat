import QtQuick 2.7
import QtQuick.Controls 1.5
import "../elements/"
Item
{
    id: main
    property string fonColor: "#EBECEC"
    property string devColor: "#5E5971"
    property bool editable: true
    property bool edit: true
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
                    text: "SAVE"
                    enabled: main.editable & main.edit
//                    opacity: enabled?1:0.5
                    onClicked: _core.setValue("save_change", (-1))
                }
            }

            Item
            {
                width:  parent.width
                height: parent.height/2
                MButton
                {
                    id: bComp
                    text: "COMP"
                    enabled:  main.edit
                    onClicked: {bComp.checked = main.editable; _core.setValue("comp", 0);}
                }
            }
        }
    }

    Connections
    {
        target: _core
    }
}
