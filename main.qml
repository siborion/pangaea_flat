import QtQuick 2.7
import QtQuick.Controls 1.3
import "moduls/"

ApplicationWindow
{
    id: main
    visible: true
    height: 520
    width:  1104
    color: "#EBECEC"
    property int presetNom: head.presetNom
    Column
    {
        anchors.fill: parent
        spacing: 2
        Item
        {
            width:  parent.width
            height: parent.height/1000*150
            Head
            {
                id: head

            }
        }
        Item
        {
            width:  parent.width
            height: parent.height/1000*850
            Moduls
            {
                id: moduls
                eqPost: head.eqPost
                presetNom: main.presetNom
            }
        }
    }
}




