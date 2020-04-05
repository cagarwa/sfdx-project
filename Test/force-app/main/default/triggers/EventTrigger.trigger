trigger EventTrigger on Event (after insert,after update) {
   EventTriggerHandler.EventTriggerHandlerMethod(trigger.new, trigger.operationType);
}