        Rectangle {
            id: panel;
            anchors.top: parent.top;
            height: 100%;
            width: 250;
            color: "white";

            // Text {
            //     font.pixelSize: 26;
            //     text: "ПРИВЕТ";                
            //     anchors.horizontalCenter: parent.horizontalCenter;
            // }

            Rectangle {
            anchors.right: parent.right;
            height: panel.height;
            width: 1; 
            color: "#f5f5f5";   
            }

            Rectangle {
				    id: avatar;
                    anchors.top: parent.top;
                    anchors.topMargin: 50;
				    color: "#f5f5f5";
				    height: 50;
				    width: 50;
				    RadiusMixin { leftTop: parent.height / 2; leftBottom: parent.height / 2;  rightTop: 0;  rightBottom: parent.height / 2;  }
				    anchors.left: parent.left;
                    anchors.leftMargin: 20;
                }

                Text {
                    id: name;
                    anchors.top: avatar.top;
                    anchors.topMargin: 70;
                    //anchors.horizontalCenter: parent.horizontalCenter;
                    text: "Фамилия Имя Отчество";
                    font.pixelSize: 18;
                    color: "#212121";
				    font.bold: true;
				    font.family: "century gothic";
                    anchors.left: parent.left;
                    anchors.leftMargin: 20;
			    }
			    Text {
                    id: post;
				    anchors.top: name.top;
				    anchors.topMargin: 30;
				    //anchors.horizontalCenter: parent.horizontalCenter;
				    text: "Крутая должность";
				    font.pixelSize: 15;
				    color: "#757575";
				    font.family: "century gothic";
                    anchors.left: parent.left;
                    anchors.leftMargin: 20;
			    }


            Column {                
                anchors.horizontalCenter:  parent.horizontalCenter;
                spacing: 25;
                x: 20;
                anchors.top: post.top;
                anchors.topMargin: 80;
                anchors.left: parent.left;
                anchors.leftMargin: 20;

                Rectangle {
                    height: 1;
                    x: -20;
                    width: panel.width;
                    color: "#f5f5f5";
                }

                Row {
                    spacing: 15;

                    Image {
                        height: 25;
                        width: 25;
                        source: "images/account36.png";
                        opacity: 0.4;                        
                    }          
                    Text {
                        text: "Личная информация";
					    font.pixelSize: 16;
					    color: "#212121";
					    font.family: "century gothic";
                    }
                }

                Rectangle {
                    height: 1;
                    x: -20;
                    width: panel.width;
                    color: "#f5f5f5";
                }

                
                Row {
                    spacing: 15;
                
                    Image {
                        height: 25;
                        width: 25;
                        source: "images/todo.png";
                        opacity: 0.4;                        
                    }
                    Text {
                        text: "Журнал заданий";
                        font.pixelSize: 16;
                        color: "#212121";
                        font.family: "century gothic";
                    }
                }

                Rectangle {
                    height: 1;
                    x: -20;
                    width: panel.width;
                    color: "#f5f5f5";
                }

                Row {
                    spacing: 15;
                
                    Image {
                        height: 25;
                        width: 25;
                        source: "images/statistics.png";
                        opacity: 0.4;                        
                    }
                    Text {
                        text: "Статистика";
                        font.pixelSize: 16;
                        color: "#212121";
                        font.family: "century gothic";
                    }
                }

                Rectangle {
                    height: 1;
                    x: -20;
                    width: panel.width;
                    color: "#f5f5f5";
                }

                Row {
                    spacing: 15;
                
                    Image {
                        height: 25;
                        width: 25;
                        source: "images/docs.png";
                        opacity: 0.4;                        
                    }
                    Text {
                        text: "Отчеты pdf";
                        font.pixelSize: 16;
                        color: "#212121";
                        font.family: "century gothic";
                    }
                }

                Rectangle {
                    height: 1;
                    x: -20;
                    width: panel.width;
                    color: "#f5f5f5";
                }
                
            }

        }
