({
	doInit : function(component, event, helper) {
		const action = component.get('c.getAccts');
        action.setCallback(this,function(res){
            let state = res.getState();
            if(component.isValid() && state === "SUCCESS"){
                component.set('v.accts',res.getReturnValue());
            }
        });
        $A.enqueueAction(action);
	}
})