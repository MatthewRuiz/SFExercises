({
    createAccount : function(component, event) {
        // fetch account creation method and fulfill parameter
        var newAccount = component.get("v.newAccount");
        var accountRequest = component.get("c.addAccount");
        
        accountRequest.setParams({ 
            "newAccount": newAccount
        });
        
        accountRequest.setCallback(this, function(response) {
            var state = response.getState();
            if (component.isValid() && state === "SUCCESS") {
                alert("Record has been saved successfully");
            } else {
                alert("Unknown problem, response state: " + state);
            }
        });
        
        $A.enqueueAction(accountRequest);
    }
})