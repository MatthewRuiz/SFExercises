public class ContactTriggerHelper {
    //Method to update the contacts as the primary contact, only if there is a related contact
    public static void updateContactsAsPrimaryContact(List<Contact> conList) {
        //List returns contacts with VP Titles and related accounts 
        List<Contact> checkList = [SELECT Name, AccountId, Title FROM Contact WHERE AccountId != NULL AND Title = 'VP' ];
        //if the contact's relAcct field is empty, update the list
        for(Contact c : checkList) {
            if(c.Related_Account__c == NULL) {
                conList.add(c);
            } 
        }
        update conList;
    }
}