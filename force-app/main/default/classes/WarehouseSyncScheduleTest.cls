@isTest
private class WarehouseSyncScheduleTest {
    @isTest public static void WareHouseSyncTest() {
        
     String cronExp = '0 0 0 15 3 ? 2022';
    
      Test.startTest();
          Test.setMock(HttpCalloutMock.class, new WarehouseCalloutServiceMock());
          WarehouseSyncSchedule vWarehouseSyncSchedule  = new WarehouseSyncSchedule();
          ID batchprocessid = system.schedule('WarehouseSyncScheduleJob', cronExp, vWarehouseSyncSchedule);
       Test.stopTest();
    }
}