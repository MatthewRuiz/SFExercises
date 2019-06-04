@isTest
public class AccountTriggerTest {

    @isTest public static void checkRelatedContactCreatedSingle(){
        Account singleAcct = new Account(Name = 'Nike', ShippingPostalCode = '80634');
        
        insert singleAcct;
        
        Test.startTest();
        Account acct = [select ShippingStreet, ShippingCity, ShippingState, ShippingCountry, ShippingPostalCode,
                       (select MailingStreet, MailingCity, MailingState, MailingCountry, MailingPostalCode from Contacts) 
                        from Account 
                        where Id = :singleAcct.Id];
        System.assertEquals(1, acct.Contacts.size());
        System.assertEquals(acct.Contacts[0].MailingStreet, acct.ShippingStreet);
        System.assertEquals(acct.Contacts[0].MailingCity, acct.ShippingCity);
        System.assertEquals(acct.Contacts[0].MailingState, acct.ShippingState);
        System.assertEquals(acct.Contacts[0].MailingCountry, acct.ShippingCountry);
        System.assertEquals(acct.Contacts[0].MailingPostalCode, acct.ShippingPostalCode);
        Test.stopTest();
    }
    
    @isTest public static void checkRelatedContactCreatedBulk(){
        List<Account> bulkAccts = new List<Account>();
        Set<Id> acctIds = new Set<Id>();
        
        for (Integer i = 0; i < 50; i++){
            bulkAccts.add(new Account(Name = 'Test Account ' + i, ShippingPostalCode = '1000'+i));
        }
        
        insert bulkAccts;
        
        for (Account acct : bulkAccts){
            acctIds.add(acct.Id);
        }
        
        Test.startTest();
        for (Account acct : [select ShippingStreet, ShippingCity, ShippingState, ShippingCountry, ShippingPostalCode, 
                            (select MailingStreet, MailingCity, MailingState, MailingCountry, MailingPostalCode from Contacts)
                             from Account
                             where Id in :acctIds]){
            System.assertEquals(1, acct.Contacts.size());
            System.assertEquals(acct.Contacts[0].MailingStreet, acct.ShippingStreet);
        	System.assertEquals(acct.Contacts[0].MailingCity, acct.ShippingCity);
        	System.assertEquals(acct.Contacts[0].MailingState, acct.ShippingState);
        	System.assertEquals(acct.Contacts[0].MailingCountry, acct.ShippingCountry);
        	System.assertEquals(acct.Contacts[0].MailingPostalCode, acct.ShippingPostalCode);
        }
        
        Test.stopTest();
    }
}