({
    // Fetch the accounts from the Apex controller
    getAccountList: function(component) {
        var action = component.get('c.getAccounts');
        action.setParams({theLimit : component.get('v.itemsPerPage'), pageNumber : component.get('v.pageNumber')});
        action.setCallback(this, function(actionResult) {
            component.set('v.accounts', actionResult.getReturnValue());
        });
        $A.enqueueAction(action);
    },
    
    //Determines if the next button should be clickable
    shouldNextBeDisabled: function(component){
        var total = component.get('v.totalPages');
        var current = component.get('v.pageNumber');
        component.set('v.nextDisabled', (current == total));
    },
    
    //Determines if the previous button should be clickable
    shouldPrevBeDisabled: function(component){
        var current = component.get('v.pageNumber');
        component.set('v.prevDisabled', (current === 0));
    },
})