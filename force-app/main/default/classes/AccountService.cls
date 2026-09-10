public with sharing class AccountService {
    public static List<Account> getActiveAccounts() {
        return [SELECT Id, Name, Phone, Active__c FROM Account WHERE Active__c = 'Yes' WITH USER_MODE];
    }

    public static void updateAccountPhone(Id accId, String newPhone) {
        Account acc = new Account(Id = accId, Phone = newPhone);
        update acc;
    }
}
