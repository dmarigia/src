WebItem {
    anchors.right: parent.right;
    anchors.rightMargin: 20;
    width: textLang.width;
    height: 14;
    property string lang;

    onClicked: { this.lang === "uk" ? this.lang = "ru" : this.lang = "uk" }
    onLangChanged: { log("lang", value); context.language = value; localStorage.set("lang", value, function() { log("lang error") }) }

    Text {
        id: textLang;
        text: parent.lang === "uk" ? "украинский" : "русский";
        color: "#adb1ba";
        z: -1;
    }

    LocalStorage {
        id: localStorage;
        onCompleted: {
            var lang
            this.getOrDefault("lang", function(arg) { lang = arg }, context.language)
            if (lang === "ru-ru") lang = "ru"
            this.parent.lang = lang
        }
    }
}