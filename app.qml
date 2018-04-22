Item {
	id: app;
	anchors.fill: parent;

	Button {
		width: 100;
		height: 100;
		color: "lightgoldenrodyellow";
		text: "НАЖМИ МЕНЯ<br>БЛЕАТЬ";
		onClicked: {
			pupsik.height = pupsik.height === 500 ? 100 : 500
		}
	}

	Rectangle {
		id: pupsik;
		anchors.horizontalCenter: parent.horizontalCenter;
		width: 200;
		height: 500;
		color: "crimson";
		Behavior on height { Animation { duration: 500; } }
		
		Text {
			anchors.centerIn: parent;
			text: parent.height + " " + parent.width;
			Behavior on y { Animation { duration: 500; } }
		}
    	
		Text {
			anchors.bottom: parent.bottom;
			text: "Хаюшки";
			Behavior on y { Animation { duration: 1000; } }
		}
	}
}