trigger makeContactOnAccount on Account (after insert) {
//make a contact when an account is created
//isInsert
    List<Contact> conList = new List<Contact>();
    for(Account a : Trigger.new){
        Contact c = new Contact(LastName = 'TriggerContact', AccountId = a.Id);
        conList.add(c);
    }
    insert conList;
}