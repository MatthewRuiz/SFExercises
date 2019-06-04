public class AccountTriggerHelper {
    /* Create a trigger which prints out the ID of an Account before it is inserted. */
    public static void printID(Account accToPrint){
        System.debug(accToPrint.Id);
    }
}