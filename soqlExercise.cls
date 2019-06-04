public class soqlExercise {

    //all accounts that have same area code
   
    public static list<account> areaCode(){
    
        list<account> a = [select name, Billingpostalcode from account where Billingpostalcode = '21239'];
       
        system.debug(a.size() + ' account(s) returned.');
       return a;
    }

 // all accounts with a website   
    public static list<account> withaWebsite(){
        list<account> b = [select name from account where website != null];
    system.debug('Accounts with website'+ b );
        return b;
    }
 //list of accounts in descending order
  public static list<account> accountDesc(){
        list<account> c = [select name from account order by name desc];
    system.debug('Accounts in descending order'+ c );
        return c;
    }

    
     public static list<account> accountInEnergyIndustryAndContact(){
        list<account> d = [SELECT Name, 
                           (SELECT Name FROM Contacts) 
                           FROM Account WHERE industry = 'energy'];
    system.debug('Accounts and their contact'+ d );
        return d;
    }
   
    //list displaying the number of leads of leads with the
    //same lead source
    public static void leadCountWithSameLeadsource(){
        list<aggregateresult> e = [SELECT LeadSource, COUNT(Name)
							FROM Lead
							GROUP BY LeadSource];
    system.debug('list of leads with same lead source'+ e );
      
    } 
    
}