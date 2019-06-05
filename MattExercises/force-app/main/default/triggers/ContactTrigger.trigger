trigger ContactTrigger on Contact (before insert, before update, before delete, after insert, after update, after delete, after undelete) {
    //So first task is to create a trigger that updates the contacts to have a primary contact
    //if they don't have one, which they don't at the moment
    if(Trigger.isBefore && Trigger.isUpdate) {
        ContactTriggerHelper.updateContactsAsPrimaryContact(Trigger.new);
    }
}