Rectangle {
    id: panel;
    anchors.top: parent.top;
    height: 100%;
    width: app.mobile ? 0.7 * parent.width : 250;
    color: "white";
    property bool active: false;
    x: active || !app.mobile ? 0 : -width;

    // Text {
    //     font.pixelSize: 26;
    //     text: "ПРИВЕТ";                
    //     anchors.horizontalCenter: parent.horizontalCenter;
    // }

    Rectangle {
        anchors.right: parent.right;
        height: panel.height;
        width: 1; 
        color: "#f5f5f5";   
    }

    Rectangle {
        id: avatar;
        anchors.top: parent.top;
        anchors.topMargin: 50;
        color: "#f5f5f5";
        height: 50;
        width: 50;
        RadiusMixin { leftTop: parent.height / 2; leftBottom: parent.height / 2;  rightTop: 0;  rightBottom: parent.height / 2;  }
        anchors.left: parent.left;
        anchors.leftMargin: 20;
    }

    Text {
        id: name;
        anchors.top: avatar.top;
        anchors.topMargin: 70;
        //anchors.horizontalCenter: parent.horizontalCenter;
        text: "Фамилия Имя Отчество";
        font.pixelSize: 18;
        color: "#212121";
        font.bold: true;
        font.family: "century gothic";
        anchors.left: parent.left;
        anchors.leftMargin: 20;
    }
    Text {
        id: post;
        anchors.top: name.top;
        anchors.topMargin: 30;
        //anchors.horizontalCenter: parent.horizontalCenter;
        text: "Крутая должность";
        font.pixelSize: 15;
        color: "#757575";
        font.family: "century gothic";
        anchors.left: parent.left;
        anchors.leftMargin: 20;
    }

    Column {                
        anchors.horizontalCenter:  parent.horizontalCenter;
        anchors.top: post.top;
        anchors.topMargin: 80;
        anchors.left: parent.left;

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
