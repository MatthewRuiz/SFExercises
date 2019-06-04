public class CreateContactAfterAccountCreation {

    //Get Account by most recent creation
    public static List<List<String>> searchAccountByLastModifiedDate() {
      
        Integer i = 0;
        
		List<String> eachId = new List<String>();
		List<String> eachPhone = new List<String>();
        List<String> eachBillingStreet = new List<String>();
        List<String> eachBillingCity = new List<String>();
        List<String> eachBillingState = new List<String>();
        List<String> eachBillingPostalCode = new List<String>();
        List<String> eachBillingCountry = new List<String>();
        
		List<List<String>> locatedAccounts = new List<List<String>>();
        
        for (Account eachAccount: [SELECT Id, Phone, BillingStreet, BillingCity, BillingState,
                                   BillingPostalCode, BillingCountry FROM Account ORDER BY LastModifiedDate DESC LIMIT 1]) {
            
            eachId.add(eachAccount.Id);
            eachPhone.add(eachAccount.Phone);
            eachBillingStreet.add(eachAccount.BillingStreet);
            eachBillingCity.add(eachAccount.BillingCity);
            eachBillingState.add(eachAccount.BillingState);
            eachBillingPostalCode.add(eachAccount.BillingPostalCode);
            eachBillingCountry.add(eachAccount.BillingCountry);
        }
        
        locatedAccounts.add(eachId);
        locatedAccounts.add(eachPhone);
        locatedAccounts.add(eachBillingStreet);
        locatedAccounts.add(eachBillingCity);
        locatedAccounts.add(eachBillingState);
        locatedAccounts.add(eachBillingPostalCode);
        locatedAccounts.add(eachBillingCountry);
        
        return locatedAccounts;
    }
    
    //A default contact is saved upon the creation of a new account.
    public static void saveContact(List<List<String>> useAccounts) {
        
      	List<Contact> contactsToInsert = new List<Contact>();
        
        Map<String, String> associatedPhone = new Map<String, String>();
        Map<String, String> associatedBillingStreet = new Map<String, String>();
        Map<String, String> associatedBillingCity = new Map<String, String>();
        Map<String, String> associatedBillingState = new Map<String, String>();
        Map<String, String> associatedBillingPostalCode = new Map<String, String>();
        Map<String, String> associatedBillingCountry = new Map<String, String>();
        
        List<String> accountId = new List<String>();
        
        //Throw Id's, phone numbers, billing streets, billing cities, billing states,
        //billing postal codes, and billing countries into a map
        for (Integer i = 0; i < useAccounts.get(0).size(); i++) {
            
            associatedPhone.put(useAccounts.get(0).get(i), useAccounts.get(1).get(i));
            associatedBillingStreet.put(useAccounts.get(0).get(i), useAccounts.get(2).get(i));
            associatedBillingCity.put(useAccounts.get(0).get(i), useAccounts.get(3).get(i));
            associatedBillingState.put(useAccounts.get(0).get(i), useAccounts.get(4).get(i));
            associatedBillingPostalCode.put(useAccounts.get(0).get(i), useAccounts.get(5).get(i));
            associatedBillingCountry.put(useAccounts.get(0).get(i), useAccounts.get(6).get(i));
            
            accountId.add(useAccounts.get(0).get(i));
        }
        
        try {
            
            for (Integer i = 0; i < useAccounts.get(0).size(); i++) {
                
                Contact eachContactToInsert = new Contact(AccountId = accountId.get(i),
                        FirstName = 'John',
                        LastName = 'Doe',
                        Phone = String.escapeSingleQuotes(associatedPhone.get(accountId.get(i))),
                        MailingStreet = String.escapeSingleQuotes(associatedBillingStreet.get(accountId.get(i))),
                        MailingCity = String.escapeSingleQuotes(associatedBillingCity.get(accountId.get(i))),
                        MailingState = String.escapeSingleQuotes(associatedBillingState.get(accountId.get(i))),
                        MailingPostalCode = String.escapeSingleQuotes(associatedBillingPostalCode.get(accountId.get(i))),
                        MailingCountry = String.escapeSingleQuotes(associatedBillingCountry.get(accountId.get(i))));
                
                contactsToInsert.add(eachContactToInsert);
            }
            
            insert contactsToInsert;
        } catch (DMLException e) {
            
            System.debug('Your contact(s) was/were not saved for the following reasons: ' + e.getMessage());
        }
    }
}
