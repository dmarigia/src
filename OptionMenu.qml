Item {
    id: optionMenu
    anchors.centerIn: parent
    width: menu.width

    Menu {
        id: menu
        visible: true
        menuMode: false
        effects.shadow.color: "#efefef"
        effects.shadow.blur: 5
        effects.shadow.spread: 3
        z: 0

        MenuItem {
            position: AbstractButton.Left
            icon.source: "images/edit.png"
            icon.height: 20
            icon.width: 20
            icon.opacity: 0.4
            text: "Редагувати"
            onTriggered: {
                optionMenu.visible = false
            }
        }

        MenuItem {
            position: AbstractButton.Left
            icon.source: "images/delete.png"
            icon.height: 20
            icon.width: 20
            icon.opacity: 0.4
            text: "Видалити"
            onTriggered: {
                optionMenu.visible = false
            }
        }

        // MenuItem {
        //     id: menuItem3
        //     visible: false
        //     position: AbstractButton.Left
        //     icon.source: "images/delete.png"
        //     icon.height: 20
        //     icon.width: 20
        //     icon.opacity: 0.4
        //     text: "Перегляд завдань"
        //     onTriggered: {
        //         optionMenu.visible = false
        //     }
        // }
    }
    
    Triangle {
        anchors.top: menu;
        anchors.topMargin: -8;
        height: 8;
        effects.shadow.y: -5;
        effects.shadow.x: -5;
        effects.shadow.color: "#efefef";
        effects.shadow.blur: 5;
        effects.shadow.spread: 3;
    }
}
