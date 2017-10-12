import QtQuick 2.7
import QtQuick.Controls 1.5

Item
{
//    property bool on: false
    property bool eqPost: true
    anchors.fill: parent
    id: main
    Row
    {
        id: row
        anchors.fill: parent
        spacing: 2
        property int widthWithoutSpase: width-spacing*10
        Item
        {
            id: iVl
            height: parent.height
            width:  row.widthWithoutSpase/15
            Vl
            {
            }
        }
        Item
        {
            id: iRm
            height: parent.height
            width:  row.widthWithoutSpase/15
            Rm
            {
            }
        }
        Item
        {
            id: iPr
            height: parent.height
            width:  row.widthWithoutSpase/15
            Pr
            {
            }
        }
        Item
        {
            id: iLp
            height: parent.height
            width:  row.widthWithoutSpase/15
            Lp
            {
            }
         }
        Item
        {
            id: iEqs
            height: parent.height
            width:  row.widthWithoutSpase/15*(eqPost?5:1)
            Eqs
            {
                parent: eqPost?iEqs:iHp
            }
        }

        Item
        {
            id: iHp
            height: parent.height
            width:  row.widthWithoutSpase/15*(eqPost?1:5)
            Hp
            {
                parent: eqPost?iHp:iEqs
            }
        }
        Item
        {
            id: iIr
            height: parent.height
            width:  row.widthWithoutSpase/15
            Ir
            {
                id: ir
            }
        }
        Item
        {
            id: iPa
            height: parent.height
            width: row.widthWithoutSpase/15
            Pa
            {
                id: pa
            }
        }
        Item
        {
            id: iF1
            height: parent.height
            width:  row.widthWithoutSpase/15
            F1
            {
            }
        }
        Item
        {
            id: iCp
            height: parent.height
            width:  row.widthWithoutSpase/15
            Cp
            {
            }
        }
        Item
        {
            id: iGt
            height: parent.height
            width:  row.widthWithoutSpase/15
            Gt
            {
            }
        }
    }
}
