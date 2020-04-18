@isTest
private class MaintenanceRequestHelperTest {
    @isTest public static void MaintenanceRequestHelperTestMethod() {
       Vehicle__c vVehicle = new Vehicle__c(Name ='Toyota',Make__c = 'Toyota',Model__c = 'Camry' );
       insert vVehicle;
       
        Case vCase = new Case(Type = 'Routine Maintenance', Status = 'New', Date_Reported__c = Date.today(),Date_Due__c = Date.today()+5,Subject = 'Routine Maintenance',Vehicle__c =vVehicle.Id);
        insert vCase ;
        
        Product2 vProduct = new Product2(Name = 'TestProduct', Replacement_Part__c= true, Warehouse_SKU__c = '123',Maintenance_Cycle__c = 5, ProductCode = '123');
        insert vProduct ;
        Product2 vProduct1 = new Product2(Name = 'TestProduct1', Replacement_Part__c= true, Warehouse_SKU__c = '1234',Maintenance_Cycle__c = 6, ProductCode = '1234');
        insert vProduct1 ;
        Product2 vProduct2 = new Product2(Name = 'TestProduct2', Replacement_Part__c= true, Warehouse_SKU__c = '12345',Maintenance_Cycle__c = 3, ProductCode = '1234');
        insert vProduct2 ;

        
        Work_Part__c vWorkPart = new Work_Part__c(Equipment__c = vProduct.Id, Maintenance_Request__c = vCase.id,    Quantity__c = 1);
        insert vWorkPart ;
        
        Work_Part__c vWorkPart1 = new Work_Part__c(Equipment__c = vProduct1.Id, Maintenance_Request__c = vCase.id,    Quantity__c = 1);
        insert vWorkPart1 ;
        
        Work_Part__c vWorkPart2 = new Work_Part__c(Equipment__c = vProduct2.Id, Maintenance_Request__c = vCase.id,    Quantity__c = 1);
        insert vWorkPart2 ;
        
        Test.StartTest();
           vCase.Status = 'Closed';
           Update vCase;
           MaintenanceRequestHelper.updateWorkOrders();
        Test.StopTest();
     
    }
}