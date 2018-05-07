Object {
    id: global;
    property string token;
    property string email;
    property string firstName: "загружается";
    property string lastName: "загружается";
    property string middleName: "загружается";
    property string avatarPath: "загружается";
    property string name: firstName === "загружается" ? "загружается" : lastName + " " + firstName + " " + middleName;
    property string job;
    property int role: -1;

    onTokenChanged: {
        psPage.getProfile()
    }
}