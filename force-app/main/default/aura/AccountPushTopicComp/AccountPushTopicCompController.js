({
    // Sets an empApi error handler on component initialization
    onInit : function(component, event, helper) {
        const empApi = component.find('empApi');
        empApi.onError($A.getCallback(error => {
            console.error('EMP API error: ', error);
        }));
          
        const channel = component.get('v.channel');  
        const replayId = -1;
         empApi.subscribe(channel, replayId, $A.getCallback(eventReceived => {
            console.log('Received event ', JSON.stringify(eventReceived));
            console.log(JSON.parse(JSON.stringify(eventReceived)));
            var vEentRec = JSON.parse(JSON.stringify(eventReceived));
            console.log(vEentRec.data.sobject);
            if(vEentRec.data.sobject.Id ==component.get("v.accountRecord.Id") ){ 
              
              component.set('v.accountRecord', vEentRec.data.sobject);
            }
        }))
        .then(subscription => {
            console.log('Subscribed to channel ', subscription.channel);
        });
    },



})