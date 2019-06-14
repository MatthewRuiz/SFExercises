public class SaveContact {
    
    //When a contact is created for a related account (no related contacts exist)
    //that account will be assigned a primary contact.  Subsequent
    //contact creations will not update the primary contact.
    public static void saveAccount(List<Contact> useContacts) {
        
        List<Account> accountsToUpdate = new List<Account>();
        Id Id = null;
        String accountId = '';
        
        try {
            
            //Find associated contact first name and last name.
            for (Contact eachContact: useContacts) {
                
                Id = eachContact.Id;
                accountId = eachContact.AccountId;
            }
            
            //Find associated account to assign the first name and last name to.
            for (Account eachAccount: [SELECT PrimaryContact__c FROM Account WHERE Id = :accountId]) {
                
                //If account already has a primary contact leave the primary contact as is.
                if (eachAccount.PrimaryContact__c == null) {
                    
                	eachAccount.PrimaryContact__c = Id;
                
                	accountsToUpdate.add(eachAccount);
                }
            }
            
            update accountsToUpdate;
        } catch (DMLException e) {
            
            System.debug('An unexpected error has occurred: ' + e.getMessage());
        }
    }
}
