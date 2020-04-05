@IsTest
private class AccountManagerTest {

    @isTest static void testGetAccountById() {
        Id recordId = createTestRecord();
        // Set up a test request
        RestRequest request = new RestRequest();
        request.requestUri ='https://na50.salesforce.com/services/apexrest/Accounts/' + recordId+'/contacts';
        request.httpMethod = 'GET';
        RestContext.request = request;
        // Call the method to test
        Account theAccount = AccountManager.getAccount();
        // Verify results
        System.assert(theAccount != null);
       
    }

   static Id createTestRecord() {
        // Create test record
        Account accountTest = new Account(Name='Test record');
        insert accountTest;
       
        Contact contactTest = new Contact(AccountId =accountTest.Id, FirstName = 'Chandan', LastName = 'Agarwal');
        insert contactTest;
       
        return accountTest.Id;
    }       
}