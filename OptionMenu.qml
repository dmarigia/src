Item {
    id: optionMenu
    anchors.centerIn: parent

    ItemStyle {
        id: shadowEffect1
        effects.shadow.y: -5
        effects.shadow.x: -5
        effects.shadow.color: "#efefef"
        effects.shadow.blur: 5
        effects.shadow.spread: 3
    }

    Menu {
        anchors.horizontalCenter: triangle
        visible: true
        itemStyle: shadowEffect1
        menuMode: false
        width: 80;
        textRole: "modelData";

        

        MenuItem {
            Row {
            Image {
                source: "images/edit.png";
                width: 20;
                height: 20;
                opacity: 0.4;
            }
            Text {text: "Редактировать"
            onTriggered: {
                optionMenu.visible = false
            }}
            }
        }

        MenuItem {
            text: "Удалить"
            onTriggered: {
                optionMenu.visible = false
            }
        }
    }
    
    Rectangle {
        id: triangle
        clip: true
        anchors.top: parent.top
        anchors.topMargin: -8
        anchors.horizontalCenter: parent.horizontalCenter
        width: 16
        height: 16;
        rotation: 45;
        itemStyle: shadowEffect1
    }
}
