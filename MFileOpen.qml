import QtQuick 2.9
import QtQuick.Dialogs 1.2
import Qt.labs.folderlistmodel 2.2
import QtQuick.Controls 1.4

FileDialog
{
    title: "Select IR"
    nameFilters: [ "Wav files (*.wav)" ]
}
