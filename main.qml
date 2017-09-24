import QtQuick 2.7
import QtQuick.Controls 1.3

ApplicationWindow
{
    id: main
    visible: true
    height: 100
    width:  100

//    title: qsTr("AMT Pangaea " + devName + " v.0.3.1637b "  + portName + markConnect + " Bank " + mBank.nomBank + " Preset " + mPreset.nomPreset + markEdit)
//    color: compare?"Salmon":"aliceblue"


    Rectangle
    {
        id: rec
        anchors.centerIn: parent
        width:  parent.width/2
        height: parent.height/2
        color: "red"
        MouseArea
        {
            anchors.centerIn: parent
            width:  parent.width/2
            height: parent.height/2
            onClicked:
            {
                rec.color = "#a0b0c0"
            }
        }
    }
}




