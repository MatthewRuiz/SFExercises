({
    getData : function(component) {
        var action = component.get('c.getAccounts');
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set('v.accounts', response.getReturnValue());
            } else if (state === "ERROR") {
                var errors = response.getError();
                console.error(errors);
            }
        });
        $A.enqueueAction(action);
    }
})