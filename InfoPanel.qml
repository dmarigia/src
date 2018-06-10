Rectangle {
    id: infoPanel;
    fixed: app.mobile;
    z: 1;
    height: 70;
    anchors.left: parent.left;
    anchors.right: parent.right;
    color: "#5d6578";
    Row {
        anchors.verticalCenter: parent.verticalCenter;
        anchors.left: parent.left;
        anchors.leftMargin: 30;
        spacing: 10;
        MenuButtonMaterial {
            id: menuButton;
            visible: app.mobile;
            color: "transparent";
            colorIcon: "white";
            opacity: 0.4;
            onClicked: { leftPanel.active ? leftPanel.close() :  leftPanel.open() }
            Behavior on background { ColorAnimation { duration: 200; } }
        }
       
        Text {
            text: qsTr(app.pageName);
            font.pixelSize: 18;
            color: "#adb1ba";
        }
    }

    Row {
        spacing: 6;
        anchors.right: infoPanel.right;
        anchors.rightMargin: 30;
        anchors.verticalCenter: parent.verticalCenter;
        LanguageButton {
            opacity: 0.7;            
        }
        Image {
            source: "images/exit.png";
            height: 25;
            width: 25;
            opacity: 0.4;
            ColorIcon {
                anchors.fill: parent;
                source: parent.source;
                color: "white";
            }
        }
        Text {
            anchors.verticalCenter: parent
            text: qsTr("Выход");
            font.pixelSize: 15;
            color: "#adb1ba";
        }
    }
}
