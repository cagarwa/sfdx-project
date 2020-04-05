({
	clickCreateItem  : function(component, event, helper) {
		   var validItem = component.find('Itemform').reduce(function (validSoFar, inputCmp) {
            inputCmp.showHelpMessageIfInvalid();
            return validSoFar && inputCmp.get('v.validity').valid;
        }, true);
          
        if(validItem)  {
            var vItem = component.get("v.newItem");
            helper.createItem(component,vItem)
        }
          
          /*var vItem = component.get("v.newItem");
          var theItems = component.get("v.items");
          theItems.push(json.stringify(vItem));
          component.set("v.items",theItems);
        
          component.set("v.newItem",{'sobjectType': 'Camping_Item__c',
                        'Name': '',
                        'Quantity__c': 0,
                        'Price__c': 0,
                        'Packed__c': false })*/
	},
    
     doInit: function(component, event, helper) {
        var action = component.get("c.getItems");
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.items", response.getReturnValue());
            }
            else {
                console.log("Failed with state: " + state);
            }
        });

        $A.enqueueAction(action);
    },
    
    
    handleAddItem: function(component, event, helper) {
        var newItem = event.getParam("item");
        var action = component.get("c.saveItem");
        action.setParams({
            "item": item
        });
        
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                var items = component.get("v.items");
                items.push(response.getReturnValue());
                component.set("v.items", items);
            }
        });
        $A.enqueueAction(action);
    }
})