@isTest
private class AddPrimaryContactTest {
  @isTest public static void PrimaryContactTest()
  {
      List<Account> vAccountList = new List<Account>();
      for(Integer i=0;i<50;i++) {
          vAccountList.add(new Account(Name = 'TestAccount'+i, BillingState = 'NY'));
      }
      for(Integer i=0;i<50;i++) {
          vAccountList.add(new Account(Name = 'TestAccount'+i, BillingState = 'CA'));
      }
      insert vAccountList;
      
      Contact vContact = new Contact(FirstName = 'TestFirst' , LastName ='TestLast');
          
      insert vContact;
      
      Test.startTest();
      AddPrimaryContact vAddPrimaryContact = new AddPrimaryContact(vContact,'CA');
      System.enqueueJob(vAddPrimaryContact);
      Test.stopTest();
  }
}