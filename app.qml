/*** @using { src.PersonalPage } **/
/*** @using { src.Journal } **/
/*** @using { src.Employee } **/
/*** @using { src.Statistics } **/
/*** @using { src.Reports } **/

MainItem {
    id: app;
    anchors.fill: parent;
    property bool disableBackend: true;

    color: '#e7eaef';
    title: qsTr('Личный кабинет') + ' - ' + pageName
    property string page: 'PersonalPage'
    property string pageName: qsTr('Личная информация'); // TODO: auto

    Rectangle {
        id: insideRect
        color: '#fbfcfd'
        anchors.centerIn: parent
        width: app.mobile ? app.width : (app.width <= 1280 ? app.width * 0.9 : (app.width <= 1600 && app.width >= 1280  ? app.width * 0.82 : app.width * 0.72)) //TODO
        height: app.height

        LeftPanel {
            id: leftPanel
            z: 1
            fixed: app.mobile
        }
        //LeftPanelWhiteBottom {}

        InfoPanel {
            id: infoPanel
            effects.shadow.blur: 4
        }

        Loader { // TODO: change container-like
            id: loader
            source: 'src.' + app.page
            anchors.top: infoPanel.bottom
            anchors.bottom: parent.bottom
            anchors.left: app.mobile ? parent.left : leftPanel.right
            anchors.right: parent.right
        }
    }

    // background for mobile menu
    Rectangle {
        anchors.fill: parent
        color: 'darkgray'
        opacity: 0.6
        visible: leftPanel.active
        fixed: true
        MousePressMixin {
            onPressedChanged: { if (value) leftPanel.close() }
        }
    }

    onMobileChanged: {
        if (!value) leftPanel.close()
    }

    // test config
    GlobalSettings {
        id: settings
        avatarPath: 'https://cameralabs.org/media/camera/avgust/6avgust/53_5c4ee0465a6638d42643ed86cb2de396.jpg'
    }

    LocalStorage {
        id: localStorage

        function qset(key, value) {
            localStorage.set(key, value, function() { log(key + ' error') })
        }
    }

//    MainItemDebug { }
//    onCompleted: {
//        if (this.disableBackend) return
//        var token, email
//        localStorage.getOrDefault('token', function(arg) { token = arg }, '')
//        localStorage.getOrDefault('email', function(arg) { email = arg }, '')
//        console.log(token, email, email.length)
//        if (!email.length || !token.length)
//            loginPage.visible = true
//        else {
//            settings.email = email
//            settings.token = token
//        }
//    }

    LoginPage {
        z: 1
        visible: false
    }
}
