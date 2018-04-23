Rectangle {
    width: 30;
    height: 30;
    color: hover.value ? (pressMixin.pressed ? "darkgray" : "lightgray") : "transparent";
    Behavior on background { ColorAnimation { duration: 200; } }
    
    MousePressMixin {
        id: pressMixin;
        onPressedChanged: {
        }
    }
    
    HoverMixin {
        id: hover;
    }
    
    Text {
        anchors.centerIn: parent;
        text: "B";
    }
}