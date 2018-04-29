Rectangle {
    width: 30;
    height: 30;
    visible: app.mobile;
    color: hover.value ? (pressMixin.pressed ? "darkgray" : "lightgray") : "transparent";
    Behavior on background { ColorAnimation { duration: 200; } }

    MousePressMixin {
        id: pressMixin;
        onPressedChanged: {
            if (!this.pressed) 
                leftPanel.active ? leftPanel.close() :  leftPanel.open()
        }
    }

    HoverMixin {
        id: hover;
    }

    Text {
        anchors.centerIn: parent;
        text: "☰";
    }
}