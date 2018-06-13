Item {
    id: edContactInfo
    fixed: true
    width: app.width
    height: parent.parent.height
    
    Rectangle {
        anchors.fill: parent
        color: '#5D6578'
        opacity: 0.7
        MousePressMixin {
            onPressedChanged: { editLoader.source = '' }
        }
    }

    Rectangle {   
        id: edContactRect
        color: '#FBFCFD'
        radius: 4
        anchors.top: parent
        anchors.topMargin: parent.height / 11
        anchors.left: parent
        anchors.leftMargin: parent.width / 3
        effects.shadow.color: '#5D6578'
        effects.shadow.blur: 10
        effects.shadow.spread: 2
        width: 500
        height: 550
        OverflowMixin {}

        Column {
            id: column
            spacing: 20
            anchors.top: parent.top
            anchors.topMargin: 50
            anchors.left: parent.left
            anchors.leftMargin: 35

            Column {
                spacing: 10

                Text {
                    color: '#A7B0C4'
                    text: 'Teлефон'
                }

                TextInputMaterial {
                    width: edContactRect.width - 70
                    placeholder.text: '+38 (xxx)-xxx-хххх'
                    materialColor: '#A8AEEC'
                }
            }

            Column {
                spacing: 10

                Text {
                    color: '#A7B0C4'
                    text: 'e-mail'
                }

                TextInputMaterial {
                    width: edContactRect.width - 70
                    placeholder.text: 'e-mail'
                    materialColor: '#A8AEEC'
                }
            }

            Column {
                spacing: 10

                Text {
                    color: '#A7B0C4'
                    text: 'Місце роботи'
                }

                TextInputMaterial {
                    width: edContactRect.width - 70
                    placeholder.text: 'Адреса'
                    materialColor: '#A8AEEC'
                }
            }
            
            Column {
                spacing: 10

                Text {
                    color: '#A7B0C4'
                    text: 'Адреса проживання'
                }

                TextInputMaterial {
                    width: edContactRect.width - 70
                    placeholder.text: 'Адреса'
                    materialColor: '#A8AEEC'
                }
            }

            Column {
                spacing: 10

                Text {
                    color: '#A7B0C4'
                    text: 'Scopus'
                }

                TextInputMaterial {
                    width: edContactRect.width - 70
                    placeholder.text: 'Введіть дані'
                    materialColor: '#A8AEEC'
                }
            }

            Column {
                spacing: 10

                Text {
                    color: '#A7B0C4'
                    text: 'Researcher'
                }

                TextInputMaterial {
                    width: edContactRect.width - 70
                    placeholder.text: 'Введіть дані'
                    materialColor: '#A8AEEC'
                }
            }
            Column {
                spacing: 10

                Text {
                    color: '#A7B0C4'
                    text: 'Google Scholar'
                }

                TextInputMaterial {
                    width: edContactRect.width - 70
                    placeholder.text: 'Введіть дані'
                    materialColor: '#A8AEEC'
                }
            }

            Column {
                spacing: 10

                Text {
                    color: '#A7B0C4'
                    text: 'OrcID'
                }

                TextInputMaterial {
                    width: edContactRect.width - 70
                    placeholder.text: 'Введіть дані'
                    materialColor: '#A8AEEC'
                }
            }
        }

        Row {
            id: rowB
            spacing: 60
            anchors.top: column.bottom            
            anchors.topMargin: 35
            anchors.right: edContactRect.right
            anchors.rightMargin: 35

            AbstractButton {
                colors.default: '#C9D1EC'
                text: 'Відмінити'
                radius: 50
                height: 40
                width: 120
                onClicked: { editLoader.source = '' }
            }

            AbstractButton {
                colors.default: '#B0C5EF'
                text: 'Зберегти'
                radius: 50
                height: 40
                width: 120
            }
        }
        Item {
            anchors.top: rowB.bottom
            height: 50
            width: 5
        }
    }
}