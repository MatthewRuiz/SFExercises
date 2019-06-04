trigger newTaskTrigger on Account (after insert) {
    //Get accounts that have HI
    //Make a task for them
    List<Task> taskList = new List<Task>();
    
    for(Account a: Trigger.new) {
        if(a.BillingState == 'HI') {
            taskList.add(new Task(subject = 'Aloha Ohana :)', status = 'open', priority = 'normal', whatId = a.Id, ownerId = a.ownerId)); //kill me plz
        }
    }
    insert taskList;
}