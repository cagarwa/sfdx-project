({
	clickCreateItem : function(component, event, helper) {
        var item = component.get("v.newItem");
		helper.createItem(component,item);
	}
})