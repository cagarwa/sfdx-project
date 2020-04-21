public class AccountProcessor {
  @future
    public static void countContacts(List<Id> vAccountIdList) {
        List<Account> vAccountList = [Select Id,Number_of_Contacts__c, (Select Id from Contacts) from Account where Id =:vAccountIdList];
        
        for(Account vAccount : vAccountList) {
            vAccount.Number_of_Contacts__c = vAccount.Contacts.Size(); 
        } 
        
        update vAccountList;
    }
}