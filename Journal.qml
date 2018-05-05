Item {
    id: journal;
    anchors.fill: parent;
    
    Text {
        anchors.centerIn: parent;
        text: journalModel.count;
    }
    Button {
        width: 100; height: 50; color: "red";
        text: parent.kek;
        onClicked: { journal.kek += 20 }
        z: 1;
    }
    property int kek: 0;
    
    ListView {
        anchors.horizontalCenter: parent.horizontalCenter;
        width: Math.min(150 * 5 + 150 + parent.kek + 20, 100%);
        height: 100%;
        keyNavigationWraps: false;
        contentFollowsCurrentItem: false;
        model: ListModel {
            id: journalModel;
        }
        onCompleted: {
            this.style("overflow-x", "auto")
            var cost = 5.95
            for (var i = 0; i !== 30; ++i)
                journalModel.append({"cost": cost + i, "name": "Пицца"})
        }
        nativeScrolling: true;
        
        delegate: Row {
            id: delegateRow;
            height: 100;
            
            Rectangle {
                height: 100%;
                width: 150 + journal.kek;
                border.right.width: 1;
                border.right.color: "crimson";
                border.bottom.width: 1;
                border.bottom.color: "crimson";
                Text {
                    anchors.centerIn: parent;
                    text: model.index;
                }
            }
            Rectangle {
                height: 100%;
                width: 150;
                border.right.width: 1;
                border.right.color: "crimson";
                border.bottom.width: 1;
                border.bottom.color: "crimson";
                Text {
                    anchors.centerIn: parent;
                    text: qsTr(model.name);
                }
            }
            Rectangle {
                height: 100%;
                width: 150;
                border.right.width: 1;
                border.right.color: "crimson";
                border.bottom.width: 1;
                border.bottom.color: "crimson";
                Text {
                    anchors.centerIn: parent;
                    text: model.cost;
                }
            }
            Rectangle {
                height: 100%;
                width: 150;
                border.right.width: 1;
                border.right.color: "crimson";
                border.bottom.width: 1;
                border.bottom.color: "crimson";
                CheckboxInput{}
            }
            Rectangle {
                height: 100%;
                width: 150;
                border.right.width: 1;
                border.right.color: "crimson";
                border.bottom.width: 1;
                border.bottom.color: "crimson";
                CheckboxInput{}
            }
            Rectangle {
                height: 100%;
                width: 150;
                border.bottom.width: 1;
                border.bottom.color: "crimson";
                CheckboxInput{ anchors.centerIn: parent; }
            }
        }
    }
}