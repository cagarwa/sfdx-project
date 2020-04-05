public class EventTriggerHandler{
   public Static void EventTriggerHandlerMethod(List<Event> vEventList, System.TriggerOperation OperationType){
     
    try{
         switch on (OperationType) {
              when AFTER_INSERT {
                EventTriggerHelper.publishToCalendarEvent(vEventList);
              }
              
              when AFTER_UPDATE {
                EventTriggerHelper.publishToCalendarEvent(vEventList);
              }
         } 
       } catch(Exception e){
          // insert the stack trace and error to Apex Exception Table 
       }
 }
}