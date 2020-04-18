trigger SubscribeCalendarEvent on CalendarEvent__e (after insert) {
 
     CalendarEventHandler.CreateEventSF(trigger.new);
  
}