({
	packItem  : function(component, event, helper) {
		var btnClicked = event.getSource();
        var vItem = component.get("v.item");
        vItem.Packed__c = true;
        component.set("v.item",vItem);
        btnClicked.set("v.disabled","true");
                  
	},
    
     
   })