/*** @using { src.EdContactInfo } **/
/*** @using { src.EdInfo } **/
/*** @using { src.EdInfo } **/
/*** @using { src.EdInfoEdu} **/

Rectangle {
    id: psPage;
    width: 100%;
    height: grid.height;
    color: '#FBFCFD';

    Loader {
        id: editLoader;
        anchors.fill: parent
        z: 1;
        mouseEnabled: !!source;
    }

    Grid {
        id: grid;
        anchors.centerIn: parent;
        width: (psPage.width - 20) > 820 ? insideRect.width * 0.7 : psPage.width - 20;
        //idth: (psPage.width - 20) > 820 ? 410 * 2 + 10 : psPage.width - 20;
        spacing: 70;

        Rectangle {
            id: mainInfo;
            anchors.horizontalCenter: parent.horizontalCenter;
            anchors.topMargin: 60;
            height: 220;
            width: grid.width > 820 ? insideRect.width * 0.7 : grid.width;
            color: '#ffffff';
            clip: true;
            border.width: 1;
            border.color: '#f5f5f9';
            // effects.shadow.color: '#f5f5f9';
            // effects.shadow.blur: 15;
            // effects.shadow.spread: 15;

            Column {
                id: mainAvatar;
                anchors.leftMargin: 30;
                anchors.left: parent.left;
                anchors.verticalCenter: parent.verticalCenter;
                spacing: 10;

                Rectangle {
                    radius: 100;
                    width: 120;
                    height: 120;

                    Image {
                        anchors.fill: parent;
                        source: 'images/avatarbig.png';
                        opacity: 0.4;
                    }

                    Image {
                        anchors.fill: parent;
                        source: settings.avatarPath;
                        radius: 60;
                        visible: settings.avatarPath !== '';
                        fillMode: Image.PreserveAspectCrop;
                        Border {
                            width: 2;
                            color: '#5d6578';
                        }
                    }
                }

                AbstractButton {
                    anchors.horizontalCenter: parent.horizontalCenter;
                    text: qsTr('Добавить фото');
                    height: 20;
                    color: '#ff5252';
                    radius: 50;
                    colors.text: 'white';
                    onClicked: { this.text += '!' }
                }
            }

            Row {
                id: mainInfoRow;
                anchors.left: mainAvatar.right;
                anchors.leftMargin: 40;
                anchors.top: parent.top;
                anchors.topMargin: 25;
                Column {
                    spacing: 5;
                    Row {
                        spacing: 80;

                        Text {
                            id: nameSurname;
                            text: settings.name;
                            color: '#212121';
                            font.pixelSize: 16;
                            font.bold: true;
                        }
                    }
                    Row {
                        anchors.topMargin: 15;
                        spacing: 5;

                        Text {
                            text: qsTr('Звание: ');
                            color: '#757575';
                        }

                        Text {
                            text: qsTr('-');
                            color: '#212121';
                        }
                    }
                    Row {
                        spacing: 5;

                        Text {
                            text: 'Ступінь: ';
                            color: '#757575';
                        }

                        Text {
                            text: qsTr('Кандидат економічних наук');
                            color: '#212121';
                        }
                    }
                }
                Column {
                    anchors.left: mainAvatar.right;
                    anchors.leftMargin: (mainInfo.width - mainAvatar.width) * 0.55;
                    spacing: 5;

                    Text {
                        id: nameSurnameEng;
                        text: 'Name Surname';
                        color: '#212121';
                        font.pixelSize: 16;
                        font.bold: true;
                    }

                    Row {
                        anchors.topMargin: 15;
                        spacing: 5;

                        Text {
                            text: qsTr('Специальность: ');
                            color: '#757575';
                        }

                        Text {
                            text: ('Фінансовий контроль і аудит');
                            color: '#212121';
                            width: mainInfoRow.width - 300;
                            wrapMode: Text.Wrap;
                        }
                    }

                    Row {
                        spacing: 5;

                        Text {
                            text: qsTr('Кафедра: ');
                            color: '#757575';
                        }

                        Text {
                            text: qsTr('Кафедра обліку і аудиту');
                            color: '#212121';
                        } //год рождения, год обучения, форма обучения (дневная, заочная), бюджет/контракт, руководитель +ссылка на его профиль
                    }
                }
            }

            Column {
                spacing: 20;
                anchors.left: mainAvatar.right;
                anchors.leftMargin: 40;
                anchors.bottomMargin: 5;
                anchors.bottom: mainInfo.bottom;

                Rectangle {
                    id: mainLine;
                    width: (mainInfo.width - mainAvatar.width) * 0.86;
                    height: 1;
                    color: '#EAEAEA';
                }

                Row {
                    spacing: 25;
                    anchors.horizontalCenter: mainLine.horizontalCenter;

                    Column {
                        spacing: 15;

                        Text {
                            text: qsTr('Заданий');
                            color: '#757575';
                        }

                        Text {
                            anchors.centerIn: parent;
                            text: '4';
                            //font.bold: true;
                            color: '#f48fb1';
                            font.pixelSize: 24;
                            //font.bold: true;
                        }
                    }
                    Column {
                        spacing: 15;
                        Text {
                            text: qsTr('Рейтинг');
                            color: '#757575';
                        }
                        Text {
                            anchors.centerIn: parent;
                            text: '2';
                            //font.bold:true;
                            color: '#f48fb1';
                            font.pixelSize: 24;
                        }
                    }
                }
            }
        }

        Row { spacing: 40;
            Rectangle {
                clip: true;
                id: infoEducation;
                //anchors.topMargin: 60;
                width: grid.width > 750 ? mainInfo.width / 2.1 : grid.width;
                height: contactText.height + 40;
                color: '#ffffff';
                border.width: 1;
                border.color: '#f5f5f9';
                // effects.shadow.color: '#f5f5f9';
                // effects.shadow.blur: 15;
                // effects.shadow.spread: 15;
                Column {
                    anchors.verticalCenter: parent.verticalCenter;
                    anchors.left: parent.left;
                    anchors.leftMargin: 20;
                    spacing: 20;
                    Column {
                        spacing: 5;
                        Text {
                            text: 'Факультет';
                            color: '#757575';
                        }
                        Text {
                            text: qsTr('Факультет економіки, бізнесу і контролю');
                            color: '#212121';
                            width: infoEducation.width - 30;
                            wrapMode: Text.Wrap;
                            font.pixelSize: 15;
                        }
                    }
                    Column {
                        spacing: 5;
                        Text {
                            text: 'Інститут';
                            color: '#757575';
                        }
                        Text {
                            text: qsTr('Навчально-науковий інститут прикладної економіки та менеджменту ім. Г.Е. Вейнштейна');
                            color: '#212121';
                            width: infoEducation.width - 30;
                            wrapMode: Text.Wrap;
                            font.pixelSize: 15;
                        }
                    }
                    Column {
                        spacing: 5;
                        Text {
                            text: 'Керівник';
                            color: '#757575';
                        }
                        Text {
                            text: qsTr('Прізвище Ім\'я По батькові');
                            color: '#212121';
                            width: infoEducation.width - 30;
                            wrapMode: Text.Wrap;
                            font.pixelSize: 15;
                        }
                    }
                }
            }

            Rectangle {
                clip: true;
                id: infoEdu;
                //anchors.topMargin: 60;
                width: grid.width > 750 ? mainInfo.width / 2.1 : grid.width;
                height: contactText.height + 40;
                color: '#ffffff';
                border.width: 1;
                border.color: '#f5f5f9';
                // effects.shadow.color: '#f5f5f9';
                // effects.shadow.blur: 15;
                // effects.shadow.spread: 15;

                AbstractButton {
                    icon.source: 'images/edit.png';
                    radius: 100;
                    width: 35;
                    height: 35;
                    icon.width: 20;
                    icon.height: 20;
                    anchors.right: parent.right;
                    anchors.top: parent.top;
                    anchors.topMargin: 15;
                    anchors.rightMargin: 15;
                    opacity: 0.4;
                    colors.hovered: '#f5f5f9';
                    onClicked: { editLoader.source = 'src.EdInfoEdu' }
                }
                Column {
                    anchors.verticalCenter: parent.verticalCenter;
                    anchors.left: parent.left;
                    anchors.leftMargin: 20;
                    spacing: 20;
                    Column {
                        spacing: 5;
                        Text {
                            text: qsTr('Год обучения');
                            color: '#757575';
                        }

                        Text {
                            text: '1';
                            color: '#212121';
                            font.pixelSize: 15;
                        }
                    }
                    Column {
                        spacing: 5;
                        Text {
                            text: qsTr('Тема научной работы');
                            color: '#757575';
                        }

                        Text {
                            text: qsTr('Відсутня');
                            color: '#212121';
                            font.pixelSize: 15;
                        }
                    }
                    Column {
                        spacing: 5;
                        Text {
                            text: qsTr('Основа обучения');
                            color: '#757575';
                        }
                        Text {
                            text: qsTr('Дневная');
                            color: '#212121';
                            font.pixelSize: 15;
                        }
                    }
                    Column {
                        spacing: 5;
                        Text {
                            text: qsTr('Форма обучения');
                            color: '#757575';
                        }
                        Text {
                            text: qsTr('Бюджет');
                            color: '#212121';
                            font.pixelSize: 15;
                        }
                    }
                }
            } }

        Row { spacing: 40;
            Rectangle {
                clip: true;
                id: info;
                //anchors.topMargin: 60;
                width: grid.width > 750 ? mainInfo.width / 2.1 : grid.width;
                height: contactText.height + 40;
                color: '#ffffff';
                border.width: 1;
                border.color: '#f5f5f9';
                // effects.shadow.color: '#f5f5f9';
                // effects.shadow.blur: 15;
                // effects.shadow.spread: 15;

                AbstractButton {
                    icon.source: 'images/edit.png';
                    radius: 100;
                    width: 35;
                    height: 35;
                    icon.width: 20;
                    icon.height: 20;
                    anchors.right: parent.right;
                    anchors.top: parent.top;
                    anchors.topMargin: 15;
                    anchors.rightMargin: 15;
                    opacity: 0.4;
                    colors.hovered: '#f5f5f9';
                    onClicked: { editLoader.source = 'src.EdInfo' }
                }
                Column {
                    anchors.verticalCenter: parent.verticalCenter;
                    anchors.left: parent.left;
                    anchors.leftMargin: 20;
                    spacing: 20;
                    Column {
                        spacing: 5;
                        Text {
                            text: qsTr('Дата рождения');
                            color: '#757575';
                        }
                        Text {
                            text: '13.10.1990';
                            color: '#212121';
                            font.pixelSize: 15;
                        }
                    }
                    Column {
                        spacing: 5;
                        Text {
                            text: qsTr('Семейное положение');
                            color: '#757575';
                        }
                        Text {
                            text: qsTr('Не замужем');
                            color: '#212121';
                            font.pixelSize: 15;
                        }
                    }
                    Column {
                        spacing: 5;
                        Text {
                            text: qsTr('Дети');
                            color: '#757575';
                        }
                        Text {
                            text: qsTr('Нет');
                            color: '#212121';
                            font.pixelSize: 15;
                        }
                    }
                }
            }

            Rectangle {
                clip: true;
                id: contactInfo;
                //anchors.topMargin: 60;
                width: grid.width > 750 ? mainInfo.width / 2.1 : grid.width;
                height: contactText.height + 40;
                color: '#ffffff';
                border.width: 1;
                border.color: '#f5f5f9';
                // effects.shadow.color: '#f5f5f9';
                // effects.shadow.blur: 15;
                // effects.shadow.spread: 15;

                AbstractButton {
                    icon.source: 'images/edit.png';
                    radius: 100;
                    width: 35;
                    height: 35;
                    icon.width: 20;
                    icon.height: 20;
                    anchors.right: parent.right;
                    anchors.top: parent.top;
                    anchors.topMargin: 15;
                    anchors.rightMargin: 15;
                    opacity: 0.4;
                    colors.hovered: '#f5f5f9';
                    onClicked: { editLoader.source = 'src.EdContactInfo' }
                }
                Column {
                    id: contactText;
                    anchors.verticalCenter: parent.verticalCenter;
                    anchors.left: parent.left;
                    anchors.leftMargin: 20;
                    spacing: 20;
                    Column {
                        spacing: 5;
                        Text {
                            text: qsTr('Телефон');
                            color: '#757575';
                        }
                        Text {
                            text: '+380639170208';
                            color: '#212121';
                            font.pixelSize: 15;
                        }
                    }
                    Column {
                        spacing: 5;
                        Text {
                            text: 'e-mail';
                            color: '#757575';
                        }
                        Text {
                            text: 'myemail@email.my';
                            color: '#212121';
                            font.pixelSize: 15;
                        }
                    }
                    Column {
                        spacing: 5;
                        Text {
                            text: qsTr('Место работы');
                            color: '#757575';
                        }
                        Text {
                            text: qsTr('Место работы');
                            color: '#212121';
                            font.pixelSize: 15;
                        }
                    }
                    Column {
                        spacing: 5;
                        Text {
                            text: qsTr('Адрес проживания');
                            color: '#757575';
                        }
                        Text {
                            text: qsTr('Адрес проживания');
                            color: '#212121';
                            font.pixelSize: 15;
                        }
                    }
                }
            } }

        Row {
            height: 90;
            spacing: 40;
            //anchors.topMargin: 60;
            anchors.horizontalCenter: parent.horizontalCenter;
            opacity: 0.6;
            AbstractButton {
                icon.source: 'images/orcid.svg';
                colors.hovered: '#DCDCE0';
                width: 55;
                height: 55;
                radius: 100;
                icon.width: 50;
                icon.height: 50;
                onClicked: { window.open('https://orcid.org') }
            }
            AbstractButton {
                icon.source: 'images/scopus.svg';
                colors.hovered: '#DCDCE0';
                width: 55;
                height: 55;
                radius: 100;
                icon.width: 50;
                icon.height: 50;
                onClicked: { window.open('https://scopus.com') }
            }
            AbstractButton {
                icon.source: 'images/ResearcherID.svg';
                colors.hovered: '#DCDCE0';
                width: 55;
                height: 55;
                radius: 100;
                icon.width: 50;
                icon.height: 50;
                onClicked: { window.open('https://researcherid.com') }
            }
            AbstractButton {
                icon.source: 'images/gscholar.png';
                colors.hovered: '#DCDCE0';
                width: 55;
                height: 55;
                radius: 100;
                icon.width: 50;
                icon.height: 50;
                onClicked: { window.open('https://scholar.google.com') }
            }
        }
        // Rectangle {
        //     clip: true;
        //     anchors.topMargin: 40;
        //     id: info;
        //     width: grid.width > 820 ? 410 : grid.width;
        //     height: 200;
        //     color: 'white';
        //     border.width: 1;
        //     border.color: '#EAEAEA';
        //     radius: 5;
        //     Column {
        //         anchors.verticalCenter: parent.verticalCenter;
        //         anchors.left: parent.left;
        //         anchors.leftMargin: 20;
        //         spacing: 15;
        //         Row {
        //             spacing: 15;
        //             Text {
        //                 text: 'Семейное положение: ';
        //                 color: '#757575';
        //             }
        //             Text {
        //                 text: 'Не замужем';
        //                 color: '#212121';
        //             }
        //         }
        //         Row {
        //             spacing: 15;
        //             Text {
        //                 text: 'Дети: ';
        //                 color: '#757575';
        //             }
        //             Text {
        //                 text: 'нет';
        //                 color: '#212121';
        //             }
        //         }
        //         Row {
        //             spacing: 15;
        //             Text {
        //                 text: 'Место работы: ';
        //                 color: '#757575';
        //             }
        //             Text {
        //                 text: 'место работы';
        //                 color: '#212121';
        //             }

        //         }
        //     }
        // }

        // Rectangle {
        //     clip: true;
        //     anchors.topMargin: 40;
        //     id: contactInfo;
        //     width: grid.width > 820 ? 410 : grid.width;
        //     height: 200;
        //     color: 'white';
        //     border.width: 1;
        //     border.color: '#EAEAEA';
        //     radius: 5;

        //     Column {
        //         anchors.verticalCenter: parent.verticalCenter;
        //         anchors.left: parent.left;
        //         anchors.leftMargin: 20;
        //         spacing: 15;

        //         Row {
        //             spacing: 15;
        //             Text {
        //                 text: 'Телефон: ';
        //                 color: '#757575';
        //             }

        //             Text {
        //                 text: '+980635698574';
        //                 color: '#212121';
        //             }
        //         }

        //         Row {
        //             spacing: 15;

        //             Text {
        //                 text: 'e-mail: ';
        //                 color: '#757575';
        //             }

        //             Text {
        //                 text: 'myemail@email.my';
        //                 color: '#212121';
        //             }
        //         }

        //         Row {
        //             spacing: 15;

        //             Text {
        //                 text: 'Адрес проживания: ';
        //                 color: '#757575';
        //             }

        //             Text {
        //                 text: 'ул. Уличиная, д. 8, кв. 5';
        //                 color: '#212121';
        //             }

        //         }
        //     }
        //     // телефон, мыло, адрес
        // }
    }

    Text {
        anchors.bottom: infoEducation.top;
        anchors.bottomMargin: 10;
        anchors.left: infoEducation.left;
        text: qsTr('ОБУЧЕНИЕ');
        color: '#757575';
        font.bold: true;
    }

    Text {
        anchors.bottom: info.top;
        anchors.bottomMargin: 10;
        anchors.left: info.left;
        text: qsTr('О СЕБЕ');
        color: '#757575';
        font.bold: true;
    }

    // Text {
    //     anchors.bottom: contactInfo.top;
    //     anchors.bottomMargin: 5;
    //     anchors.left: contactInfo.left;
    //     text: qsTr('КОНТАКТНАЯ ИНФОРМАЦИЯ');
    //     color: '#757575';
    //     //font.bold: true;
    // }

    Rectangle {
        width: panel.width
        height: psPage.height - panel.height
        color: '#FBFCFD'
        anchors.top: panel.bottom
        anchors.right: parent.left

        Rectangle {
            width: 2;
            height: 100%
                    color: '#f5f5f9'
            anchors.right: parent.right
        }

    }

    NetworkRequest {
        id: networkReqPP;

        onLoaded: {
            var json = this.toJson()
            log('current profile', json, json.email)
            if (!json.email) return

            settings.firstName = 'Ім`я'//json.firstname
            settings.lastName = 'Прізвище'//json.lastname
            settings.middleName = 'По батькові'//json.middlename
            settings.role = json.role
        }

        onError: {
            console.warn('Error connection!')
            tempErrorRect.visible = true
        }
    }

    function getProfile() {
        if (!settings.email) return
        networkReqPP.url = 'https://marigia.top/api/profile?email=' + settings.email;
        networkReqPP.send()
    }
}
