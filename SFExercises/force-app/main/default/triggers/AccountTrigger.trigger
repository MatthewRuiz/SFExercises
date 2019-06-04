trigger AccountTrigger on Account (before insert, after insert) {
    if(Trigger.isBefore && Trigger.isInsert){
        AccountTriggerHelper.printID(Trigger.new);
    }
    if(Trigger.isAfter&& Trigger.isInsert){
        AccountTriggerHelper.createContact(Trigger.new);
    }
}