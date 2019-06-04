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
            c.LastName = 'Temporary';
            c.MailingStreet = acc.ShippingStreet;
            c.MailingCity = acc.ShippingCity;
            c.MailingCountry = acc.ShippingCountry;
            c.MailingState = acc.ShippingState;
            c.MailingPostalCode = acc.ShippingPostalCode;
            lstCon.add(c);
        }
        insert lstCon;
    }
}