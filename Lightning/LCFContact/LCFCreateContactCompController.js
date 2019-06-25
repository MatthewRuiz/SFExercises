({
	createContact : function(component, event, helper) {
		// create a call request and set its parameter
        var createContactRequest = component.get("c.createContact");
        var newContact = component.get("v.newContact");
        createContactRequest.setParams({
            "newContact" : newContact
        });

        // create a callback request and invoke server-side method
        createContactRequest.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.newContact", "{'sobjectType' : 'Contact', 'LastName' : ''}");
            } else if (state === "ERROR") {
                var errors = response.getError();
                if (errors) {
                    if (errors[0] && errors[0].message) {
                        console.log("Error message: " + errors[0].message);
                    }
                } else {
                    console.log("Unknown error");
                }
            }
        });

        // send the call request to the queue
        $A.enqueueAction(createContactRequest);
	}
})