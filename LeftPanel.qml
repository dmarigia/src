Rectangle {
    id: panel;
    anchors.top: infoPanel.bottom;
    // TODO: сделать адекватно :)
    height: Math.max(app.height - infoPanel.height, leftPanelColumn.height + avatar.height + name.height + 70 + post.height + 5 + 80);
    width: app.mobile ? 0.7 * parent.width : personalInfoButton.rowWidth + 40;
    color: "#FBFCFD";
    property bool active: false;
    x: active || !app.mobile ? 0 : -width;
    Behavior on x { Animation { id: leftPanelAnim; duration: 0; } }
    clip: true;

    function open() {
        leftPanelAnim.duration = 100
        this.active = true
    }

    function close() {
        this.active = false
        disableAnimation.start()
        menuButton.deactivate()
    }

    Timer {
        id: disableAnimation;
        interval: 101;
        onTriggered: { leftPanelAnim.duration = 0 }
    }

    Image {
        id: avatar;
        anchors.top: parent.top;
        anchors.topMargin: 50;
        source: "images/avatarbig.png";
        opacity: 0.4; 
        height: 50;
        width: 50;
        anchors.left: parent.left;
        anchors.leftMargin: 20;
    }

    Image {
        anchors.fill: avatar;
        source: settings.avatarPath;
        visible: settings.avatarPath !== "";
        RadiusMixin { leftTop: parent.height / 2; leftBottom: parent.height / 2;  rightTop: 0;  rightBottom: parent.height / 2;  }
        fillMode: Image.PreserveAspectCrop;
        
        Border {
            width: 2;
            color: "#5d6578";
        }
    }

    Text {
        id: name;
        anchors.top: avatar.top;
        anchors.topMargin: 70;
        //anchors.horizontalCenter: parent.horizontalCenter;
        text: settings.name;
        font.pixelSize: 18;
        color: "#212121";
        font.bold: true;
        anchors.left: parent.left;
        anchors.leftMargin: 20;
        anchors.right: parent.right;
        anchors.rightMargin: 20;
        wrapMode: Text.Wrap;
    }

    Text {
        id: post;
        anchors.top: name.bottom;
        anchors.topMargin: 5;
        //anchors.horizontalCenter: parent.horizontalCenter;
        text: "Адміністратор";
        // text: settings.role === GlobalSettings.Admin ? qsTr("Адміністратор") : (settings.role === GlobalSettings.Head ?
        //                 qsTr("Керівник") : qsTr("Аспірант"));
        font.pixelSize: 15;
        color: "#757575";
        anchors.left: parent.left;
        anchors.leftMargin: 20;
    }

    Column {
        id: leftPanelColumn;
        anchors.top: post.top;
        anchors.topMargin: 80;
        width: 100%;

        Rectangle {
            height: 2;
            width: panel.width;
            color: "#FBFCFD";
        }

        LeftPanelButton {
            id: personalInfoButton;
            name: qsTr("Личная информация");
            image: "account36.png";
            page: "PersonalPage";
        }

        Rectangle {
            height: 2;
            width: panel.width;
            color: "#FBFCFD";
        }

        LeftPanelButton {                 
            name: qsTr("Список користувачів");
            image: "users.png";
            page: "Employee";
        }       

        Rectangle {
            height: 2;
            width: panel.width;
            color: "#FBFCFD";
        }

        LeftPanelButton {
            name: qsTr("Журнал заданий");
            image: "todo.png";
            page: "Journal";
        }

        Rectangle {
            height: 2;
            width: panel.width;
            color: "#FBFCFD";
        }

        LeftPanelButton {
            name: qsTr("Статистика");
            image: "statistics.png";
            page: "Statistics";
        }

        Rectangle {
            height:2;
            width: panel.width;
            color: "#FBFCFD";
        }

        // LeftPanelButton {
        //     name: qsTr("Отчеты pdf");
        //     image: "docs.png";
        //     page: "Reports";
        // }

        // Rectangle {
        //     height: 2;
        //     width: panel.width;
        //     color: "#FBFCFD";
        // }
    }

    Rectangle {
        width: 2;
        height: 100%
        color: "#f5f5f9"
        anchors.right: parent.right
    }
}
