@isTest
private class DailyLeadProcessorTest {
    @isTest public static void DLeadProcessorTest() {
        List<Lead> vLeadList = new List<Lead>();
          for(Integer i=0;i<200;i++) {
              vLeadList.add(new Lead(LastName = 'TestLead'+i, Company = 'TestCompany'+i));
          }
         insert vLeadList;
     String cronExp = '0 0 0 15 3 ? 2022';
    
      Test.startTest();
          DailyLeadProcessor vLeadProcessor  = new DailyLeadProcessor();
          ID batchprocessid = system.schedule('DailyLeadProcessorJob', cronExp, vLeadProcessor);
       Test.stopTest();
    }
}