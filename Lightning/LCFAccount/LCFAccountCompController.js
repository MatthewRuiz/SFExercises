({
	doInit : function(component, event, helper) {
        var action = component.get('c.getAccounts');
        // Set up the callback
        action.setCallback(this, function(actionResult) {
            component.set('v.accounts', actionResult.getReturnValue());
        });
        $A.enqueueAction(action);
	}
})