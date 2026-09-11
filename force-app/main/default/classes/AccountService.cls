public with sharing class AccountService {

    public static List<Account> getActiveAccounts() {
        return [
            SELECT Id, Name, Phone, Active__c
            FROM Account
            WHERE Active__c = 'Yes'
            WITH USER_MODE
        ];
    }

    public static void updateAccountPhone(Id accId, String newPhone) {
        Account acc = new Account(
            Id = accId,
            Phone = newPhone
        );

        update acc;
    }
    public static void updateAccountName(Id accId, String newName) {
        Account acc = [
            SELECT Id, Name
            FROM Account
            WHERE Id = :accId
            WITH USER_MODE
            LIMIT 1
        ];
    
        acc.Name = newName;
        update acc;
    }
    public static void updateAccountEmail(Id accId, String newEmail) {
        Account acc = [
            SELECT Id, PersonEmail
            FROM Account
            WHERE Id = :accId
            WITH USER_MODE
            LIMIT 1
        ];
    
        acc.PersonEmail = newEmail;
        update acc;
    }
}
