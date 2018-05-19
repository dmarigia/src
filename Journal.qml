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

        delegate:
            Rectangle {
            width: 100%;
            height: (!journal.hideSub && model.sub) ? 55 : (model.sub ? 0 : 55);
            visible: (!journal.hideSub && model.sub) || !model.sub; // TODO
            color: normalnayaPeremennaya1.checked && normalnayaPeremennaya2.checked ? "lightgreen" : "#FBFCFD";
            x: -300;
            Behavior on x { Animation { duration: 150; } }
            onCompleted: { this.x = 0 }

            Row {
                width: parent.width;
                Item {
                    height: 50;
                    width: parent.width / 10;

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
                    visible: true;
                    height: 50;
                    width: parent.width / 4;

                    TextInputMaterial {   
                        id: task;
                        width: parent.width - 20;                     
                        anchors.bottom: parent.bottom;
                        placeholder.text: model.sub ? "Подзадание ": "Задание ";
                        materialColor: "#A8AEEC";
                        font.family: "century gothic";
                        font.pixelSize: 14;
                    }
                }

                Item {
                    visible: false;
                    height: 50;
                    width: parent.width / 4;
                    Text {   
                        width: parent.width - 10;                     
                        anchors.centerIn: parent;
                        text: task.Text;
                        font.family: "century gothic";
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
                            //backgroundColor: "#C9D1EC";
                            font.pixelSize: 14;
                            radius: 50;
                            border.width: 1;
                            border.color: "#C9D1EC";
                            //opacity: 0.5;
                        }

                        DateInput {
                            width: 130;
                            height: 22;
                            color: "black";
                            min: "";
                            //backgroundColor: "#A7B0C4";
                            border.width: 1;
                            border.color: "#A7B0C4";
                            font.pixelSize: 14;
                            radius: 50;
                            //opacity: 0.5;
                        }
                    }
                }

                Item {
                    height: 50;
                    width: parent.width /9;
                    CheckboxInput {
                        id: normalnayaPeremennaya1; anchors.centerIn: parent;
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
                    CheckboxInput { id: normalnayaPeremennaya2; anchors.centerIn: parent; }
                }

                Item {
                    height: 50;
                    width: parent.width / 6;

                    TextInputMaterial {
                        width: parent.width;
                        anchors.bottom: parent.bottom;
                        materialColor: "#A8AEEC";
                        font.family: "century gothic";
                        font.pixelSize: 14;
                    }

                }
                Item {
                    height: 50;
                    width: parent.width / 10;

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
                width: parent.width / 10;
            }

            Item {
                height: 50;
                width: parent.width / 4;
                Text {
                    anchors.centerIn: parent;
                    text: "ЗАДАНИЕ";
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
                    text: "СРОК ВЫПОЛНЕНИЯ";
                    color: "#73818e";
                    font.bold: true;
                    font.pixelSize: 13;
                    wrapMode: Text.Wrap;
                }
            }

            Item {
                height: 50;
                width: parent.width / 9;
                Text {
                    anchors.centerIn: parent;
                    text: "ВЫПОЛ-<br>НЕННОСТЬ";
                    color: "#73818e";
                    font.bold: true;
                    font.pixelSize: 13;
                    wrapMode: Text.Wrap;
                }
            }

            Item {
                height: 50;
                width: parent.width / 9;
                Text {
                    anchors.centerIn: parent;
                    text: "МОДЕ-<br>РАЦИЯ";
                    color: "#73818e";
                    font.bold: true;
                    font.pixelSize: 13;
                    wrapMode: Text.Wrap;
                }
            }

            Item {
                height: 50;
                width: parent.width / 6;
                Text {
                    anchors.centerIn: parent;
                    text: "ССЫЛКА";
                    color: "#73818e";
                    font.pixelSize: 13;
                    font.bold: true;
                    wrapMode: Text.Wrap;
                }
            }

        }
    }
}
