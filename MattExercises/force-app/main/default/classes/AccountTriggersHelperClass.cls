public class AccountTriggersHelperClass {
    //Make a related contact when an account is inserted
    public static void MakeRelatedAccount(List<Account> accList) {
    List<sObject> MyContainer = new List<sObject>();
        //made a list for the eventual contacts, now to iterate over the account list
        Contact c = new Contact(FirstName = 'Matt', LastName = 'Iscoo', AccountId = accList[0].Id,
                               Phone = accList[0].Phone);
        System.debug(accList);
        MyContainer.add(c); 
        insert MyContainer; //inserts the contact
    }
}