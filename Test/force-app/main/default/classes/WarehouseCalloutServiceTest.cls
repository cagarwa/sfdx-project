@isTest
private class WarehouseCalloutServiceTest {
 @isTest static void testRvEquipmentCallOut() {
    Test.setMock(HttpCalloutMock.class, new WarehouseCalloutServiceMock());
    WarehouseCalloutService.runWarehouseEquipmentSync();
    
  }
 
}