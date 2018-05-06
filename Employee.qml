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
        height: 100;
                Row {
                    anchors.fill: parent;
                    Item {
                        height: 100;
                        width: parent.width / 4;
                        Text {
                            anchors.centerIn: parent;
                            text: "1!";
                        }
                    }
                    Item {
                        height: 100;
                        width: parent.width / 4;
                        Text {
                            anchors.centerIn: parent;
                            text: "2!";
                        }
                    }
                    Item {
                        height: 100;
                        width: parent.width / 4;
                        Text {
                            anchors.centerIn: parent;
                            text: "3!";
                        }
                    }
                    Item {
                        height: 100;
                        width: parent.width / 4;
                        Text {
                            anchors.centerIn: parent;
                            text: "4!";
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
                color: model.index % 2 ? "#EAEAEA" : "white"; //model.color; // доступ к тому самому color
                width: 100%; // 100% размер ListView
                height: 100; // просто длина
                
                Row {
                    width: parent.width;
                    Item {
                        height: 100;
                        width: parent.width / 4;
                        Text {
                            anchors.centerIn: parent;
                            text: model.index;
                        }
                    }
                    Item {
                        height: 100;
                        width: parent.width / 4;
                        Text {
                            anchors.centerIn: parent;
                            text: model.index;
                        }
                    }
                    Item {
                        height: 100;
                        width: parent.width / 4;
                        Text {
                            anchors.centerIn: parent;
                            text: model.index;
                        }
                    }
                    Item {
                        height: 100;
                        width: parent.width / 4;
                        Text {
                            anchors.centerIn: parent;
                            text: model.index;
                        }
                    }
                }

            }
       
   }
}