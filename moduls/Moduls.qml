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
            id: iEqsMap
            height: parent.height
            width:  row.widthWithoutSpase/15*(eqPost?5:1)
            EqsMap
            {
                id: eqsMap
                parent: eqPost?iEqsMap:iF1
            }
        }

        Item
        {
            id: iHp
            height: parent.height
            width:  row.widthWithoutSpase/15*1//(eqPost?1:5)
            Hp
            {
                id: hp
                parent: eqPost?iHp:iEqsMap
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
                parent: eqPost?iIr:iHp
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
                parent: eqPost?iPa:iIr
            }
        }
        Item
        {
            id: iF1
            height: parent.height
            width:  row.widthWithoutSpase/15*(eqPost?1:5)
            F1
            {
                id: f1
                parent: eqPost?iF1:iPa
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
