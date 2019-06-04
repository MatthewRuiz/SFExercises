trigger AcctId on Account (after insert) {

    //After an Account is inserted, 
    //create a contact that is associated with that Account.
    if(trigger.isAfter && trigger.isInsert){
        List<Contact> lstCon = new List<Contact>();
        for(Account acc : Trigger.new){
            //for all accounts that are trigger.new get all id
            //create a new contact
            //set all id parentId of Contact to account id of new trigger
           	Contact c = new Contact();
            c.AccountId = acc.Id;
            c.LastName = acc.Name;
            lstCon.add(c);
        }
        insert lstCon;
    }
}