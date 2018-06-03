Rectangle {
    id: employee;
    width: 100%;
    color: "#f5f5f9";
    height: listik.height + 50 * 3 + addButton.height + listRect.height;   

    EditUser {
        id: editUser;
        anchors.centerIn: parent;
        visible: false;
        z: 1;
    } 

    Rectangle {
        id: search;
        anchors.top: parent.top;
        anchors.left: parent.left;
        anchors.topMargin: 40;
        anchors.leftMargin: 40;
        height: 40;
        width: 60 + tSearch.width;
        radius: 50;
        color: "white";

        Row {            
            anchors.verticalCenter: parent.verticalCenter;
            spacing: 10;
            AbstractButton {
                anchors.verticalCenter: parent.verticalCenter;
                id: searchButton;
                anchors.left: search.left;
                anchors.leftMargin: 5;
                opacity: 0.6;
                icon.source: "images/search.png";
                height: 37;
                width: 37;
                icon.width: 30;
                icon.height: 30;
                colors.hovered: "#A8AEEC";
                radius: 100;
                onClicked: {
                    textSearch.width = 180; 
                    search.width = search.width === (67 + textSearch.width) ? (60 + tSearch.width) : (67 + textSearch.width);
                    textSearch.visible = !textSearch.visible;
                    tSearch.visible = !tSearch.visible;
                }
            }
            // Rectangle {
            //     id: line;
            //     anchors.verticalCenter: parent.verticalCenter;
            //     height: 30;
            //     width: 1;
            //     color: "lightgray";
            // }
            Text {
                id: tSearch;
                visible: true;
                anchors.verticalCenter: parent.verticalCenter;
                text: "Пошук";
                color: "#A7B0C4";
            }
            TextInputMaterial {
                clip: true;
                visible: false;
                id: textSearch;
                width: 0;
                anchors.bottom: search.bottom;
                anchors.bottomMargin: -4;
                materialColor: "#A8AEEC";
                font.pixelSize: 14;
                placeholder.text: "Пошук";
                Behavior on x { Animation { duration: 1000; } }
                Behavior on width { Animation { duration: 1000; } }
            }
        }

        Behavior on width { Animation { duration: 500; } }

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
            //elistModel.insert(0, {});
            editUser.visible = !editUser.visible;
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
            id: elistModel;
        }

        delegate: Rectangle {
            width: 100%;
            height: 100;
            x: -300;
            radius: 5;
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
        radius: 5;
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
