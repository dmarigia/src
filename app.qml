/*** @using { src.PersonalPage } **/
/*** @using { src.Journal } **/

MainItem {
    id: app;
    anchors.fill: parent;
    color: "#BDBDBD";
    title: "Личный кабинет - " + pageName;
    property string page: "PersonalPage";
    property string pageName: "Личная информация"; // TODO: auto

    Rectangle {
        id: insideRect;
        color: "#f5f5f5";
        anchors.centerIn: parent;
        width: app.mobile ? app.width : app.width * 0.9;
        height: app.mobile ? app.height : app.height;
        clip: true;

        LeftPanel {
            id: leftPanel;
            z: 1;
            fixed: app.mobile;
        }
        LeftPanelWhiteBottom {}

        InfoPanel {
            id: infoPanel;
            effects.shadow.blur: 6;
        }

        Loader { // TODO: change container-like
            id: loader;
            source: "src." + app.page;
            anchors.top: infoPanel.bottom;
            anchors.bottom: parent.bottom;
            anchors.left: app.mobile ? parent.left : leftPanel.right;
            anchors.right: parent.right;
        }
    }

    // background for mobile menu
    Rectangle {
        anchors.fill: parent;
        color: "darkgray";
        opacity: 0.6;
        visible: leftPanel.active;
        fixed: true;
        MouseArea {
            anchors.fill: parent;
            onClicked: { leftPanel.close() }
        }
    }

    onMobileChanged: {
        if (!this.mobile) leftPanel.close()
    }

    // test config
    GlobalSettings {
        id: global; // TODO: rename to settings
        firstName: "Евгений";
        lastName: "Кошевой";
        middleName: "Викторович";
        avatarPath: "https://gordonua.com/img/article/2003/67_tn.jpg";
        job: "Комик";
    }

    MainItemDebug { visible: true; }
}
