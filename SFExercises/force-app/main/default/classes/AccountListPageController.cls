public class AccountListPageController {
    private final Integer PAGE_SIZE = 5;
    private Integer rowCount;
    public ApexPages.StandardSetController setCon {
        get {
            if(setCon == null) {                
                setCon = new ApexPages.StandardSetController(Database.getQueryLocator(
                    [SELECT Id, Name FROM Account]));
                setCon.setPageSize(PAGE_SIZE);  
                rowCount = setCon.getResultSize();
            }            
            return setCon;
        }
        set;
    }
    
    public List<Account> getAccounts(){
        return (List<Account>) setCon.getRecords();
    }
    
}