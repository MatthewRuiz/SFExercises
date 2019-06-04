trigger AccountTrigger on Account (before insert, after insert) {
    
	//1.Create a trigger which prints out the ID of an Account before it is inserted.
    //before the record is inserted execute this code
    if(Trigger.isBefore && Trigger.isInsert){
    for(Account acct : Trigger.new){
        //call the helper class to execute logic
        PrintIdTriggerHelper.PrintAccountId(acct);
    }
    }
  
}