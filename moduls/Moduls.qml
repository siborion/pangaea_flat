import QtQuick 2.7
import QtQuick.Controls 2.2


Item
{
    id: main
    property bool eqPost: true
    property bool irOn: ir.on
    anchors.fill: parent
    property int presetNom: 0
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
            id: iEr
            height: parent.height
            width:  row.widthWithoutSpase/15
            Er
            {
            }
        }
        Item
        {
            id: iPs
            height: parent.height
            width:  row.widthWithoutSpase/15
            Ps
            {
                id: ps
                onChPresence: pa.setPresence(value)
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
                parent: eqPost?iEqsMap:iPr
                presetNom: main.presetNom
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
                onChPresence: ps.setPresence(value)
            }
        }
        Item
        {
            id: iPr
            height: parent.height
            width:  row.widthWithoutSpase/15*(eqPost?1:5)
            Pr
            {
                id: pr
                parent: eqPost?iPr:iPa
            }
        }
        Item
        {
            id: iCm
            height: parent.height
            width:  row.widthWithoutSpase/15
            Cm
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

    function irEnable(val)
    {
        ir.setEnable(val)
    }

    Connections
    {
    target: _core
    onSgReadValue:
        {
        if(nameParam==("type_dev"))
            {
                pa.presentInDev = ((value===3)||(value===4));
                pr.presentInDev = ((value===1)||(value===3)||(value===4))
            }
        }  
    }
}
