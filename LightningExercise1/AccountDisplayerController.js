({
    doInit: function(component, event, helper) {
        //I put this in the helper becuase this project may need to 
        //get accounts multiple times if functionality was added on.
        helper.getAccountList(component);
        //Set the total accounts variable to the number of accounts in the database
        var action = component.get('c.getTotalAccounts');
        action.setCallback(this, function(actionResult) {
            var state = actionResult.getState();
            if(state === "SUCCESS"){
				component.set('v.totalAccounts', actionResult.getReturnValue());
                //Use this number to set the total number of pages
                component.set('v.totalPages', Math.ceil(actionResult.getReturnValue()));
                component.set('v.nextDisabled', action.getReturnValue() > 1);
            } else {
                console.log('state of response is: ' + state);
            }
            
        });
        $A.enqueueAction(action);
        
    },
    
    //Increment to the next page, refresh the list with those accounts, 
    //and determine if next should be disabled.
    nextPage: function(component, event, helper){
        component.set('v.pageNumber', component.get('v.pageNumber')+1);
        helper.getAccountList(component);
        helper.shouldNextBeDisabled(component);
        component.set('v.prevDisabled', false);
    },
    
    //Deccrement to the previous page, refresh the list with those accounts, 
    //and determine if previous should be disabled.
    prevPage: function(component, event, helper){
        component.set('v.pageNumber', component.get('v.pageNumber')-1);
        helper.getAccountList(component);
        helper.shouldPrevBeDisabled(component);
        component.set('v.nextDisabled', false);
    },
})