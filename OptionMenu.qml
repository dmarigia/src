Item {
    id: optionMenu
    anchors.centerIn: parent
    width: menu.width

    Menu {
        id: menu
        anchors.horizontalCenter: parent
        visible: true
        menuMode: false
        effects.shadow.y: -5
        effects.shadow.x: -5
        effects.shadow.color: "#efefef"
        effects.shadow.blur: 5
        effects.shadow.spread: 3
        z: 0

        MenuItem {
            position: AbstractButton.Left
            icon.source: "images/edit.png"
            icon.height: 25
            icon.width: 25
            icon.opacity: 0.4
            text: "Редактировать"
            onTriggered: {
                optionMenu.visible = false
            }
        }

        MenuItem {
            position: AbstractButton.Left
            icon.source: "images/delete.png"
            icon.height: 25
            icon.width: 25
            icon.opacity: 0.4
            text: "Удалить"
            onTriggered: {
                optionMenu.visible = false
            }
        }
    }
    
    Triangle {
        anchors.top: parent;
        anchors.topMargin: -8;
        height: 8;
        effects.shadow.y: -5;
        effects.shadow.x: -5;
        effects.shadow.color: "#efefef";
        effects.shadow.blur: 5;
        effects.shadow.spread: 3;
    }
}
