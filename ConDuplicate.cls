trigger DuplicateConValidation on Contact (before insert, before update) {
    
    //Prevent duplicate Contacts from being created.
    if(trigger.isBefore){
        //list of all contacts with birthday to compare to the new contact birthday
        List<Contact> lstCon = [SELECT Id, LastName, Birthdate FROM Contact WHERE Birthdate != null];
        //comparing the new contact to each contact by name and birthday
        for(Contact c : Trigger.new){
            for(Contact con : lstCon){
                System.debug(c.LastName +': Birthday: ' + c.Birthdate);
                System.debug(con.LastName + ': Birthday: ' + con.Birthdate);                
                if(c.Birthdate == con.Birthdate && c.LastName == con.LastName){
                    c.addError('Duplicate Contact');
                }
            }
        }
    }
}