@isTest
public class AccountTriggerTest {

    @isTest public static void addReldCtctTest(){
        Account singleAcct = new Account(Name = 'Nike');
        List<Account> bulkAccts = new List<Account>();
        Set<Id> acctIds = new Set<Id>();
        
        for (Integer i = 0; i < 50; i++){
            bulkAccts.add(new Account(Name = 'Test Account ' + i));
        }
        
        insert singleAcct;
        insert bulkAccts;
        
        for (Account acct : bulkAccts){
            acctIds.add(acct.Id);
        }
        
        Test.startTest();
        System.assertEquals(1, [select Id from Contact where AccountId = :singleAcct.Id].size());
        System.assertEquals(50, [select Id from Contact where AccountId in :acctIds].size());
        Test.stopTest();
    }
}