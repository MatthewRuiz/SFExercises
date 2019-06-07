({
    doInit : function(component, event, helper) {
        component.set('v.columns', [
            {label: 'Account Name', fieldName: 'Name', type: 'text'},
            {label: 'Industry', fieldName: 'Industry', type: 'text'},
            {label: 'City', fieldName: 'BillingCity', type: 'text'},
            {label: 'State', fieldName: 'BillingState', type: 'text'}
        ]);
        helper.getData(component);
    },
})
