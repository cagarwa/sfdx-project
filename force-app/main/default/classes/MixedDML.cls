@isTest
private class MixedDML {
    static testMethod void mixedDMLExample() {  
        User u;
        Account a;
        User thisUser = [SELECT Id FROM User WHERE Id = :UserInfo.getUserId()];
       // Insert account as current user
     System.runAs (thisUser) {
            Profile p = [SELECT Id FROM Profile WHERE Name='Standard User'];
            UserRole r = [SELECT Id FROM UserRole WHERE Name='COO'];
            u = new User(alias = 'jth123', email='jsmith@acme.com', 
                emailencodingkey='UTF-8', lastname='Smith', 
                languagelocalekey='en_US', 
                localesidkey='en_US', profileid = p.Id, userroleid = r.Id,
                timezonesidkey='America/Los_Angeles', 
                username='jsmith22222@acme.com');
            insert u;
            a = new Account(name='Acme');
            insert a;
        }
    }
}