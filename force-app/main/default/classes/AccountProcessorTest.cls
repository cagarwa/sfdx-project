@isTest
private class AccountProcessorTest {
  @isTest public static void ContactCountTest()
  {
      List<Account> vAccountList = new List<Account>();
      for(Integer i=0;i<200;i++) {
          vAccountList.add(new Account(Name = 'TestAccount'+i));
      }
      insert vAccountList;
      
      List<Contact> vContactList = new List<Contact>();
      List<Id> vAccountIdList = new List<Id>();
      for(Account vAccount : vAccountList) {
          for(Integer i=0; i<10; i++) {
              vContactList.add(new Contact(FirstName = 'TestFirst'+i , LastName ='TestLast'+i, AccountId =vAccount.Id ));
          }
          vAccountIdList.add(vAccount.Id);
      }
      
      insert vContactList;
      Test.startTest();
      AccountProcessor.countContacts(vAccountIdList);
      Test.stopTest();
  }
}