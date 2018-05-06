Item {
    id: journal;
    anchors.fill: parent;

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
            listModel.append({})
        }
    }

    ListView {
        id: listView;
        anchors.top: listRect.bottom;
        anchors.topMargin: 40;
        anchors.horizontalCenter: parent.horizontalCenter;
        width: parent.width * 0.9;
        effects.shadow.color: "#efefef";
		effects.shadow.blur: 10;
		effects.shadow.spread: 10;
        height: contentHeight;
        spacing: 2;
        //var subPar: false;

        model: ListModel {
            id: listModel;
        }

       delegate: 
            Rectangle {
                width: 100%; 
                height: 50;
                color: "#ffffff";
                Row {
                    width: parent.width;
                    Rectangle {
                        height: 50;
                        width: parent.width / 3.4;
                        Text {
                            anchors.centerIn: parent;
                            text: "Задание 1";
                        }
                    }
                    Rectangle {
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
                                backgroundColor: "#ffffff";
                                font.pixelSize: 14;
                            }
                            DateInput {
                                width: 125;
                                height: 20;
                                color: "black";
                                min: "2015-01-01";
                                backgroundColor: "#ffffff";
                                font.pixelSize: 14;
                            }
                        }
                    }
                    Rectangle {
                        height: 50;
                        width: parent.width / 8;
                        CheckboxInput { anchors.centerIn: parent; }
                    }
                    Rectangle {
                        height: 50;
                        width: parent.width / 8;
                        CheckboxInput { anchors.centerIn: parent; }
                    }
                    Rectangle {
                        height: 50;
                        width: parent.width / 8;
                        TextInputMaterial {
                            width: 100;
                            anchors.bottom: parent.bottom;
                            materialColor: "lightblue";
                        }
                        
                    }
                    Rectangle {
                        height: 50;
                        width: parent.width / 8;
                        CheckboxInput { anchors.centerIn: parent; }
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
                    Item {
                        height: 50;
                        width: parent.width / 8;
                        Text {
                            anchors.centerIn: parent;
                            text: "ФОРМАЛЬНАЯ ВЫПОЛНЕННОСТЬ";
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