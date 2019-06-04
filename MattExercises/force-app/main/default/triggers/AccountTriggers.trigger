trigger AccountTriggers on Account (before insert, before update, before delete, after insert, after update, after delete, after undelete) {
    //We will try to have all of the account triggers here
    //Currently 3:04pm, and stuck on the concept of logic-less triggers, since that is one thing that 
    //the companies i've interviewed for said that I should be doing. Figured I'd use this as my "rubber duck".
    //So, I need to create a contact whenver an account is created, cool. Easy. I already have my helper class
    //ready to make a contact ready. The problem is that I need the helper class to follow up the trigger.
    if(Trigger.isAfter && Trigger.isInsert) {
    AccountTriggersHelperClass.MakeRelatedAccount(Trigger.new);
    }
}