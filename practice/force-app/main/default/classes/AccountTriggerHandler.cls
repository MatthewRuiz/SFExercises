public class AccountTriggerHandler {
	
    public static void handleAfterInsert(List<Account> accts){
        List<Contact> ctcts = new List<Contact>();
        
        for (Account acct : accts){
            ctcts.add(new Contact(lastName = 'Whatever', AccountId = acct.Id));
        }
        insert ctcts;
    }
}