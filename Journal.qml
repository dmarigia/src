Item {
    id: journal;
    anchors.fill: parent;

    ListView {
        anchors.fill: parent;
        model: ListModel {
            ListElement {}
            ListElement {}
            ListElement {}
            ListElement {}
            ListElement {}
            ListElement {}
        }

        delegate: Rectangle {
            width: 100%;
            height: 100;
            border.width: 1;
            border.color: "#EAEAEA";
            radius: 5;
            Text {
                anchors.centerIn: parent;
                text: model.index;
            }
        }
    }
}