Rectangle {
    id: employee;
    width: 100%;
    color: "#f5f5f5";
    height: listik.height + 50 * 3 + addButton.height + listRect.height;

    Rectangle {
        id: search;
        border.width: 1;
        border.color: "lightgray"; 
        anchors.top: parent.top;
        anchors.left: parent.left;
        anchors.topMargin: 40;
        anchors.leftMargin: 40;
        radius: 50;
        height: 40;
        width: 200;
        color: "#FBFCFD";
        Row {
            spacing: 10;
            Rectangle {  
                id: image;              
                anchors.verticalCenter: parent.verticalCenter;
                anchors.left: parent.left;
                anchors.leftMargin: 10;
                color: "lightgray";
                radius: 100;
                height: 20;
                width: 20;
            }
            Rectangle {
                anchors.verticalCenter: parent.verticalCenter;
                anchors.left: image.right;
                anchors.leftMargin: 10;
                height: 20;
                width: 1;
                color: "lightgray";
            }
            TextInputMaterial {
                materialColor: "#A8AEEC";
                //anchors.bottom: parent.bottom;
                font.family: "century gothic";
                placeholder.text: "Поиск";
            }
        }
    }

    AbstractButton {
        id: addButton;
        anchors.top: parent.top;
        anchors.right: parent.right;
        anchors.topMargin: 40;
        anchors.rightMargin: 40;
        colors.default: "#C9D1EC";
        text: "Добавить";
        radius: 50;
        height: 40;
        width: 120;
        onClicked: {
            listModel.insert(0, {})
        }
    }

    ListView {
        id: listik;
        anchors.top: listRect.bottom;
        anchors.horizontalCenter: parent.horizontalCenter;
        width: parent.width * 0.85;
        effects.shadow.color: "#efefef";
        effects.shadow.blur: 10;
        effects.shadow.spread: 10;
        height: contentHeight;
        spacing: 2;

        model: ListModel {
            id: listModel;
        }

        delegate: Rectangle {
            width: 100%;
            height: 100;
            x: -300;
            Behavior on x { Animation { duration: 150; } }
            onCompleted: { this.x = 0 }

            Row {
                width: parent.width;

                Item {
                    height: 100;
                    width: parent.width / 5;
                    Image {
                        anchors.centerIn: parent;
                        source: "images/avatarbig45.png";
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
                        id: normalnayaPeremennaya5;
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
                        onClicked: { normalnayaPeremennaya4.visible = !normalnayaPeremennaya4.visible }
                    }

                    OptionMenu {
                        id: normalnayaPeremennaya4;
                        anchors.top: normalnayaPeremennaya5.bottom;
                        anchors.topMargin: 20;
                        anchors.horizontalCenter: normalnayaPeremennaya5.horizontalCenter;
                        visible: false;
                        z: 1;
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
