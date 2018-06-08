Item {
    id: journal;
    width: 100%;
    //anchors.fill: parent;
    height: parent.height;
    property bool hideSub: false;

    AbstractButton {
        text: parent.hideSub;
        onClicked: { journal.hideSub = !journal.hideSub }
    }

    AbstractButton {
        id: addTaskButton;
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
            listModel.insert(0, {"sub": false})
        }
    }
    
    ListView {
        id: listView;
        anchors.top: line.bottom;
        anchors.horizontalCenter: parent.horizontalCenter;
        width: parent.width * 0.9;
        effects.shadow.color: "#efefef";
        effects.shadow.blur: 10;
        effects.shadow.spread: 10;
        height: contentHeight;
        keyNavigationWraps: false;
        handleNavigationKeys: false;
        //spacing: 2;
        //var subPar: false;

        model: ListModel {
            id: listModel;
        }

        delegate: Rectangle {
            id: deleg;
            width: 100%;
            property bool edit: true;
            height: (!journal.hideSub && model.sub) ? 55 : (model.sub ? 0 : 55);
            visible: (!journal.hideSub && model.sub) || !model.sub; // TODO
            color: normalnayaPeremennaya1.checked && normalnayaPeremennaya2.checked ? "lightgreen" : "#FBFCFD";
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
                        opacity: 0.4;
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
                        opacity: 0.4;
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
                        placeholder.text: model.sub ? "Подзадание ": "Задание ";
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
                            value: "";
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
                        id: normalnayaPeremennaya1; anchors.centerIn: parent;
                        width: 18;
                        height: 18;
                        enabled: deleg.edit;
                        // onCheckedChanged: {
                        //     log("[normalnayaPeremennaya1]", value)
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
                        id: normalnayaPeremennaya2; anchors.centerIn: parent;
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
                        id: normalnayaPeremennaya5;
                        anchors.centerIn: parent;
                        width: 30;
                        height: 30;
                        icon.source: "images/options.png";
                        icon.width: 25;
                        icon.height: 25;
                        colors.hovered: "#A8AECC";
                        colors.pressed: "#5D6578";
                        radius: 50;
                        opacity: 0.5;
                        onClicked: { 
                            normalnayaPeremennaya4.visible = !normalnayaPeremennaya4.visible;
                            //menuItem3.visible = !menuItem3.visible;
                        }
                    }

                    OptionMenu {
                        id: normalnayaPeremennaya4;
                        anchors.top: normalnayaPeremennaya5.bottom;
                        anchors.topMargin: 8;
                        anchors.horizontalCenter: normalnayaPeremennaya5;
                        visible: false;
                        z: 1;
                    }
                }
            }
        }
    }

    Rectangle { // TODO
                id: line;
                color: "#FBFCFD";                
                anchors.horizontalCenter: parent.horizontalCenter;
                height: 5;
                width: parent.width * 0.9;
                anchors.top: listRect.bottom;
            }

    Rectangle {
        id: listRect;
        anchors.top: addTaskButton.bottom;
        anchors.topMargin: 40;
        color: "#d9e2e7";
        anchors.horizontalCenter: parent.horizontalCenter;
        width: parent.width * 0.9;
        height: 50;
        effects.shadow.color: "#efefef";
        effects.shadow.blur: 10;
        effects.shadow.spread: 2;

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
