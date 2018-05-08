Item {
    id: optionMenu;    
    anchors.centerIn: parent;
    Rectangle {
        anchors.horizontalCenter: triangle.horizontalCenter;
        height: columnMenu.height + 35;
        width: columnMenu.width + 50;
        radius: 4;
        effects.shadow.color: "#efefef";
		effects.shadow.blur: 10;
		effects.shadow.spread: 3;
        Column {
            id: columnMenu;        
            anchors.centerIn: parent;
            spacing: 15;
            Row {
                spacing: 10;
                Image {
                    source: "images/edit.png";
                    width: 20;
                    height: 20;
                    opacity: 0.4;
                }
                Text {
                    text: "Редактировать";
                }
            }
            Row {
                spacing: 10;
                Image {
                    source: "images/delete.png"; 
                    width: 20;
                    height: 20;
                    opacity: 0.4;
                }
                Text {
                    text: "Удалить";
                }
            }
        }
    }
    Rectangle {
        clip: true;
        anchors.top: parent.top;
        anchors.topMargin: -8; 
        anchors.horizontalCenter: parent.horizontalCenter;      
        id: triangle;
        width: 16;
        height: 16;
        rotation: 45;
        effects.shadow.y: -5;
        effects.shadow.x: -5;
        effects.shadow.color: "#efefef";
		effects.shadow.blur: 5;
		effects.shadow.spread: 3;
    }

}