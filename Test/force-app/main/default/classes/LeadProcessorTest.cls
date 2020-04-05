@isTest
private class LeadProcessorTest {
  @isTest public static void LeadSourceUpdTest()
  {
      List<Lead> vLeadList = new List<Lead>();
      for(Integer i=0;i<200;i++) {
          vLeadList.add(new Lead(LastName = 'TestLead'+i, Company = 'TestCompany'+i));
      }
      insert vLeadList;
      
      
      Test.startTest();
      LeadProcessor vLeadProcessor  = new LeadProcessor();
      ID batchprocessid = Database.executeBatch(vLeadProcessor);

      Test.stopTest();
  }
}