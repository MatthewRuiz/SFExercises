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
            newContact.FirstName = acc.Name;
            newContact.LastName = 'Contact';
            newContact.MailingStreet = acc.ShippingStreet;
            newContact.MailingCity = acc.ShippingCity;
            newContact.MailingState = acc.ShippingState;
            newContact.MailingPostalCode = acc.ShippingPostalCode;
            newContact.MailingCountry = acc.ShippingCountry;
            contactsToInsert.add(newContact);
        }
        insert contactsToInsert;
    }
}