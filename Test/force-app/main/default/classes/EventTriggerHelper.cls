public class EventTriggerHelper{
      public static void publishToCalendarEvent(List<Event> vEventList){
          try{
              //Publish the Calendar Event to Plaform Event Object CalendarEvent__e
              List<CalendarEvent__e> vCalendarEventList = new List<CalendarEvent__e>();
              for(Event vEvent: vEventList){  
                //instantiate the CalendarEventWrapper class
                    CalendarEventWrapper vEventWrapper = new CalendarEventWrapper();
                    vEventWrapper.Subject =vEvent.subject;
                    vEventWrapper.StartDate = vEvent.StartDateTime;
                    vEventWrapper.EndDate = vEvent.EndDateTime;
                    vEventWrapper.Description = vEvent.Description; 
                      
                //instantiate the CalendarEvent Platform object
                     CalendarEvent__e  vCalendarEvent = new CalendarEvent__e();                                                         
                     vCalendarEvent.Source_System__c = 'CB';
                // Convert the CalendarEventWrapper class instance to String and assign to platform event object field
                     vCalendarEvent.EventJson__c  = json.serialize(vEventWrapper);
                     vCalendarEventList.add(vCalendarEvent);
              }
              
            // if platform Event Object list is not empty then write the data to Platform Event
              if(!vCalendarEventList.isEmpty()){
                 EventBus.publish(vCalendarEventList);
              }
              
          }catch(Exception e){
           //insert the stack trace and error to Custom Apex Exception Table 
          }
       }
      
}