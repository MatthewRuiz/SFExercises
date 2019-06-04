trigger AccountTrigger on Account (before insert) {
    if(Trigger.isBefore && Trigger.isInsert){
        for(Account acc: Trigger.new){
           AccountTriggerHelper.printID(acc);
        }
    }
}