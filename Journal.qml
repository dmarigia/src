Item {
    id: journal;
    width: 100%;
    //anchors.fill: parent;
    height: parent.height;
    property bool hideSub: false;

    AbstractButton {
        id: subButton;
        anchors.top: parent.top;
        anchors.left: parent.left;
        anchors.topMargin: 40;
        anchors.leftMargin: 40;
        height: 40;
        radius: 50;
        colors.hovered: "#faf6fb";
        colors.default: "transparent";
        text: "Приховати підпункти";
        width: 180;
        //text: parent.hideSub;
        onClicked: { journal.hideSub = !journal.hideSub }
    }

    Rectangle {
        anchors.bottom: subButton.bottom;
        anchors.horizontalCenter: subButton;
        width: subButton.width - 36;
        height: 1;
        color: "#D6A7DF";
    }

    AbstractButton {
        id: addTaskButton;
        anchors.top: parent.top;
        anchors.right: parent.right;
        anchors.topMargin: 40;
        anchors.rightMargin: 40;
        colors.hovered: "#eff3fb";
        colors.default: "transparent";
        text: "Додати завдання";
        radius: 50;
        height: 40;
        width: 160;
        onClicked: {
            listModel.insert(0, {"sub": false})
        }
    }

    Rectangle {
        anchors.bottom: addTaskButton.bottom;
        anchors.horizontalCenter: addTaskButton;
        width: addTaskButton.width - 34;
        height: 1;
        color: "#B0C5EF";
    }

    ListView {
        id: listView;
        anchors.top: listRect.bottom;
        anchors.topMargin: 20
        anchors.horizontalCenter: parent.horizontalCenter;
        width: parent.width * 0.9;
        // effects.shadow.color: "#efefef";
        // effects.shadow.blur: 10;
        // effects.shadow.spread: 10;
        height: contentHeight;
        keyNavigationWraps: false;
        handleNavigationKeys: false;
        spacing: 2;
        //var subPar: false;

        model: ListModel {
            id: listModel;
        }

        delegate: Rectangle {
            id: deleg;
            width: 100%;
            radius: 5;
            border.width: 2;
            border.color: "#f5f5f9"
            //color: model.sub ? "#FBFCFD" : "#f5f5f9";
            property bool edit: true;
            height: (!journal.hideSub && model.sub) ? 55 : (model.sub ? 0 : 55);
            visible: (!journal.hideSub && model.sub) || !model.sub; // TODO
            color: checkBox1.checked && checkBox2.checked ? "#b9f6ca" : (model.sub ? "#FBFCFD" : "#f5f5f9");
            x: -300;
            Behavior on x { Animation { duration: 150; } }
            onCompleted: { this.x = 0 }

            function remove() {
                listModel.remove(model.index)
            }

            Row {
                width: parent.width;
                Item {
                    height: 50;
                    width: parent.width / 13;
                    visible: !deleg.edit;
                    AbstractButton {
                        anchors.centerIn: parent;
                        visible: !model.sub;
                        width: 30;
                        height: 30;
                        icon.source: "images/addTask.png";
                        icon.width: 25;
                        icon.height: 25;
                        //colors.hovered: "#A8AEEC";
                        colors.pressed: "#5D6578";
                        radius: 50;
                        opacity: (checkBox1.checked && checkBox2.checked) ? 0.6 : 0.4;
                        onClicked: { listModel.insert(model.index + 1, {"sub":true}) }
                    }
                }

                Item {
                    height: 50;
                    width: parent.width / 13;
                    visible: deleg.edit;
                    AbstractButton {
                        anchors.centerIn: parent;
                        width: 30;
                        height: 30;
                        icon.source: "images/ok.png";
                        icon.width: 25;
                        icon.height: 25;
                        //colors.hovered: "#A8AEEC";
                        colors.pressed: "#5D6578";
                        radius: 50;
                        opacity: (checkBox1.checked && checkBox2.checked) ? 0.6 : 0.4;
                        onClicked: { deleg.edit = false }
                    }
                }

                Item {
                    visible: true;
                    height: 50;
                    width: parent.width / 4;

                    TextInputMaterial {
                        id: task;
                        enabled: deleg.edit;
                        width: parent.width - 20;
                        anchors.bottom: parent.bottom;
                        placeholder.text: model.sub ? "Назва підпункту": "Назва завдання";
                        materialColor: "#A8AEEC";
                        font.pixelSize: 14;
                    }
                }

                Item {
                    visible: parent.edit;
                    height: 50;
                    width: parent.width / 4;
                    Text {
                        width: parent.width - 10;
                        anchors.centerIn: parent;
                        //text: task.Text;
                        font.pixelSize: 14;
                        wrapMode: Text.Wrap;
                    }
                }

                Item {
                    height: 50;
                    width: parent.width / 6;

                    Column {
                        anchors.centerIn: parent;
                        spacing: 4;

                        DateInput {
                            id: firstDate;
                            width: 130;
                            height: 22;
                            color: "black";
                            backgroundColor: "#E8E8E9";
                            font.pixelSize: 14;
                            radius: 7;
                            //border.width: 1;
                            //border.color: "#C9D1EC";
                            opacity: 0.8;
                            max: secondDate.value;
                            enabled: deleg.edit;
                        }

                        DateInput {
                            id: secondDate;
                            width: 130;
                            height: 22;
                            color: "black";
                            visible: !!firstDate.value;
                            min: firstDate.value;
                            backgroundColor: "#E8E8E9";
                            //border.width: 1;
                            //border.color: "#A7B0C4";
                            font.pixelSize: 14;
                            radius: 7;
                            opacity: 0.8;
                            enabled: deleg.edit;
                        }
                    }
                }

                Item {
                    height: 50;
                    width: parent.width / 9;
                    CheckboxInput {
                        id: checkBox1;
                        anchors.centerIn: parent;
                        width: 18;
                        height: 18;
                        enabled: deleg.edit;
                        // onCheckedChanged: {
                        //     log("[checkBox1]", value)
                        //     if (!model.sub) return
                        //     for (var i = model.index; i != 0; --i) {
                        //         console.log("цикл", listModel.get(i).sub)
                        //         if (!listModel.get(i).sub) {
                        //             break
                        //         }
                        //     }
                        // }
                    }
                }

                Item {
                    height: 50;
                    width: parent.width / 9;
                    CheckboxInput {
                        width: 18;
                        height: 18;
                        id: checkBox2; anchors.centerIn: parent;
                        enabled: deleg.edit;
                    }
                }

                Item {
                    height: 50;
                    width: parent.width / 5.5;

                    TextInputMaterial {
                        width: parent.width;
                        anchors.bottom: parent.bottom;
                        materialColor: "#A8AEEC";
                        font.pixelSize: 14;
                        enabled: deleg.edit;
                    }

                }
                Item {
                    height: 50;
                    width: parent.width / 9;

                    AbstractButton {
                        id: opt;
                        anchors.centerIn: parent;
                        width: 30;
                        height: 30;
                        icon.source: "images/options.png";
                        icon.width: 25;
                        icon.height: 25;
                        colors.hovered: "#A8AECC";
                        colors.pressed: "#5D6578";
                        radius: 50;
                        opacity: (checkBox1.checked && checkBox2.checked) ? 0.6 : 0.4;
                        onClicked: {
                            optMenu.visible = !optMenu.visible;
                            //menuItem3.visible = !menuItem3.visible;
                        }
                    }

                    OptionMenu {
                        id: optMenu;
                        anchors.top: opt.bottom;
                        anchors.topMargin: 8;
                        anchors.horizontalCenter: opt;
                        visible: false;
                        z: 1;
                    }
                }
            }
        }
    }

    // Rectangle { // TODO
    //             id: line;
    //             color: "#FBFCFD";
    //             anchors.horizontalCenter: parent.horizontalCenter;
    //             height: 5;
    //             width: parent.width * 0.9;
    //             anchors.top: listRect.bottom;
    //         }

    Rectangle {
        id: listRect;
        anchors.top: addTaskButton.bottom;
        anchors.topMargin: 40;
        color: "#FBFCFD";
        anchors.horizontalCenter: parent.horizontalCenter;
        width: parent.width * 0.9;
        height: 50;
        // effects.shadow.color: "#efefef";
        // effects.shadow.blur: 10;
        // effects.shadow.spread: 2;

        Rectangle {
            width: 100%;
            height: 2;
            anchors.bottom: parent;
            color: "#f5f5f9"
        }

        Row {
            anchors.fill: parent;

            Item {
                height: 50;
                width: parent.width / 13;
            }

            Item {
                height: 50;
                width: parent.width / 4;
                Text {
                    anchors.centerIn: parent;
                    text: "ЗАВДАННЯ";
                    font.pixelSize: 12;
                    color: "#73818e";
                    font.bold: true;
                    wrapMode: Text.Wrap;
                }
            }

            Item {
                height: 50;
                width: parent.width / 6;
                Text {
                    anchors.centerIn: parent;
                    text: "ТЕРМІНИ";
                    font.pixelSize: 12;
                    color: "#73818e";
                    font.bold: true;
                    wrapMode: Text.Wrap;
                }
            }

            Item {
                height: 50;
                width: parent.width / 9;
                Text {
                    anchors.centerIn: parent;
                    text: "ВИПОВ-<br>НЕНІСТЬ";
                    font.pixelSize: 12;
                    color: "#73818e";
                    font.bold: true;
                    wrapMode: Text.Wrap;
                }
            }

            Item {
                height: 50;
                width: parent.width / 9;
                Text {
                    anchors.centerIn: parent;
                    text: "МОДЕ-<br>РАЦІЯ";
                    font.pixelSize: 12;
                    color: "#73818e";
                    font.bold: true;
                    wrapMode: Text.Wrap;
                }
            }

            Item {
                height: 50;
                width: parent.width / 5.5;
                Text {
                    anchors.centerIn: parent;
                    text: "ПОСИЛАННЯ";
                    font.pixelSize: 12;
                    color: "#73818e";
                    font.bold: true;
                    wrapMode: Text.Wrap;
                }
            }
        }
    }
}
