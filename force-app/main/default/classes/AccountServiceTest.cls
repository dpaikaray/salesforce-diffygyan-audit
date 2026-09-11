@IsTest
private class AccountServiceTest {

    @IsTest
    static void testUpdateAccountPhone() {
        Account acc = new Account(
            Name = 'DiffyGyan Demo Account',
            Phone = '1234567890'
        );
        insert acc;

        Test.startTest();
        AccountService.updateAccountPhone(acc.Id, '9876543210');
        Test.stopTest();

        Account updated = [
            SELECT Id, Phone
            FROM Account
            WHERE Id = :acc.Id
            LIMIT 1
        ];

        System.assertEquals('9876543210', updated.Phone);
    }

    @IsTest
    static void testUpdateAccountName() {
        Account acc = new Account(
            Name = 'Original Name'
        );
        insert acc;

        Test.startTest();
        AccountService.updateAccountName(acc.Id, 'Updated Name');
        Test.stopTest();

        Account updated = [
            SELECT Id, Name
            FROM Account
            WHERE Id = :acc.Id
            LIMIT 1
        ];

        System.assertEquals('Updated Name', updated.Name);
    }
}
