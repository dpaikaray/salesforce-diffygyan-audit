public with sharing class AccountService {
    public static List<Account> getActiveAccounts() {
        return [SELECT Id, Name, Active__c FROM Account WHERE Active__c = 'Yes'];
    }
}
