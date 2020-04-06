trigger FeedItemTrigger on FeedItem (after update) {
    List<FeedAttachment> attachments =  [SELECT Id, Title, Type, FeedEntityId 
                                         FROM FeedAttachment 
                                         WHERE FeedEntityId IN :Trigger.new ];
    Map<Id,Id> vMap = new Map<Id,Id>();
    for (FeedAttachment attachment : attachments) {
        System.debug(attachment.Type);
    }
    
    for(FeedItem vFeedItem :Trigger.new ){
        System.assertEquals(true,false,vMap.containsKey(vFeedItem.Id));
        if(vMap.containsKey(vFeedItem.Id)){
            vFeedItem.addError('Attachment not allowed');
        }
    }
}