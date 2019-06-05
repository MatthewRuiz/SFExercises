trigger ContactTrigger on Contact (before insert) {
    if(Trigger.isBefore && Trigger.isInsert){
        ContactTriggerHelper.verifyDuplicates(Trigger.new);
    }
}