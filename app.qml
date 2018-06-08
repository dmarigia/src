/*** @using { src.PersonalPage } **/
/*** @using { src.Journal } **/
/*** @using { src.Employee } **/
/*** @using { src.OptionMenu } **/
/*** @using { src.EdContactInfo } **/
/*** @using { src.EditUser } **/
/*** @using { src.Statistics } **/
/*** @using { src.Reports } **/

MainItem {
    id: app;
    anchors.fill: parent;
    property bool disableBackend: true;

    color: "#e7eaef";
    title: qsTr("Личный кабинет") + " - " + pageName;
    property string page: "PersonalPage";
    property string pageName: qsTr("Личная информация"); // TODO: auto

    // transform.rotateX: 20;
    // transform.rotateY: 110;
    // transform.rotateZ: 30;
    // Behavior on transform { Animation { duration: 4000; } }
    // Timer {
    //     running: true;
    //     onTriggered: {
    //         this.parent.transform.rotateX = 0
    //         this.parent.transform.rotateY = 0
    //         this.parent.transform.rotateZ = 0
    //     }
    // }

    Rectangle {
        id: insideRect;
        color: "#f5f5f9";
        anchors.centerIn: parent;
        width: app.mobile ? app.width : (app.width <= 1280 ? app.width * 0.9 : (app.width <= 1600 && app.width >= 1280  ? app.width * 0.82 : app.width * 0.72)); //TODO
        height: app.height;

        LeftPanel {
            id: leftPanel;
            z: 1;
            fixed: app.mobile;
        }
        LeftPanelWhiteBottom {}

        InfoPanel {
            id: infoPanel;
            effects.shadow.blur: 6;
            LanguageButton {}
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
        id: settings;
        avatarPath: "https://cameralabs.org/media/camera/avgust/6avgust/53_5c4ee0465a6638d42643ed86cb2de396.jpg";
    }
    MainItemDebug { visible: true; }

    LocalStorage {
        id: localStorage;

        function qset(key, value) {
            localStorage.set(key, value, function() { log(key + " error") })
        }
    }

    onCompleted: {
        if (this.disableBackend) return
        var token, email
        localStorage.getOrDefault("token", function(arg) { token = arg }, "")
        localStorage.getOrDefault("email", function(arg) { email = arg }, "")
        console.log(token, email, email.length)
        if (!email.length || !token.length)
            loginPage.visible = true
        else {
            settings.email = email
            settings.token = token
        }
    }

    LoginPage {
        z: 600;
        visible: false;
    }

    Rectangle {
        id: tempErrorRect;
        anchors.fill: parent;
        color: "crimson";
        visible: false;
        z: 601;

        Text {
            anchors.centerIn: parent;
            
            color: "white";
            font.pixelSize: 100;
            text: "Error connection";
        }
    }
}
