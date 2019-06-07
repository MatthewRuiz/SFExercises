public class AccountListPagination {   
	public integer noOfRecords ;
	public static integer PageSize {get;set;}
   	public ApexPages.StandardSetController setCon {
        get {
            if(setCon == null) {               
                setCon = new ApexPages.StandardSetController(Database.getQueryLocator(
                      [select id,Name from Account]));
                setCon.setPageSize(PageSize); 
                noOfRecords = setCon.getResultSize();
            }           
            return setCon;
        }
        set;
    }
     
public AccountListPagination(ApexPages.StandardSetController controller) {
        PageSize = 5;
        setCon =controller;
        setCon.setpagesize(PageSize);
    }

//Changes the size of pagination

    public PageReference refreshPageSize() {
         setCon.setPageSize(PageSize);
         return null;
    }


}