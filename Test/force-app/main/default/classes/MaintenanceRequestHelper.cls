public class MaintenanceRequestHelper {
    
    public static void updateWorkOrders(){
       List<Case> vCaseList =[Select Id from Case];
        List<Account> vAccountList =[Select Id,Name from Account];
        List<Account> vAccountList2 =[Select Id,Name from Account];
        List<Account> vAccountList3 =[Select Id,Name from Account];
        List<Account> vAccountList4 =[Select Id,Name from Account];
        List<Account> vAccountList5 =[Select Id,Name from Account];
        List<Account> vAccountList6 =[Select Id,Name from Account];
        List<Account> vAccountList7 =[Select Id,Name from Account];
        List<Account> vAccountList8 =[Select Id,Name from Account];
        List<Account> vAccountList9 =[Select Id,Name from Account];
        List<Account> vAccountList10 =[Select Id,Name from Account];
        List<Account> vAccountList11 =[Select Id,Name from Account];
        
         List<Account> vAccountList12 =[Select Id,Name from Account];
        List<Account> vAccountList13 =[Select Id,Name from Account];
        List<Account> vAccountList14 =[Select Id,Name from Account];
        List<Account> vAccountList15 =[Select Id,Name from Account];
        List<Account> vAccountList16 =[Select Id,Name from Account];
        List<Account> vAccountList17 =[Select Id,Name from Account];
        List<Account> vAccountList18 =[Select Id,Name from Account];
        List<Account> vAccountList19 =[Select Id,Name from Account];
        List<Account> vAccountList20 =[Select Id,Name from Account];
        List<Account> vAccountList21 =[Select Id,Name from Account];
        
        List<List<Account>> vAccList = new List<List<Account>>();
        for(Integer i = 0;i<=5000;i++){
            List<Account> vAcc = new List<Account>();
            vAcc.addAll(vAccountList21);
            vAccList.add(vAcc);
        }
        String Test= 'abcd';
        String Test1 = 'Pqrst';
        
    }  
    public static void updateWorkOrders(Set<Case> closedCase, List<Work_Part__c> workPartList){
        List<Case> newCaseList = new List<Case>();
        Map<String, Decimal> mapOfCycle = getMapOfCycle(workPartList);
        for(Case ca : closedCase) {
                Case newCase = new Case();
                newCase.Status = 'New';
                newCase.Vehicle__c = ca.Vehicle__c;
                newCase.Type = 'Routine Maintenance'; 
                newCase.Subject = 'Routine Maintenance '+Date.today();
                newCase.Equipment__c = ca.Equipment__c;
                newCase.Date_Reported__c = Date.today();
                newCase.Date_Due__c = (mapOfCycle.containsKey(ca.Id) == true) ? Date.today().addDays(Integer.valueOf(mapOfCycle.get(ca.Id))) : null;
                newCaseList.add(newCase);
        }
      
         if(newCaseList.size()>0) {
            insert newCaseList;
        }
    } 
    
    private static Map<String,Decimal> getMapOfCycle(List<Work_Part__c> workPartList){
         Map<String, Decimal> mapOfCycle = new Map<String,Decimal>();
          for(Work_Part__c wp : workPartList){
            system.debug('~~'+wp.Equipment__r.Maintenance_Cycle__c);
            if(wp.Equipment__r.Maintenance_Cycle__c != null) {
                if(mapOfCycle.containsKey(wp.Maintenance_Request__c)) {
                    Decimal cyc = mapOfCycle.get(wp.Maintenance_Request__c);
                    if(cyc > wp.Equipment__r.Maintenance_Cycle__c) {
                        mapOfCycle.put(wp.Maintenance_Request__c, wp.Equipment__r.Maintenance_Cycle__c);
                    }
                }
                else {
                    mapOfCycle.put(wp.Maintenance_Request__c, wp.Equipment__r.Maintenance_Cycle__c);
                }
            }
        }
        return mapOfCycle;
    }
}