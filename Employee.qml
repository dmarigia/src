Rectangle {
    id: employee;
    width: 100%;
    color: "#f5f5f5";
    height: listik.height + 50 * 3 + addButton.height + listRect.height;
    

    Button {
        id: addButton;
        anchors.top: parent.top;
        anchors.right: parent.right;
        anchors.topMargin: 50;
        anchors.rightMargin: 50;
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

    Rectangle {
        id: listRect;
        anchors.top: addButton.bottom;
        anchors.topMargin: 50;
        color: "lightgray";
        anchors.horizontalCenter: parent.horizontalCenter;
        width: parent.width * 0.85;
        height: 50;
        effects.shadow.color: "#efefef";
		effects.shadow.blur: 10;
		effects.shadow.spread: 10;
                Row {
                    anchors.fill: parent;
                    Item {
                        height: 50;
                        width: parent.width / 4;
                    }
                    Item {
                        height: 50;
                        width: parent.width / 4;
                        Text {
                            anchors.centerIn: parent;
                            text: "Имя";
                        }
                    }
                    Item {
                        height: 50;
                        width: parent.width / 4;
                        Text {
                            anchors.centerIn: parent;
                            text: "Должность";
                        }
                    }
                    Item {
                        height: 50;
                        width: parent.width / 4;
                        Text {
                            anchors.centerIn: parent;
                            text: "Опции";
                        }
                    }
                }
    }


    ListView {
        id: listik;
        anchors.top: listRect.bottom;
        anchors.topMargin: 50;
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
                        width: parent.width / 4;
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
                        width: parent.width / 4;
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
                        width: parent.width / 4;
                        LeftPanelButton {
                            anchors.centerIn: parent;
                            width: 25;
                            height: 25;
                            image: "options.png";
                            page: "OptionMenu";
                        }
                    }
                }

            }
       
   }
}