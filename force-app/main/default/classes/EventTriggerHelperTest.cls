@isTest
public class EventTriggerHelperTest{

//Code Coverage for insert scenario 
 @isTest static void testCalendarEventInsert(){
     List<Event> vEVentList = new List<Event>();
     for(integer i=0;i<20;i++){
       Event vEvent = new Event(Subject = 'Test Event'+i,Description= 'Test Event Desc'+i, StartDateTime = System.now(), EndDateTime = System.now()+1);
       vEVentList.add(vEvent);
     }
     if(!vEventList.isEmpty()){
       insert vEVentList;
     }
     system.assertEquals(20,vEVentList.size());
 } 
 

 
 //Code Coverage for update scenario 
 @isTest static void testCalendarEventUpdate(){
    List<Event> vEVentList = new List<Event>();
     for(integer i=0;i<20;i++){
       Event vEvent = new Event(Subject = 'Test Event'+i,Description= 'Test Event Desc'+i,StartDateTime = System.now(), EndDateTime = System.now()+1);
       vEVentList.add(vEvent);
     }
     if(!vEventList.isEmpty()){
       insert vEVentList;
     }
     system.assertEquals(20,vEVentList.size());
     
     for(Event vEvent: vEVentList){
       vEvent.Subject = 'Test Update';
     }
     
     update vEVentList;
 }
}