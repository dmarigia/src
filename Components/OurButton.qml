Rectangle {
    height: 70;
    width: ourButtonText.width + 20;
    property string text;
    property Color textColor: "black";
    color: hover.value ? (pressMixin.pressed ? "darkgray" : "lightgray") : "transparent";
    signal clicked;

    MousePressMixin {
        id: pressMixin;
        onPressedChanged: {
            if (!this.pressed) this.parent.clicked()
        }
    }

    HoverMixin {
        id: hover;
        cursor: "pointer";
    }

    Text {
        id: ourButtonText;
        anchors.centerIn: parent;
        text: parent.text;
        font.pixelSize: 14;
        color: parent.textColor;
    }
}