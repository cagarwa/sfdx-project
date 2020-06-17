@RestResource(urlMapping='/Accounts/*/contacts')
global with sharing class AccountManager {

    @HttpGet
    global static Account getAccount() {
        RestRequest request = RestContext.request;
        
        String vAccountId = request.requestURI.substringBetween('/Accounts/','/contacts');
        
        Account result =  [SELECT Id,Name,(select Id,Name from Contacts)
                           FROM Account
                           WHERE Id = :vAccountId Limit 1];
        return result; 
    }

    

}