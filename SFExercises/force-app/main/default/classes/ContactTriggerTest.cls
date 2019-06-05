@isTest
public class ContactTriggerTest {
    @TestSetup
    static void makeData(){
        List<Contact> conList = new List<Contact>();
        //negative case 1: Different Name, Same Birthdate - 50 Results
        for (Integer i = 0; i < 50; i++) {
            conList.add(new Contact(LastName='Test',FirstName='John '+i,Birthdate=Date.today()));
        }
        //negative case 2: Same Name, Different Birthdate - 50 Results
        for (Integer i = 0; i < 50; i++) {
            conList.add(new Contact(LastName='Test',FirstName='Harry',Birthdate=Date.newInstance(1975,9,30).addDays(i)));
        }
        //negative case 3: Different Name, Different Birthdate - 50 Results
        for (Integer i = 0; i < 50; i++) {
            conList.add(new Contact(LastName='Test',FirstName='David-'+i,Birthdate=Date.newInstance(1944,6,6).addDays(i)));
        }
        //positive case: Same Name, Same Birthdate - 0 Results
        for (Integer i = 0; i < 50; i++) {
            conList.add(new Contact(LastName='Test',FirstName='Matt',Birthdate=Date.newInstance(1992,3,25)));
        }
        Database.insert(conList, false);
    }

    @IsTest
    static void testContactTrigger(){  
        Test.startTest();

        List<Contact> testDataQuery = [SELECT Id, LastName, FirstName, Birthdate FROM Contact WHERE LastName='Test'];
        System.assertEquals(50, [SELECT COUNT() FROM Contact WHERE Id IN :testDataQuery AND FirstName LIKE 'John%'],'NEGATIVE CASE - Different Name, Same Birthdate');
        System.assertEquals(50, [SELECT COUNT() FROM Contact WHERE Id IN :testDataQuery AND FirstName='Harry'],'NEGATIVE CASE - Same Name, Different Birthdate');
        System.assertEquals(50, [SELECT COUNT() FROM Contact WHERE Id IN :testDataQuery AND FirstName LIKE 'David-%'],'NEGATIVE CASE - Different Name, Different Birthdate');
        System.assertEquals(0, [SELECT COUNT() FROM Contact WHERE Id IN :testDataQuery AND FirstName='Matt'],'POSITIVE CASE - Same Name, Same Birthdate');

        Test.stopTest();
    }
}