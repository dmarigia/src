Rectangle {
    id: employee;
    width: 100%;
    color: "#f5f5f5";
    height: listik.height + 50 * 3 + addButton.height + listRect.height;
    

    Button {
        id: addButton;
        anchors.top: parent.top;
        anchors.right: parent.right;
        anchors.topMargin: 40;
        anchors.rightMargin: 40;
        text: "Добавить";
        textColor: "#757575"; 
        width: 85;
        height: 35;
        radius: 50;
        border.width: 1;
        border.color: "#EAEAEA";
        onClicked: {
            listModel.append({})
        }
    }

    ListView {
        id: listik;
        anchors.top: listRect.bottom;
        anchors.topMargin: 40;
        anchors.horizontalCenter: parent.horizontalCenter;
        width: parent.width * 0.85;
        effects.shadow.color: "#efefef";
		effects.shadow.blur: 10;
		effects.shadow.spread: 10;
        height: contentHeight; // если не nativeScrolling: true, то так
        // если true
        //nativeScrolling: true;
        // то нужна длина (или анчоры, не суть)
        //height: 200;
        spacing: 2;

        model: ListModel { // обязательно модельку создать
            id: listModel;
        }

       delegate: 
            Rectangle {
                //color: model.index % 2 ? "#EAEAEA" : "white"; //model.color; // доступ к тому самому color
                width: 100%; // 100% размер ListView
                height: 100; // просто длина
                
                Row {
                    width: parent.width;
                    Item {
                        height: 100;
                        width: parent.width / 5;
                        Image {
                            anchors.centerIn: parent;
                            source: "images/avatarbig.png";
                            height: 45;
                            width: 45;
                            opacity: 0.4;
                        }
                    }
                    Item {
                        height: 100;
                        width: parent.width / 2.7;
                        Text {
                            anchors.centerIn: parent;
                            text: "Фамилия Имя Отчество";
                        }
                    }
                    Item {
                        height: 100;
                        width: parent.width / 4;
                        Text {
                            anchors.centerIn: parent;
                            text: "Аспирант";
                        }
                    }
                    Item {
                        height: 100;
                        width: parent.width / 5;
                        AbstractButton {
                            anchors.centerIn: parent;
                            width: 30;
                            height: 30;
                            icon.source: "images/options.png";
                            icon.width: 25;
                            icon.height: 25;
                            colors.hovered: "lightblue";
                            colors.pressed: "blue";
                            radius: 50;
                            opacity: 0.5;
                            onClicked: { alert("Clicked") }
                        }
                    }
                }

            }
       
   }

   Rectangle {
        id: listRect;
        anchors.top: addButton.bottom;
        anchors.topMargin: 40;
        color: "#d9e2e7";
        anchors.horizontalCenter: parent.horizontalCenter;
        width: parent.width * 0.85;
        height: 50;
        effects.shadow.color: "#efefef";
		effects.shadow.blur: 10;
		effects.shadow.spread: 2;
                Row {
                    anchors.fill: parent;
                    Item {
                        height: 50;
                        width: parent.width / 5;
                    }
                    Item {
                        height: 50;
                        width: parent.width / 2.7;
                        Text {
                            anchors.centerIn: parent;
                            text: "ИМЯ";
                            color: "#73818e";
                            font.bold: true;
                        }
                    }
                    Item {
                        height: 50;
                        width: parent.width / 4;
                        Text {
                            anchors.centerIn: parent;
                            text: "ДОЛЖНОСТЬ";
                            color: "#73818e";
                            font.bold: true;
                        }
                    }
                    Item {
                        height: 50;
                        width: parent.width / 5;
                        Text {
                            anchors.centerIn: parent;
                            text: "ОПЦИИ";
                            color: "#73818e";
                            font.bold: true;
                        }
                    }
                }
    }
}