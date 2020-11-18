import QtQuick 2.14
import QtQuick.Window 2.14
import QtQuick.Controls 2.5

import DataIO 1.0

import "functions.js" as Funcs

Window {
    id: root
    width: 640
    height: 480
    visible: true
    title: qsTr("ListView Test")

    // data io conponent
    DataIO { id: dataIo }

    // define list model
    ListModel {
        id: lmodel

        // preset elements
        ListElement {
            name: "item1"
            iconIndex: 1
            bgColor: "white"
        }
        ListElement {
            name: "item2"
            iconIndex: 2
            bgColor: "red"
        }
        ListElement {
            name: "item3"
            iconIndex: 3
            bgColor: "blue"
        }
    }

    Row {
        id: layout
        spacing: 2

        // button panel
        ButtonPanel {
            width: root.width / 4
            height: root.height

            onAddClicked: {
                var iconIndex = Math.floor(Math.random(10) * 6) + 1;
                var name = "item" + (lmodel.count + 1);
                var bgColor = Funcs.randomColor();
                lmodel.append({ "name": name, "iconIndex": iconIndex, "bgColor": bgColor });
            }

            onRemoveClicked: {
                if (list.currentIndex >= 0)
                    lmodel.remove(list.currentIndex);
                list.update();
            }

            onSaveClicked: {
                var lsdata = [];
                for (var i = 0; i < lmodel.count; ++i) {
                    var t = JSON.stringify(lmodel.get(i));
                    lsdata.push(t);
                }
                dataIo.saveData(lsdata);
            }

            onLoadClicked: Funcs.loadListData()

            onClearClicked: lmodel.clear()
        }

        // listview
        ItemList {
            id: list
            width: root.width / 4 * 3
            height: root.height
            model: lmodel

            onItemClicked: console.log("clicked index = " + itemIndex)
        }
    }
}
