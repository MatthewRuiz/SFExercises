public class SOQL {

    public static List<Account> getAcct(){
        //All Accounts that have the 520 area code.
       return [SELECT Id, Name, Phone FROM Account WHERE Phone LIKE '_502%'];
    }
    
    public static List<Account> acctWithWeb(){
        //All Accounts with a website
        return [SELECT Id, Name, Website FROM Account WHERE Website != null];
    }
    
    public static List<Account> ascAcct(){
        //List of Accounts with Accounts starting with z at the top and a at the bottom.
        return [SELECT Id, Name FROM Account ORDER BY Name DESC];
    }
    
    public static List<Account> relatedAcctCon(){
        //List of Accounts and their related Contacts.
        return [SELECT Id, Name, (SELECT Id, Name FROM Contacts) FROM Account];
    }
    
    public static List<Account> relatedEnergyConAccts(){
        //List of Accounts in the 'Energy' industry and their related Contacts
        return [SELECT Id, Name, Industry, (SELECT Id, Name FROM Contacts) FROM Account WHERE Industry = 'Energy'];
    }
    
    public static List<AggregateResult> countLeadSrc(){
        //List displaying the number of Leads with the same 'Lead Source'
        return [SELECT LeadSource, COUNT(Name) FROM Lead GROUP BY LeadSource];
    }
}