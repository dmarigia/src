Object {
    id: global;
    property string token;
    property string email;
    property string firstName: 'Ім\'я';
    property string lastName: 'Прізвище';
    property string middleName: 'По батькові';
    property string avatarPath: 'завантажується';
    property string name: firstName === 'завантажується' ? 'завантажується' : lastName + ' ' + firstName + ' ' + middleName;
    property string job;
    property enum role {User, Head, Admin};

    onTokenChanged: {
        psPage.getProfile()
    }
}