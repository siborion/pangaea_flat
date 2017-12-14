import QtQuick 2.7
import QtQuick.Controls 2.2

Item
{
    id: main
    property int value: 0
    anchors.fill: parent
    Item
    {
        anchors.centerIn: parent
        width:  Math.min(parent.width, parent.height)*0.8
        height: Math.min(parent.width, parent.height)*0.8

        Image
        {
            anchors.fill: parent
            source: (value==4)?"cp_100_pa.svg":((value==3)?"cp_16m_pa.svg":"")
            sourceSize.width:  width
            sourceSize.height: height
        }
    }

    Connections
    {
        target: _core
        onSgReadValue:
        {
            if(nameParam==("type_dev"))
                main.value = value
        }
    }
}
