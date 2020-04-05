public class CalendarEventHandler{
  public static void CreateEventSF(List<CalendarEvent__e> vCalendarEventList){

    //initate the Event List.
    List<Event> vEventList = new List<Event>();
    
     for(CalendarEvent__e vCalEvent: vCalendarEventList){
       // CB needs to subscribe the event publish from AM and CIB. 
       //Created a check to skip the subscription of the  Self created event as this is CB System
      
        if(vCalEvent.source_system__c != 'CB'){
        //Convert the json to wrapper class instance
            CalendarEventWrapper vCalEventWrap =(CalendarEventWrapper)JSON.deserialize(vCalEvent.EventJson__c,CalendarEventWrapper.class);
         // We can create validation on subject, Description , StartDate, EndDate before instantiating Event object
            Event vEvent = new Event(Subject = vCalEventWrap.subject,
                                     Description = vCalEventWrap.Description,
                                     StartDateTime = vCalEventWrap.StartDate,
                                     EndDateTime = vCalEventWrap.EndDate);
                             
             vEventList.add(vEvent); 
               
        }
     }
     
     if(!vEventList.isEmpty()){
      // Create Event in CB
        insert vEventList;
     }
}
}