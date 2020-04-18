public class ProjectCalloutService {
    //Complete the implementation for business and callout logic 
    private class PMSOptyStructure {
          String opportunityId;
          String opportunityName;
          String accountName;
          Date closeDate;
          Decimal amount;
          PMSOptyStructure(Opportunity vNewOpty) {
             this.opportunityId = vNewOpty.Id;
             this.opportunityName = vNewOpty.Name;
             this.accountName = vNewOpty.Account.name;
             this.closeDate = vNewOpty.CloseDate;
             this.amount = vNewOpty.Amount;
          }
       }
    
    @future(Callout=true)
    public static void postOpportunityToPMS(Id[] vOptyId){
       String vPMSJSONOptyString;
       
       if(vOptyId.size() >0) {
              Opportunity vOpportunity = [Select Id, Name, Account.Name,CloseDate, Amount from Opportunity where Id =:vOptyId[0]];
              PMSOptyStructure vPMSOptyStructure = new PMSOptyStructure(vOpportunity);
              vPMSJSONOptyString = JSON.serialize(vPMSOptyStructure);  
                    
              ServiceTokens__c vServiceToken = ServiceTokens__c.getInstance('ProjectServiceToken');
               
              HttpRequest vReq = new HttpRequest();
              vReq.SetEndPoint('callout:ProjectService');
              vReq.SetHeader('Content-Type','application/json');
              vReq.SetHeader('token',vServiceToken.Token__c );
              vReq.SetMethod('POST');
              vReq.SetBody(vPMSJSONOptyString);
              Http vHttp = new Http();
              
              HttpResponse vRes = vHttp.send(vReq);
              
              if (vRes.getStatusCode() == 201) {  
                   String vResponse = vRes.getBody();
                   system.debug('Response :  '+vResponse);
               }
         }
    }
    
    public class QueueablePMSCall implements Queueable,Database.AllowsCallouts {
        List<Id> vOptyIdList;
        public QueueablePMSCall(List<Id> vOptyIdList) {
          this.vOptyIdList= vOptyIdList;
        }
        public void execute(QueueableContext context) {
            ProjectCalloutService.postOpportunityToPMS(vOptyIdList);       
        }
    }
    
       
    @InvocableMethod
    public Static void ProjectServiceEnqueueCallout(Id[] vOptyId) {
        QueueablePMSCall vQueueablePMSCall  = new QueueablePMSCall(vOptyId);
        ID jobID = System.enqueueJob(vQueueablePMSCall);
        System.debug('jobID :'+jobID);
    }
    
    
        
}