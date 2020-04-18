@isTest(SeeAllData=false)
public class SubscribeCalendarEventTest {
    @isTest static void testCalendarEventValid() { 
        // Create a test event instance
         CalendarEventWrapper vCalEventWrap =new CalendarEventWrapper();
         vCalEventWrap.subject = 'Test Subscription Event AM';
         vCalEventWrap.Description = 'Test Subscription Event AM Description';
         vCalEventWrap.StartDate = System.now();
         vCalEventWrap.EndDate = system.now()+2;
         
        CalendarEvent__e vCalendarEvent = new CalendarEvent__e(EventJson__c = JSON.Serialize(vCalEventWrap),
                                                               Source_System__c ='AM'
                                                                           );
        Test.startTest();
        // Publish test event
          Database.SaveResult sr = EventBus.publish(vCalendarEvent); 
          Test.getEventBus().deliver();
        Test.stopTest();
        // Verify SaveResult value
        System.assertEquals(true, sr.isSuccess());
        // Verify that a case was created by a trigger.
        List<Event> vEventList = [SELECT Id, Subject, Description FROM Event];
        // Validate that this case was found
        System.assertEquals(1, vEventList.size());
        System.assertEquals(vEventList[0].Subject, 'Test Subscription Event AM');
        System.assertEquals(vEventList[0].Description, 'Test Subscription Event AM Description');
    }
    
    @isTest static void testInvalidEvent() {
        
        // Create a test event instance with invalid data.
        // Subject field is required for Event.
        // Publishing with a missing required field should fail.
         CalendarEventWrapper vCalEventWrap =new CalendarEventWrapper();
         //vCalEventWrap.subject = 'Test Subscription Event AM';
         vCalEventWrap.Description = 'Test Subscription Event AM Description';
         vCalEventWrap.StartDate = System.now();
         vCalEventWrap.EndDate = system.now()+2;
         
        CalendarEvent__e vCalendarEvent = new CalendarEvent__e(EventJson__c = JSON.Serialize(vCalEventWrap),
                                                               Source_System__c ='AM'
                                                                           );
        Test.startTest();
        // Publish test event
          Database.SaveResult sr = EventBus.publish(vCalendarEvent);
           
        Test.stopTest();
        // Verify SaveResult value - isSuccess should be false
        System.assertEquals(false, sr.isSuccess());
        
        // Log the error message
        for(Database.Error err : sr.getErrors()) {
            System.debug('Error returned: ' +
                        err.getStatusCode() +
                        ' - ' +
                        err.getMessage()+' - '+err.getFields());
        }
        
        // Verify that a Event was NOT created by a trigger.
        List<Event> vEventList = [SELECT Id, Subject, Description FROM Event];
        // Validate that this Event was found
        System.assertEquals(0, vEventList.size());
    }
}