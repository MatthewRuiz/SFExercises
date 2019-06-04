trigger PrintIdOnAcct on Account (before insert) {
    
    //Create a trigger which prints out the ID of an Account before it is inserted.
    if(trigger.isBefore && trigger.isInsert){
        for(Account acct : Trigger.new){
            System.debug('Account Id: ' + acct.Id);
        }
    }
}