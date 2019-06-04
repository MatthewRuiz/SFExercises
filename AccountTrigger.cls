trigger AccountTrigger on Account (before insert, after insert) {
    
	//1.Create a trigger which prints out the ID of an Account before it is inserted.
    //before the record is inserted execute this code
    if(Trigger.isBefore && Trigger.isInsert){
    for(Account acct : Trigger.new){
        PrintIdTriggerHelper.PrintAccountId(acct);
    }
    }
   
    //2. After an Account is inserted, create a contact that is associated with that Account.
    //After the record is inserted execute this code
    if(Trigger.isAfter && Trigger.isInsert){
        //Create an empty list of contacts in order to insert all contacts after loop
        List<Contact> cons = new List<Contact>();
 		//Loops through all the new accounts created
                for(Account acct : Trigger.new){
                    // calls the trigger helper where the contacts are instantiated
               		cons.add(AssociatedContactTriggerHelper.CreateContact(acct));     
                }
        //Inserts the associated contacts after the loop
        insert cons;  
    }

}