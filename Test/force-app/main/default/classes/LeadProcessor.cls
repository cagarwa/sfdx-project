global class LeadProcessor implements Database.Batchable<sObject> {
    global Database.QueryLocator start(Database.BatchableContext BC){
      return Database.getQueryLocator('Select Id, LeadSource from Lead');
   }
    
     global void execute(Database.BatchableContext BC, List<Lead> scope){
         for(Lead vLead : scope){
           vLead.LeadSource = 'Dreamforce';
         }
         update scope;
    }
    
    global void finish(Database.BatchableContext BC){
    }

}