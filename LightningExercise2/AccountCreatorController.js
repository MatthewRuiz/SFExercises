({
    doInit : function(component, event, helper) {
        
    },
    
    //save the account to the database
	saveAccount : function(component, event, helper) {
        //get the relevant attributes from the component
		var accountName = component.get("v.AccountName");
        var state = component.get("v.AccountState");
        var contacts = component.get("v.SelectedContacts");
        console.log("selected these contacts: " + contacts);
        //Step 1 - create reference to server-side method
        var createNewAccount = component.get("c.newAccountDB");
        console.log("created reference to server side");
        //Step 2 - set parameters
        createNewAccount.setParams({"accName" : accountName, "state" : state, "contacts" : contacts});
        console.log("set Params");
        //Step 3 - set callBack
        createNewAccount.setCallback(this, function(response){
            var state = response.getState();
            if(component.isValid() && state === "SUCCESS") {
                //console.log('id of new account is: ' + response.getReturnValue());
                //navigate the user to the record detail page for the account they just created
                var accId = response.getReturnValue();
                console.log("got inside callback if statement");
                var navEvt = $A.get("e.force:navigateToSObject");
                console.log(navEvt);
                navEvt.setParams({
                    "recordId": accId,
                    "slideDevName": "detail"
                });
                
                navEvt.fire(); 
                console.log("navEvt fired. IDK if this line can be reached since i'll be redirected.\n :..(");
            } else if (state === "ERROR" || state == "ERROR"){
                var errors = response.getError();
                console.log(errors);
            } else {
                console.log('Unknown problem, response state: ' + state);
            }
        });
        console.log("got past call back");
        //Step 4 - enqueue action
        $A.enqueueAction(createNewAccount);
        console.log("action enqueued");
	},
    
    //load the contacts in the selected state
    loadContacts : function(component, event, helper) {
		//get the state to be passed to the server side controller        
        var state = component.get("v.AccountState");
        //Step 1 - create reference to server-side method
        var getContacts = component.get("c.getContacts");
        //Step 2 - set parameters
        getContacts.setParams({"state" : state,});
        //Step 3 - set CallBack
        getContacts.setCallback(this, function(response){
            if(response.getState() === "SUCCESS"){
                //console.log('setting the contacts to: ' + response.getReturnValue());
                //update list of contacts to show those in the state and enable the lightning:select
                component.set("v.ContactsInState", response.getReturnValue());
                component.set("v.disableList", false);
            } else if(response.getState() === "ERROR") {
                console.log('following error occured: ' + response.getError());
            } else {
                console.log('response has the following state: ' + response.getState());
            }
        });
        //Step 4 - enqueueAction
        $A.enqueueAction(getContacts);
    },
    
    //Add the current contact on the select element to the list of contacts to be related to the account
    addContact : function(component, event, helper) {
        var newContact = component.find("ContactSelect").get("v.value");
        var contactList = component.get("v.SelectedContacts");
        contactList.push(newContact);
        component.set("v.SelectedContacts", contactList);
    },
})