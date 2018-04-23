Rectangle {
    id: leftButton;
    height: 70;
    width: 100%;
    property string name;
    property string image;
    property string page;
    color: hover.value ? (pressMixin.pressed ? "darkgray" : "lightgray") : "transparent";
    Behavior on background { ColorAnimation { duration: 200; } }
    
    MousePressMixin {
        id: pressMixin;
        onPressedChanged: {
            if (this.pressed) app.page = leftButton.page;
        }
    }
    
    HoverMixin {
        id: hover;
    }
    
    Row {
        id: row;
        anchors.verticalCenter: parent.verticalCenter;
        spacing: 15;
        
        Image {
            height: 25;
            width: 25;
            source: "images/" + leftButton.image;
            opacity: 0.4;                        
        }
        Text {
            text: leftButton.name;
            anchors.verticalCenter: parent.verticalCenter;
            font.pixelSize: 16;
            color: "#212121";
            font.family: "century gothic";
        }
    }
}