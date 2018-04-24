Item {
    id: psPage;
    anchors.fill: parent;
    
    Grid {
        id: grid;
        height: 97%;
        anchors.centerIn: parent;
        width: (psPage.width - 20) > 820 ? 410 * 2 + 10 : psPage.width - 20;
        
        spacing: 10;
        Rectangle {
            id: mainInfo;
            height: 200;
            width: grid.width > 820 ? 410 : grid.width;
            color: "white";
            radius: 5;
            border.width: 1;
            border.color: "#EAEAEA";
            clip: true;

            Column {
                id: mainAvatar;
                anchors.leftMargin: 30;            
                anchors.left: parent.left;
                anchors.verticalCenter: parent.verticalCenter;
                spacing: 10;
                Rectangle {
                    radius: 100;
                    width: 125;
                    height: 125;
                    Image {
                        anchors.centerIn: parent;
                        source: "images/avatarbig.png";
                        height: 120;
                        width: 120; 
                        opacity: 0.4; 
                    }
                }
                Rectangle {
                    width: addPhotoText.width + 20;
                    height: 20;
                    color: "#ff5252";
                    radius: 50;
                    Text {
                        id: addPhotoText;
                        anchors.centerIn: parent;
                        text: "Добавить фото";
                        font.pixelSize: 14;
                        font.family: "century gothic";
                        color: "white";
                    }
                }
            }
            
            Column {
                spacing: 15;
                anchors.left: mainAvatar.right;  
                anchors.leftMargin: 40;          
                anchors.verticalCenter: parent.verticalCenter;
                Row {
                    spacing: 80;
                    Text {
                        id: nameSurname;
                        text: "Фамилия Имя Отчество";
                        color: "#212121";
                        font.pixelSize: 16;
                        font.family: "century gothic";
                        font.bold: true;
                    }
                }

                Row {
                    spacing: 10;
                    Text {
                        text: "Специальность: ";
                        font.family: "century gothic";
                        font.pixelSize: 14;
                        color: "#757575";
                    }
                    Text {
                        text: "такая вот";
                        font.family: "century gothic";
                        font.pixelSize: 14;
                        color: "#212121";
                    }
                }
                Row {
                    spacing: 10;
                    Text {
                        text: "Кафедра: ";
                        font.family: "century gothic";
                        font.pixelSize: 14;
                        color: "#757575";
                    }
                    Text {
                        text: "кафедра";
                        font.family: "century gothic";
                        font.pixelSize: 14;
                        color: "#212121";
                    }
                }
                Row {
                    spacing: 10;
                    Text {
                        text: "Степень: ";
                        font.family: "century gothic";
                        font.pixelSize: 14;
                        color: "#757575";
                    }
                    Text {
                        text: "степень";
                        font.family: "century gothic";
                        font.pixelSize: 14;
                        color: "#212121";
                    }
                }
                Row {
                    spacing: 10;
                    Text {
                        text: "Звание: ";
                        font.family: "century gothic";
                        font.pixelSize: 14;
                        color: "#757575";
                    }
                    Text {
                        text: "звание";
                        font.family: "century gothic";
                        font.pixelSize: 14;
                        color: "#212121";
                    } //год рождения, год обучения, форма обучения (дневная, заочная), бюджет/контракт, руководитель +ссылка на его профиль
                }
            }
        }

        Rectangle {
            clip: true;
            Text {
                text: "О СЕБЕ";
                font.family: "century gothic";
                font.pixelSize: 14;
                color: "#757575";
                font.bold: true;
            }

            id: info;
            width: grid.width > 820 ? 410 : grid.width;
            height: 200;
            color: "white";
            border.width: 1;
            border.color: "#EAEAEA";
            radius: 5;
            Column {
                anchors.verticalCenter: parent.verticalCenter;
                anchors.left: parent.left;
                anchors.leftMargin: 20;
                spacing: 15;
                Row {
                    spacing: 15;
                    Text {                        
                        text: "Семейное положение: ";
                        font.family: "century gothic";
                        font.pixelSize: 14;
                        color: "#757575";
                    }
                    Text {
                        text: "Не замужем";
                        font.family: "century gothic";
                        font.pixelSize: 14;
                        color: "#212121";
                    }
                }
                Row {
                    spacing: 15;
                    Text {                        
                        text: "Дети: ";
                        font.family: "century gothic";
                        font.pixelSize: 14;
                        color: "#757575";
                    }
                    Text {
                        text: "нет";
                        font.family: "century gothic";
                        font.pixelSize: 14;
                        color: "#212121";
                    }
                }
                Row {
                    spacing: 15;
                    Text {                        
                        text: "Место работы: ";
                        font.family: "century gothic";
                        font.pixelSize: 14;
                        color: "#757575";
                    }
                    Text {
                        text: "место работы";
                        font.family: "century gothic";
                        font.pixelSize: 14;
                        color: "#212121";
                    }
                    
                }
            } 
        }
        
        Rectangle {
            clip: true;
            Text {
                text: "КОНТАКТНАЯ ИНФОРМАЦИЯ";
                font.family: "century gothic";
                font.pixelSize: 14;
                color: "#757575";
                font.bold: true;
            }

            id: contactInfo;
            width: grid.width > 820 ? 410 : grid.width;
            height: 200;
            color: "white";
            border.width: 1;
            border.color: "#EAEAEA";
            radius: 5;
            Column {
                anchors.verticalCenter: parent.verticalCenter;
                anchors.left: parent.left;
                anchors.leftMargin: 20;
                spacing: 15;
                Row {
                    spacing: 15;
                    Text {                        
                        text: "Телефон: ";
                        font.family: "century gothic";
                        font.pixelSize: 14;
                        color: "#757575";
                    }
                    Text {
                        text: "+980635698574";
                        font.family: "century gothic";
                        font.pixelSize: 14;
                        color: "#212121";
                    }
                }
                Row {
                    spacing: 15;
                    Text {                        
                        text: "e-mail: ";
                        font.family: "century gothic";
                        font.pixelSize: 14;
                        color: "#757575";
                    }
                    Text {
                        text: "myemail@email.my";
                        font.family: "century gothic";
                        font.pixelSize: 14;
                        color: "#212121";
                    }
                }
                Row {
                    spacing: 15;
                    Text {                        
                        text: "Адрес проживания: ";
                        font.family: "century gothic";
                        font.pixelSize: 14;
                        color: "#757575";
                    }
                    Text {
                        text: "ул. Уличиная, д. 8, кв. 5";
                        font.family: "century gothic";
                        font.pixelSize: 14;
                        color: "#212121";
                    }
                    
                }
            }
            // телефон, мыло, адрес
        }
    }

// Column {
//     anchors.top: topCol.top;
//     anchors.topMargin: 150;
//     anchors.horizontalCenter: parent.horizontalCenter;
//     spacing: 15;
//     Rectangle {
//         id: circleAvatar;
//         anchors.horizontalCenter: parent.horizontalCenter;
//         height: 125;
//         width: 125;
//         radius: 100;
//         effects.shadow.color: "#616161";
// 		effects.shadow.blur: 6;
// 		effects.shadow.spread: 3;

//         Image {
//             id: mainAvatar;            
//             anchors.centerIn: parent;
//             source: "images/avatarbig.png";        
//             height: 120;
//             width: 120; 
//             opacity: 0.5;          
//         }
//     }

//     Text {
//         text: "Изменить фото";
//         color: "#212121";
//         font.family: "century gothic";
//         font.pixelSize: 16;
//         anchors.horizontalCenter: parent.horizontalCenter;
//     }
// }
//     Rectangle {
//         id: rrrr;
//         anchors.top: topCol.top;
//         anchors.topMargin: 350;        
//         anchors.horizontalCenter: parent.horizontalCenter;
//         height: 200;
//         width: 900;
//         color: "white";
//         radius: 5;
//         border.width: 1;
//         border.color: "#EAEAEA";

//         Rectangle { 
//             id: rrr;
//             width: 100%;
//             height: 30;
//             color: "#f5f5f5";
//             Text {
//                 anchors.top: parent.top;
//                 anchors.topMargin: 10;
//                 anchors.left: parent.left;
//                 anchors.leftMargin: 10;
//                 text: "ОСНОВНОЕ";
//                 color: "#757575";
//                 font.pixelSize: 14;
//                 font.family: "century gothic";
//                 font.bold: true;
//             }
//         }
        
//         Column {
//             anchors.top: rrr.top;
//             anchors.topMargin: 30;
//             spacing: 15;
//             Rectangle {
//                 width: rrrr.width;
//                 height: 1;
//                 color: "#EAEAEA";
//             }
//             Text {
//                 anchors.left: rrrr.left;
//                 anchors.leftMargin: 10;
//                 text: "Специальность: аоаоаоаоао";
//             }
//             Rectangle {
//                 width: rrrr.width;
//                 height: 1;
//                 color: "#EAEAEA";
//             }
//             Text {
//                 anchors.left: rrrr.left;
//                 anchors.leftMargin: 10;
//                 text: "Форма обучения: аоаоаоаоао";
//             }
//         }

//     }
}