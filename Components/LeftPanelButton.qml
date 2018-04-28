Rectangle {
    id: leftButton;
    height: 70;
    width: 100%;
    property string name;
    property string image;
    property string page;
    color: hover.value ? (pressMixin.pressed ? "darkgray" : "lightgray") : "transparent";

    MousePressMixin {
        id: pressMixin;
        onPressedChanged: {
            app.page = leftButton.page
            app.pageName = leftButton.name
            leftPanel.active = false
        }
    }

    HoverMixin {
        id: hover;
        cursor: "pointer";
    }

    Row {
        id: row;
        anchors.verticalCenter: parent.verticalCenter;
        spacing: 15;

        Item {
            height: 1;
            width: 5;
        }

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