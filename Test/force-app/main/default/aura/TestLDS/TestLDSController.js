({
	doInit : function(component, event, helper) {
		alert(component.get("v.simpleRecord.name"));
	},
    
    handleClick : function(component, event, helper) {
		alert(component.get("v.simpleRecord.Name"));
        alert(component.get("v.record.fields.Name.value"));
        component.set("v.recordstring",JSON.stringify(component.get("v.simpleRecord")));
        component.set("v.recordstring1",JSON.stringify(component.get("v.record")));
        alert(JSON.stringify(component.get("v.record")));
	},
    
    showToast : function(component, event, helper) {
    var toastEvent = $A.get("e.force:showToast");
    toastEvent.setParams({
        "title": "Success!",
        "message": "The record has been updated successfully."
    });
    toastEvent.fire();
}
    
})