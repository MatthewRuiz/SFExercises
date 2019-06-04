public class Soql1AccList {
	public static List<Account> accList(){
        List <Account> aList= new List<Account>();
        aList= [Select name, Id from Account Order By Name Desc];
            
        System.debug(aList.size());
        return aList;
    }
}