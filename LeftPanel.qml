Rectangle {
    id: panel;
    anchors.top: infoPanel.bottom;
    height: 100% - infoPanel.height;
    width: app.mobile ? 0.7 * parent.width : 250;
    color: "white";
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
    }

    Timer {
        id: disableAnimation;
        interval: 101;
        onTriggered: { leftPanelAnim.duration = 0 }
    }

    Rectangle {
        anchors.right: parent.right;
        height: panel.height;
        width: 1; 
        color: "#f5f5f5";   
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
        source: global.avatarPath;
        visible: global.avatarPath !== "";
        RadiusMixin { leftTop: parent.height / 2; leftBottom: parent.height / 2;  rightTop: 0;  rightBottom: parent.height / 2;  }
        fillMode: Image.PreserveAspectCrop;
    }

    Text {
        id: name;
        anchors.top: avatar.top;
        anchors.topMargin: 70;
        //anchors.horizontalCenter: parent.horizontalCenter;
        text: global.name;
        font.pixelSize: 18;
        color: "#212121";
        font.bold: true;
        font.family: "century gothic";
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
        text: global.job;
        font.pixelSize: 15;
        color: "#757575";
        font.family: "century gothic";
        anchors.left: parent.left;
        anchors.leftMargin: 20;
    }

    Column { 
        anchors.top: post.top;
        anchors.topMargin: 80;
        width: 100%;

        Rectangle {
            height: 1;
            width: panel.width;
            color: "#f5f5f5";
        }

        LeftPanelButton {
            name: "Личная информация";
            image: "account36.png";
            page: "PersonalPage";
        }

        Rectangle {
            height: 1;
            width: panel.width;
            color: "#f5f5f5";
        }

        LeftPanelButton {
            name: "Журнал заданий";
            image: "todo.png";
            page: "Journal";
        }

        Rectangle {
            height: 1;
            width: panel.width;
            color: "#f5f5f5";
        }

        LeftPanelButton {
            name: "Статистика";
            image: "statistics.png";
            page: "Statistics";
        }

        Rectangle {
            height: 1;
            width: panel.width;
            color: "#f5f5f5";
        }

        LeftPanelButton {
            name: "Отчеты pdf";
            image: "docs.png";
            page: "Docs";
        }

        Rectangle {
            height: 1;
            width: panel.width;
            color: "#f5f5f5";
        }
    }
}
