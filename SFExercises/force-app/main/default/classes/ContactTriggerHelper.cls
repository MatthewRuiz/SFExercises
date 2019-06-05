public class ContactTriggerHelper {
    public static void verifyDuplicates(List<Contact> contactsToCheck){
        List<Contact> allContacts = [SELECT Id, Name, Birthdate FROM Contact];
        final String DUPLICATE_ERROR_MSG = 'Birthdate should be different for each Contact with the same Name';


        //First, check if duplicates exist within Trigger.new
        for (Integer i = 0; i < contactsToCheck.size()-1; i++) {
            for (Integer j = i+1; j < contactsToCheck.size(); j++) {
                if(isDuplicate(contactsToCheck[i], contactsToCheck[j])){
                    contactsToCheck[i].Birthdate.addError(DUPLICATE_ERROR_MSG);
                    contactsToCheck[j].Birthdate.addError(DUPLICATE_ERROR_MSG);
                }
            }
        }
        //Check if Trigger.new is duplicates with all Contacts in the org. 
        for(Contact newCon : contactsToCheck){
            for(Contact oldCon : allContacts){ 
                if(isDuplicate(newCon, oldCon)){
                    newCon.Birthdate.addError(DUPLICATE_ERROR_MSG);
                }
            }
        }
    }
    //houses the logic that defines what a duplicate is, in this context.
    private static Boolean isDuplicate(Contact con1, Contact con2){
        Boolean dupeNames = con1.Name == con2.Name;
        Boolean dupeDates = con1.Birthdate == con2.Birthdate;
        if(dupeDates){
            System.debug(con1.Name+' and '+con2.Name+' - Duplicate Dates');
            System.debug('con1='+con1.Birthdate+',con2='+con2.Birthdate);
        }
        if(dupeNames){
            System.debug(con1.Name+' and '+con2.Name+' - Duplicate Name');
        }
        return dupeDates&&dupeNames;
    }
}
