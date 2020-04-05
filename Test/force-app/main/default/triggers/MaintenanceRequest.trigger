trigger MaintenanceRequest on Case (before update, after update) {
    // call MaintenanceRequestHelper.updateWorkOrders
    if(Trigger.isUpdate && Trigger.isAfter) {
        List<Case> newCaseList = new List<Case>();
        Set<Case> closedCase = new Set<Case>(); 
        for(Case ca: Trigger.new) {
            if(ca.Status == 'Closed' && (ca.Type == 'Repair' || ca.Type == 'Routine Maintenance')) {
                closedCase.add(ca);
                
            }
        }
        
        List<Work_Part__c> workPartList = [SELECT Id,Equipment__r.Maintenance_Cycle__c,Maintenance_Request__c from Work_Part__c where Maintenance_Request__c in :closedCase];
        System.debug(workPartList);
        MaintenanceRequestHelper.updateWorkOrders(closedCase, workPartList);
       
    }  
}