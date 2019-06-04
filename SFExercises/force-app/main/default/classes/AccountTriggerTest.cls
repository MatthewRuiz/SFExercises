@isTest
public class AccountTriggerTest {
    @TestSetup
    static void makeData(){
        Account testAcc = new Account(Name='Test',
                                    ShippingStreet='123 Jones St.',
                                    ShippingCity='Jonesville',
                                    ShippingState='NY',
                                    ShippingPostalCode='98765',
                                    ShippingCountry='USA'
                                    );
        insert testAcc;
    }

    @IsTest
    static void testAccountTrigger(){       
        Test.startTest(); 
        Account resultAcc = [SELECT Id, Name,
                            (SELECT Id, MailingStreet, MailingCity, MailingState, MailingPostalCode, MailingCountry FROM Contacts) 
                            FROM Account WHERE Name='Test' LIMIT 1];
        for(Contact c : resultAcc.Contacts){
            System.assertEquals('123 Jones St.', c.MailingStreet);
            System.assertEquals('Jonesville', c.MailingCity);
            System.assertEquals('NY', c.MailingState);
            System.assertEquals('98765', c.MailingPostalCode);
            System.assertEquals('USA', c.MailingCountry);
        }
        Test.stopTest();     
    }
}
