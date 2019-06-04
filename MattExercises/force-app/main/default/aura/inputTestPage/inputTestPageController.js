({
    doInit : function(component, event, helper) {
        var action = component.get("c.getContact");
        action.Callback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("Body_Area__c", response.getReturnValue());
                console.log(response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    }
})