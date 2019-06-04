public class AssociatedContactTriggerHelper {
    public static Contact CreateContact(Account associatedAccount){
        //create a contact from account passed into function and then returns the value to be implemented in trigger
        Contact con = new Contact( LastName = associatedAccount.name, AccountId = associatedAccount.id);
        return con;
    }
}