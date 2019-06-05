public class AccountTriggersHelperClass {
    //Make a related contact when an account is inserted
    public static void MakeRelatedAccount(List<Account> accList) {
    List<Contact> MyContainer = new List<Contact>();
        Boolean hasDup = False;
        List<Contact> ListForBdayCheck = [SELECT Name, Birthdate FROM Contact WHERE Birthdate != NULL];
        //made a list for the eventual contacts, now to iterate over the account list
        Contact c = new Contact(FirstName = 'Matt', LastName = 'Iscoo', AccountId = accList[0].Id,
                               Phone = accList[0].Phone);
        
        //The client wants to prevent contacts from being createad if they have the same birthday
        //I want this to only insert if the contacts bday isn't similar to a contact in the list
        //Iterate through all the contacts within my list 
        for(Contact conBday: ListForBdayCheck){
            //If the bday of my contact doesn't match any of my org continue the for loop
            if(c.Birthdate != conBday.Birthdate) {
                 continue;
                //Else, set the hasDup boolean to true and break the for loop
            } else {
                hasDup = True;
                break;
            }
        }
        //If the the contact created doesn't have any mathcing duplicates within the org, add it to be inserted
        if(hasDup == False){
            MyContainer.add(c);
        }
        
        insert MyContainer; //inserts the contact
    }
}