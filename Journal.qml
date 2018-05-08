Item {
    id: journal;
    width: 100%;
    //anchors.fill: parent;
    height: parent.height; // ???????????????????????????????????????????????????????????????
    property bool hideSub: false;

    AbstractButton {
        text: parent.hideSub;
        onClicked: { journal.hideSub = !journal.hideSub }
    }

    Button {
        id: addTaskButton;
        anchors.top: parent.top;
        anchors.right: parent.right;
        anchors.topMargin: 40;
        anchors.rightMargin: 40;
        text: "Новое задание";
        textColor: "#757575"; 
        width: 110;
        height: 35;
        radius: 50;
        border.width: 1;
        border.color: "#EAEAEA";
        onClicked: {
            listModel.append({"sub": false})
        }
    }

    ListView {
        id: listView;
        anchors.top: listRect.bottom;
        anchors.topMargin: 28;
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
                height: (!journal.hideSub && model.sub) ? 50 : (model.sub ? 0 : 50);
                visible: (!journal.hideSub && model.sub) || !model.sub; // TODO
                color: normalnayaPeremennaya1.checked && normalnayaPeremennaya2.checked ? "lightgreen" : "white";
                //color: !model.sub ? "#ffffff" : "red";
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
                            colors.hovered: "lightblue";
                            colors.pressed: "blue";
                            radius: 50;
                            opacity: 0.4;
                            onClicked: { listModel.insert(model.index + 1, {"sub":true}) }
                        }
                    }
                    Item {
                        height: 50;
                        width: parent.width / 4;                                            
                            Text {  
                                anchors.centerIn: parent; // ???                              
                                text: model.sub ? "Подзадание " : "Задание " + 1;
                            }
                        }
                    
                    Item {
                        height: 50;
                        width: parent.width / 6;
                        Column {
                            anchors.centerIn: parent;
                            spacing: 5;
                            DateInput {
                                width: 125;
                                height: 20;
                                color: "black";
                                min: "2015-01-01";
                                backgroundColor: "lightgrey";
                                font.pixelSize: 14;
                            }
                            DateInput {
                                width: 125;
                                height: 20;
                                color: "black";
                                min: "2015-01-01";
                                backgroundColor: "lightgrey";
                                font.pixelSize: 14;
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
                            //width: parent.width / 6;
                            anchors.bottom: parent.bottom;
                            color: "green";
                            materialColor: "lightblue";
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
                            colors.hovered: "lightblue";
                            colors.pressed: "blue";
                            radius: 50;
                            opacity: 0.5;
                            onClicked: { normalnayaPeremennaya4.visible = !normalnayaPeremennaya4.visible }
                        }
                        OptionMenu {
                            //TODO: сделать по центру
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
                        width: parent.width / 3.4;
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
                        width: parent.width / 8;
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
                        width: parent.width / 8;
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
                        width: parent.width / 8;
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
    
    // Text {
    //     anchors.centerIn: parent;
    //     text: journalModel.count;
    // }
    // Button {
    //     width: 100; height: 50; color: "red";
    //     text: parent.kek;
    //     onClicked: { journal.kek += 20 }
    //     z: 1;
    // }
    // property int kek: 0;
    
    // ListView {
    //     anchors.horizontalCenter: parent.horizontalCenter;
    //     width: Math.min(150 * 5 + 150 + parent.kek + 20, 100%);
    //     height: 100%;
    //     keyNavigationWraps: false;
    //     contentFollowsCurrentItem: false;
    //     model: ListModel {
    //         id: journalModel;
    //     }
    //     onCompleted: {
    //         this.style("overflow-x", "auto")
    //         var cost = 5.95
    //         for (var i = 0; i !== 30; ++i)
    //             journalModel.append({"cost": cost + i, "name": "Пицца"})
    //     }
    //     nativeScrolling: true;
        
    //     delegate: Row {
    //         id: delegateRow;
    //         height: 100;
            
    //         Rectangle {
    //             height: 100%;
    //             width: 150 + journal.kek;
    //             border.right.width: 1;
    //             border.right.color: "crimson";
    //             border.bottom.width: 1;
    //             border.bottom.color: "crimson";
    //             Text {
    //                 anchors.centerIn: parent;
    //                 text: model.index;
    //             }
    //         }
    //         Rectangle {
    //             height: 100%;
    //             width: 150;
    //             border.right.width: 1;
    //             border.right.color: "crimson";
    //             border.bottom.width: 1;
    //             border.bottom.color: "crimson";
    //             Text {
    //                 anchors.centerIn: parent;
    //                 text: qsTr(model.name);
    //             }
    //         }
    //         Rectangle {
    //             height: 100%;
    //             width: 150;
    //             border.right.width: 1;
    //             border.right.color: "crimson";
    //             border.bottom.width: 1;
    //             border.bottom.color: "crimson";
    //             Text {
    //                 anchors.centerIn: parent;
    //                 text: model.cost;
    //             }
    //         }
    //         Rectangle {
    //             height: 100%;
    //             width: 150;
    //             border.right.width: 1;
    //             border.right.color: "crimson";
    //             border.bottom.width: 1;
    //             border.bottom.color: "crimson";
    //             CheckboxInput{}
    //         }
    //         Rectangle {
    //             height: 100%;
    //             width: 150;
    //             border.right.width: 1;
    //             border.right.color: "crimson";
    //             border.bottom.width: 1;
    //             border.bottom.color: "crimson";
    //             CheckboxInput{}
    //         }
    //         Rectangle {
    //             height: 100%;
    //             width: 150;
    //             border.bottom.width: 1;
    //             border.bottom.color: "crimson";
    //             CheckboxInput{ anchors.centerIn: parent; }
    //         }
    //     }
    // }
}