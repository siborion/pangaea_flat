import QtQuick 2.7
import QtQuick.Controls 1.5

Item
{
    property bool on: false
    anchors.fill: parent
    id: main
    Row
    {
        id: row
        anchors.fill: parent
        spacing: 5
        property int widthWithoutSpase: width-spacing*12
        Item
        {
            height: parent.height
            width:  row.widthWithoutSpase/15
            Vl
            {
            }
        }
        Item
        {
            height: parent.height
            width:  row.widthWithoutSpase/15
            Rm
            {
            }
        }
        Item
        {
            height: parent.height
            width:  row.widthWithoutSpase/15
            Pr
            {
            }
        }
        Item
        {
            height: parent.height
            width:  row.widthWithoutSpase/15
            Lp
            {
            }
         }
        Item
        {
            height: parent.height
            width:  row.widthWithoutSpase/15*5
        }

        Item
        {
            height: parent.height
            width:  row.widthWithoutSpase/15
            Hp
            {
            }
        }
        Item
        {
            height: parent.height
            width:  row.widthWithoutSpase/15
            Ir
            {
            }
        }
        Item
        {
            height: parent.height
            width: row.widthWithoutSpase/15
            Pa
            {
            }
        }
        Item
        {
            height: parent.height
            width:  row.widthWithoutSpase/15
            F1
            {
            }
        }
        Item
        {
            height: parent.height
            width:  row.widthWithoutSpase/15
            Cp
            {
            }
        }
        Item
        {
            height: parent.height
            width:  row.widthWithoutSpase/15
            Gt
            {
            }
        }
    }
}
