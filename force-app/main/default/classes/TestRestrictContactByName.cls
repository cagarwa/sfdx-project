@isTest
private class TestRestrictContactByName {
    @isTest static void testVerifyDatecheck() {
        Contact vContact = new Contact(FirstName ='Test', LastName = 'INVALIDNAME');
        Test.startTest();
        Database.SaveResult  result = Database.insert(vContact, false);
        Test.stopTest();
        System.assert(!result.isSuccess());
        System.assert(result.getErrors().size() > 0);
        System.assertEquals('The Last Name "'+vContact.LastName+'" is not allowed for DML',
                             result.getErrors()[0].getMessage());
       
    }

}