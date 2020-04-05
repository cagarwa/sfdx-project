({
	createItem  : function(component,item) {
		 var validItem = component.find('Itemform').reduce(function (validSoFar, inputCmp) {
            inputCmp.showHelpMessageIfInvalid();
            return validSoFar && inputCmp.get('v.validity').valid;
        }, true);
        
      if(validItem) {
            var createEvent = component.getEvent("addItem");
            createEvent.setParams({ "item": item });
            createEvent.fire();
            component.set("v.newItem",{'sobjectType': 'Camping_Item__c',
                        'Name': '',
                        'Quantity__c': 0,
                        'Price__c': 0,
                        'Packed__c': false })
       }
	}
    
   
})