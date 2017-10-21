import QtQuick 2.5
import QtQuick.Controls 1.4

Item
{
    signal sgSetDrive(string drive);

   id: iMain
   anchors.fill: parent

    ListView
    {
        id: listView1
        anchors.fill: parent

        orientation: ListView.Horizontal
        //        orientation: ListView.Vertical

        delegate: Item
        {
            id: item
//            anchors.left: parent.left
//            anchors.right: parent.right
            anchors.top:    parent.top
            anchors.bottom: parent.bottom

            width: 50

            Button
            {
                anchors.fill: parent
                anchors.margins: 5
                /* самое интересное в данном объекте
                 * задаём свойству text переменную, по имени которой будем задавать
                 * свойства элемента
                 * */
                text: idshnik

                // По клику по кнопке отдаём в текстовое поле индекс элемента в ListView
                onClicked:
                {
                    iMain.sgSetDrive(idshnik);
//                    sgSetDrive("C:/");
//                    textIndex.text = index
                }
            }
        }

        model: ListModel
        {
            id: listModel // задаём ей id для обращения
        }
    }


    function refreshDrivers()
    {
        var txt;
        var i;
        listModel.clear();
        txt = _core.getDrivers();
        for(i=0; i<txt.length; i++)
        {
            listModel.append({idshnik: txt[i]})
        }
    }
}
