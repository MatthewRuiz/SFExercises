public class AccountTriggerHelper {
    // Create a trigger which prints out the ID of an Account before it is inserted.
    public static void printID(List<Account> accsToPrint){
        for(Account acc: accsToPrint){
            System.debug(acc.Id);
        }
    }
    // After an Account is inserted, create a contact that is associated with that Account.
    public static void createContact(List<Account> newContactAccounts){
        List<Contact> contactsToInsert = new List<Contact>();
        for(Account acc: newContactAccounts){
            Contact newContact = new Contact();
            newContact.AccountId = acc.id;
            newContact.LastName = Datetime.now().format();
            contactsToInsert.add(newContact);
        }
        insert contactsToInsert;
    }
}