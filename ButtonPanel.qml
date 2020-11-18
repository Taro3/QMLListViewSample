import QtQuick 2.12
import QtQuick.Controls 2.5

// define test buttons.
Rectangle {
    id: root
    color: 'teal'

    // signals
    signal addClicked
    signal removeClicked
    signal saveClicked
    signal loadClicked
    signal clearClicked

    Column {
        id: buttonArea
        padding: 2
        spacing: 2
        anchors.fill: parent

        // item add button
        Button {
            id: buttonAddItem
            width: parent.width - 4
            height: 20
            text: '&Add Item'
            onClicked: root.addClicked()
        }

        // item remove button
        Button {
            id: buttonRemoveItem
            width: parent.width - 4
            height: 20
            text: '&Remove Item'
            onClicked: root.removeClicked()
        }

        // save list
        Button {
            id: buttonSave
            width: parent.width - 4
            height: 20
            text: '&Save List'
            onClicked: root.saveClicked()
        }

        // load list
        Button {
            id: buttonLoad
            width: parent.width - 4
            height: 20
            text: '&Load List'
            onClicked: root.loadClicked()
        }

        // clear list
        Button {
            id: buttonClear
            width: parent.width - 4
            height: 20
            text: '&Clear List'
            onClicked: root.clearClicked()
        }
    }
}
