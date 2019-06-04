public class SOQLQueries {

    public static List<Account> accountsWith520AreaCode() {
        //Returns a list of all accounts that have the 520 area code
        
        return [SELECT Id, Name, Phone FROM ACCOUNT WHERE Phone LIKE '(520)%'];
    }
    
    public static List<Account> accountsWithWebsite() {
        //Returns a list of all accounts with a website
        
        return [SELECT Id, Name, website FROM ACCOUNT WHERE Website != ''];
    }
    
    public static List<Account> accountsWithAccountsDescending() {
        //Returns a list of accounts with accounts starting with z at the top and a at the bottom
        
        return [SELECT Id, Name FROM ACCOUNT ORDER BY Name Desc];
    }
    
    public static List<Account> accountsInEnergyIndustryAndRelatedContacts() {
        //Returns a list of accounts in the 'Energy' industry and their related contacts
        
        return [SELECT Id, Name, (SELECT Name FROM CONTACTS) FROM ACCOUNT WHERE industry = 'Energy'];
    }
    
    public static List<AggregateResult> numberOfLeadsWithSameLeadSource() {
        //Returns a list displaying the number of leads with the same lead source
        
        return [SELECT leadsource, Count(Id) FROM LEAD GROUP BY leadsource];
    }
}