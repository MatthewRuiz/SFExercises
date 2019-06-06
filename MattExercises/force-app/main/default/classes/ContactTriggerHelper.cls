public class ContactTriggerHelper {
    //Method to update the contacts as the primary contact, only if there is a related contact
    public static void updateContactsAsPrimaryContact(List<Contact> conList) {
        //List<Contact> updateList = new List<Contact>();
        List<Contact> debugList = [SELECT Name, AccountId, Title, Related_Account__c FROM Contact 
                                   WHERE AccountId != NULL AND Title LIKE 'VP%'];
        System.debug(JSON.serializePretty(conList));
        //We need the contacts in our org to match the criteria set in "updateList"
        for(Contact c : debugList) {
            c.Related_Account__c = c.AccountId;
            conList.add(c);
        }
        System.debug(JSON.serializePretty(conList));
        update conList;
    }
}