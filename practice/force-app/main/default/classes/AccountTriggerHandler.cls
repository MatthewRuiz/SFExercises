public class AccountTriggerHandler {
	
    public static void handleAfterInsert(List<Account> accts){
        List<Contact> ctcts = new List<Contact>();
        
        for (Account acct : accts){
            Contact newCtct = new Contact(lastName = 'Whatever', 
                                  		  AccountId = acct.Id);
            newCtct.MailingStreet = acct.ShippingStreet;
            newCtct.MailingCity = acct.ShippingCity;
            newCtct.MailingState = acct.ShippingState;
            newCtct.MailingCountry = acct.ShippingCountry;
            newCtct.MailingPostalCode = acct.ShippingPostalCode;    
            ctcts.add(newCtct);
        }
        insert ctcts;
    }
}