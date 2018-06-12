Item {
    id: editUser
    fixed: true
    width: app.width
    height: app.height

    Rectangle {
        anchors.fill: parent
        color: '#5D6578'
        opacity: 0.7
        MousePressMixin {
            onPressedChanged: { emplLoader.source = '' }
        }
    }

    Form { // добавление. для редактирования по идеи тоже самое, но добавить .Post
        id: edInfoRect
        network.url: 'https://marigia.top/api/user'
        network.method: NetworkRequest.Put
        color: '#f5f5f9'
        onSendError: {
            employee.error = 1 // или 2 :D
            console.log('Error: add employee for') // или edit (это же один пример для адд и эдита)
        }

        //color: '#FBFCFD'
        radius: 4
        anchors.centerIn: parent
        effects.shadow.color: '#5D6578'
        effects.shadow.blur: 10
        effects.shadow.spread: 2
        width: 850
        height: 700

        OverflowMixin {}

        Column {
            anchors.horizontalCenter: parent
            spacing: 60

            Rectangle {
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: edInfoRect
                anchors.topMargin: 60
                width: 650
                height: 250
                color: '#FBFCFD'
                effects.shadow.color: '#F2F2F6'
                effects.shadow.blur: 10
                effects.shadow.spread: 2

                Row {
                    anchors.centerIn: parent
                    spacing: 60

                    Column {
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: parent.left
                        anchors.leftMargin: 15
                        spacing: 10
                        Rectangle {
                            radius: 100
                            width: 100
                            height: 100
                            Image {
                                anchors.fill: parent
                                source: 'images/avatarbig.png'
                                opacity: 0.4
                            }
                        }

                        AbstractButton {
                            anchors.horizontalCenter: parent.horizontalCenter
                            text: qsTr('Добавить фото');
                            height: 20
                            colors.default: '#A7B0C4'
                            radius: 50
                            colors.text: 'white'
                            onClicked: { this.text += '!' }
                        }
                    }

                    Column {
                        spacing: 15

                        Column {
                            spacing: 10

                            Text {
                                color: '#A7B0C4'
                                text: 'ПІБ (укр.)'
                            }

                            TextInputMaterial {
                                id: inputPib
                                placeholder.text: 'Прізвище Ім\'я По батькові'
                                materialColor: '#A8AEEC'
                                font.pixelSize: 15
                                width: 400
                            }
                        }

                        Column {
                            spacing: 10

                            Text {
                                color: '#A7B0C4'
                                text: 'Name Surname (eng)'
                            }

                            TextInputMaterial {
                                placeholder.text: 'Name Surname'
                                materialColor: '#A8AEEC'
                                font.pixelSize: 15
                                width: 400
                            }
                        }

                        Column {
                            spacing: 10
                            Text {
                                color: '#A7B0C4'
                                text: 'Дата народження'
                            }

                            DateInput {
                                font.pixelSize: 15
                                width: 400
                            }
                        }
                    }
                }
            }

            Rectangle {
                id: rect2
                anchors.horizontalCenter: parent.horizontalCenter
                width: 650
                height: col2.height + 60
                color: '#FBFCFD'
                effects.shadow.color: '#EFEFF3'
                effects.shadow.blur: 10
                effects.shadow.spread: 2

                Column {
                    id: col2
                    spacing: 15
                    anchors.centerIn: parent

                    Column {
                        spacing: 10

                        Text {
                            color: '#A7B0C4'
                            text: 'Інститут'
                        }

                        ComboBox {
                            displayText: !currentText ? 'Оберіть інститут' : currentText
                            //currentIndex: 1
                            button.font.pixelSize: 15
                            width: 500
                            effects.shadow.color: '#A8AEEC'
                            effects.shadow.blur: 1
                            //effects.shadow.spread: 1

                            model: ['Інст1', 'Інст2', 'Інст3', 'Інст4', 'Інст5']
                        }
                    }

                    Column {
                        spacing: 10

                        Text {
                            color: '#A7B0C4'
                            text: 'Факультет'
                        }

                        ComboBox {
                            displayText: !currentText ? 'Оберіть факультет' : currentText
                            effects.shadow.color: '#A8AEEC'
                            effects.shadow.blur: 1
                            button.font.pixelSize: 15
                            width: 500
                            model: ['Факультет', 'Факультет']
                        }
                    }

                    Column {
                        spacing: 10

                        Text {
                            color: '#A7B0C4'
                            text: 'Звання'
                        }

                        ComboBox {
                            displayText: !currentText ? 'Оберіть звання' : currentText
                            effects.shadow.color: '#A8AEEC'
                            effects.shadow.blur: 1
                            button.font.pixelSize: 15
                            width: 500
                            model: ['Звання 1', 'Звання 2']
                        }
                    }

                    Column {
                        spacing: 10

                        Text {
                            color: '#A7B0C4'
                            text: 'Ступінь'
                        }

                        ComboBox {
                            displayText: !currentText ? 'Оберіть ступінь' : currentText
                            effects.shadow.color: '#A8AEEC'
                            effects.shadow.blur: 1
                            button.font.pixelSize: 15
                            width: 500
                            model: ['Ступінь', 'Ступінь']
                        }
                    }

                    Column {
                        spacing: 10

                        Text {
                            color: '#A7B0C4'
                            text: 'Спеціальність'
                        }

                        ComboBox {
                            displayText: !currentText ? 'Оберіть спеціальність' : currentText
                            effects.shadow.color: '#A8AEEC'
                            effects.shadow.blur: 1
                            button.font.pixelSize: 15
                            width: 500
                            model: ['Спеціальність 1', 'Спеціальність 2']
                        }
                    }

                    Column {
                        spacing: 10

                        Text {
                            color: '#A7B0C4'
                            text: 'Кафедра'
                        }

                        ComboBox {
                            displayText: !currentText ? 'Оберіть кафедру' : currentText
                            effects.shadow.color: '#A8AEEC'
                            effects.shadow.blur: 1
                            button.font.pixelSize: 15
                            width: 500
                            model: ['Кафедра 1', 'Кафедра 2']
                        }
                    }

                    Column {
                        spacing: 10

                        Text {
                            color: '#A7B0C4'
                            text: 'Рік навчання'
                        }

                        ComboBox {
                            displayText: !currentText ? 'Оберіть рік навчання' : currentText
                            effects.shadow.color: '#A8AEEC'
                            effects.shadow.blur: 1
                            button.font.pixelSize: 15
                            width: 500
                            model: ['1', '2']
                        }
                    }

                    Column {
                        spacing: 10

                        Text {
                            color: '#A7B0C4'
                            text: 'Основа навчання'
                        }

                        ComboBox {
                            displayText: !currentText ? 'Оберіть основу навчання' : currentText
                            effects.shadow.color: '#A8AEEC'
                            effects.shadow.blur: 1
                            button.font.pixelSize: 15
                            width: 500
                            model: ['Денна', 'Заочна']
                        }
                    }

                    Column {
                        spacing: 10

                        Text {
                            color: '#A7B0C4'
                            text: 'Форма навчання'
                        }

                        ComboBox {
                            displayText: !currentText ? 'Оберіть форму навчання' : currentText
                            effects.shadow.color: '#A8AEEC'
                            effects.shadow.blur: 1
                            button.font.pixelSize: 15
                            width: 500
                            model: ['Бюджет', 'Контракт']
                        }
                    }

                    Column {
                        spacing: 10
                        Text {
                            color: '#A7B0C4'
                            text: 'Керівник'
                        }

                        ComboBox {
                            displayText: !currentText ? 'Оберіть керівника' : currentText
                            effects.shadow.color: '#A8AEEC'
                            effects.shadow.blur: 1
                            button.font.pixelSize: 15
                            width: 500
                            model: ['Керівник 1', 'Керівник 2']
                        }
                    }

                    Column {
                        spacing: 10

                        Text {
                            color: '#A7B0C4'
                            text: 'Тема наукової роботи'
                        }

                        TextInputMaterial {
                            placeholder.text: 'Тема наукової роботи'
                            materialColor: '#A8AEEC'
                            font.pixelSize: 15
                            width: 500
                        }
                    }
                }
            }

            Rectangle {
                id: rect3
                anchors.horizontalCenter: parent.horizontalCenter
                width: 650
                height: col3.height + 60
                color: '#FBFCFD'
                effects.shadow.color: '#F2F2F6'
                effects.shadow.blur: 10
                effects.shadow.spread: 2

                Column {
                    id: col3
                    spacing: 15
                    anchors.centerIn: parent

                    Column {
                        spacing: 10

                        Text {
                            color: '#A7B0C4'
                            text: 'Телефон'
                        }

                        TextInputMaterial {
                            placeholder.text: '+38 (063) '
                            materialColor: '#A8AEEC'
                            font.pixelSize: 15
                            width: 500
                        }
                    }

                    Column {
                        spacing: 10

                        Text {
                            color: '#A7B0C4'
                            text: 'e-mail'
                        }

                        TextInputMaterial {
                            placeholder.text: 'e-mail'
                            materialColor: '#A8AEEC'
                            font.pixelSize: 15
                            width: 500
                        }
                    }

                    Column {
                        spacing: 10

                        Text {
                            color: '#A7B0C4'
                            text: 'Місце роботи'
                        }

                        TextInputMaterial {
                            placeholder.text: 'Місце роботи'
                            materialColor: '#A8AEEC'
                            font.pixelSize: 15
                            width: 500
                        }
                    }

                    Column {
                        spacing: 10

                        Text {
                            color: '#A7B0C4'
                            text: 'Адреса проживання'
                        }

                        TextInputMaterial {
                            placeholder.text: 'Адреса проживання'
                            materialColor: '#A8AEEC'
                            font.pixelSize: 15
                            width: 500
                        }
                    }

                    Column {
                        spacing: 10

                        Text {
                            color: '#A7B0C4'
                            text: 'ScopusID'
                        }

                        TextInputMaterial {
                            placeholder.text: 'ScopusID'
                            materialColor: '#A8AEEC'
                            font.pixelSize: 15
                            width: 500
                        }
                    }

                    Column {
                        spacing: 10

                        Text {
                            color: '#A7B0C4'
                            text: 'ResearcherID'
                        }

                        TextInputMaterial {
                            placeholder.text: 'ResearcherID'
                            materialColor: '#A8AEEC'
                            font.pixelSize: 15
                            width: 500
                        }
                    }

                    Column {
                        spacing: 10

                        Text {
                            color: '#A7B0C4'
                            text: 'Google Scholar'
                        }

                        TextInputMaterial {
                            placeholder.text: 'Google Scholar'
                            materialColor: '#A8AEEC'
                            font.pixelSize: 15
                            width: 500
                        }
                    }

                    Column {
                        spacing: 10

                        Text {
                            color: '#A7B0C4'
                            text: 'OrcID'
                        }

                        TextInputMaterial {
                            placeholder.text: 'OrcID'
                            materialColor: '#A8AEEC'
                            font.pixelSize: 15
                            width: 500
                        }
                    }
                }
            }

            Rectangle {
                id: rect4
                anchors.horizontalCenter: parent.horizontalCenter
                width: 650
                height: col4.height + 60
                color: '#FBFCFD'
                effects.shadow.color: '#F2F2F6'
                effects.shadow.blur: 10
                effects.shadow.spread: 2

                Column {
                    id: col4
                    spacing: 15
                    anchors.centerIn: parent

                    Column {
                        spacing: 10

                        Text {
                            color: '#A7B0C4'
                            text: 'Сімейний стан'
                        }

                        ComboBox {
                            displayText: !currentText ? 'Оберіть сімейний стан' : currentText
                            effects.shadow.color: '#A8AEEC'
                            effects.shadow.blur: 1
                            button.font.pixelSize: 15
                            width: 500
                            model: ['1', '2']
                        }
                    }

                    Column {
                        spacing: 10

                        Text {
                            color: '#A7B0C4'
                            text: 'Діти'
                        }

                        ComboBox {
                            displayText: !currentText ? 'Оберіть відповідний пункт' : currentText
                            effects.shadow.color: '#A8AEEC'
                            effects.shadow.blur: 1
                            button.font.pixelSize: 15
                            width: 500
                            model: ['Немає', '1']
                        }
                    }
                }
            }

            Rectangle {
                id: rect5
                anchors.horizontalCenter: parent.horizontalCenter
                width: 650
                height: col5.height + 60
                color: "#FBFCFD"
                effects.shadow.color: "#F2F2F6"
                effects.shadow.blur: 10
                effects.shadow.spread: 2

                Column {
                    id: col5
                    spacing: 15
                    anchors.centerIn: parent

                    Column {
                        spacing: 10
                        Text {
                            color: '#A7B0C4'
                            text: 'Вкажіть логін для користувача'
                        }

                        TextInputMaterial {
                            placeholder.text: 'Логін'
                            materialColor: '#A8AEEC'
                            font.pixelSize: 15
                            width: 500
                        }
                    }

                    Column {
                        spacing: 10

                        Text {
                            color: '#A7B0C4'
                            text: 'Вкажіть пароль для користувача'
                        }

                        TextInputMaterial {
                            placeholder.text: 'Пароль'
                            materialColor: '#A8AEEC'
                            font.pixelSize: 15
                            width: 500
                        }
                    }

                    Column {
                        spacing: 10

                        Text {
                            color: '#A7B0C4'
                            text: 'Вкажіть роль користувача у системі'
                        }

                        ComboBox {
                            id: comboRole
                            displayText: !currentText ? 'Оберіть роль' : currentText
                            effects.shadow.color: '#A8AEEC'
                            effects.shadow.blur: 1
                            button.font.pixelSize: 15
                            width: 500
                            model: ['Аспірант', 'Докторант', 'Керівник', 'Адміністратор']
                        }
                    }
                }
            }

            Row {
                height: 100
                spacing: 90
                // anchors.top: col3.bottom
                // anchors.topMargin: 35
                anchors.right: rect5
                anchors.rightMargin: 10
                // anchors.bottom: edInfoRect.bottom
                // anchors.bottomMargin: 60

                AbstractButton {
                    id: cButton
                    colors.default: '#C9D1EC'
                    text: 'Скасувати'
                    colors.hovered: 'lightgrey'
                    radius: 50
                    height: 40
                    width: 120
                    onClicked:  { emplLoader.source = '' }
                }

                AbstractButton {
                    id: sButton
                    colors.default: '#B0C5EF'
                    text: 'Збергти'
                    colors.hovered: 'lightgrey'
                    radius: 50
                    height: 40
                    width: 120

                    onClicked: {
                        // это надо
                        edInfoRect.send()

                        // это не надо копировать
                        elistModel.insert(0, {name: inputPib.text, role: comboRole.currentText}) // TODO: replace currentText to index
                        emplLoader.source = ''
                    }
                }
            }

            // Rectangle {
            //     anchors.top: cButton.bottom
            //     anchors.horizontalCenter: cButton
            //     width: cButton.width
            //     height: 2
            //     color: '#B0C5EF'
            // }

            // Rectangle {
            //     anchors.top: sButton.bottom
            //     anchors.horizontalCenter: sButton
            //     width: sButton.width
            //     height: 2
            //     color: '#D6A7DF'
            // }

        }
        Text {
            z: 100
            anchors.bottom: rect2.top
            anchors.bottomMargin: 10
            anchors.left: rect2.left
            text: 'Інформація про навчання'
            color: '#A7B0C4'
            font.pixelSize: 14
            font.bold: true
        }
    }
}
