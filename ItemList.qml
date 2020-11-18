import QtQuick 2.0

// item list
ListView {
    id: root
    focus: true

    signal itemClicked(int itemIndex)

    delegate: Rectangle {
        width: root.width
        height: 20
        color: bgColor
        radius: index == root.currentIndex ? 4 : 0
        border.color: "black"
        border.width: index == root.currentIndex ? 2 : 0

        // icon
        Image {
            id: icon
            width: 20
            height: 20
            source: "qrc:///icons/" + iconIndex + ".png"
        }

        // item text
        Text {
            anchors.left: icon.right
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            text: name
            font.bold: index == root.currentIndex ? true : false
        }
    }

    // item click handler
    MouseArea {
        anchors.fill: root

        onClicked: {
            var idx = root.indexAt(mouseX, mouseY);
            root.currentIndex = idx;
            root.itemClicked(idx)
        }
    }
}
