@isTest
public class SOQLQueriesTesting {
    
    @testSetup
    public static void instantiate() {
        //Creates a few test records
        
        List<Account> addAccounts = new List<Account>();
        List<Lead> addLeads = new List<Lead>();
        List<Contact> addContacts = new List<Contact>();
        
        for (Integer count = 0; count < 10; count++) {
            Account a = new Account();
            
            a.Name = 'Account' + count;
            
            if(math.mod(count, 2) == 0) {
                a.Phone = '(520)666-8976';
            }
            else {
                a.Phone = '(540)699-9999';
            }
            
            addAccounts.add(a);
            
        }
        
        //Insert the accounts first
        insert addAccounts;
        insert addLeads;
        
        //Then create and insert the contacts
        
        List <Account> accountIds = [SELECT Id FROM Account];
        
        for (Integer x = 0; x < 4; x++) {
            Contact c = new Contact();
            c.LastName = 'Contact' + x;
            
            //if x divides evenly - there is no remainder
            if(math.mod(x, 2) == 0) {
                c.AccountId = accountIds[0].Id;
            }
            //Otherwise
            else {
                c.AccountId =  accountIds[2].Id;
            }
            
            addContacts.add(c);
        }
        
        insert addContacts;
        System.debug('Contacts: ' + addContacts);
    }
    
    @isTest
    public static void testFor520AreaCode() {
        test.startTest();
        
        //test the accountsWith520AreaCode() method
        //Expected count = 5
        //NOTE: test setup adds 5 records with phone area codes starting with 520
        
        List<Account> Query = SOQLQueries.accountsWith520AreaCode();
        System.assertEquals(5, Query.size());
        
        //Test Postive Single
        //Insert a record that would be grabbed by the query
        Account a = new Account();
        a.Name = 'newAccountWith';
        a.Phone = '(520)893-2342';
        insert a;
        
        Query = SOQLQueries.accountsWith520AreaCode();
        System.assertEquals(6, Query.size());
        
        
        //Test Negative Single
        //Insert a record that would not be grabbed by the query        
        a = new Account();
        a.Name = 'newAccountWithout';
        a.Phone = '(542)394-2334';
        insert a;
        
        Query = SOQLQueries.accountsWith520AreaCode();
        System.assertEquals(6, Query.size());
        
        //Test Positive Bulk
        //Insert multiple records (in this case 3) that would be grabbed
        
        List<Account> aList = new List<Account>();
        for (Integer count = 0; count <3; count++) {
            a = new Account();
            a.Name = 'newAccountWith' + count;
            a.Phone = '(520)444-4444';
            aList.add(a);
        }
        
        insert aList;
        Query = SOQLQueries.accountsWith520AreaCode();
        System.assertEquals(9, Query.size());
        
        //Test Negative Bulk
        //Insert multiple records (ITC: 3) that would not be grabbed
        
        aList = new List<Account>();
        for (Integer count = 0; count <3; count++) {
            a = new Account();
            a.Name = 'newAccountWithout' + count;
            a.Phone = '(534)444-4444';
            aList.add(a);
        }
        
        insert aList;
        Query = SOQLQueries.accountsWith520AreaCode();
        System.assertEquals(9, Query.size());
        
        test.stopTest();
    }
    
    @isTest
    public static void testForWebsites() {
        test.startTest();
        //test the accountsWithWebsites() method
        //Expect count = 0;
        
        List<Account> Query = SOQLQueries.accountsWithWebsite();
        System.assertEquals(0, Query.size());
        
        //Test Postive Single
        //Insert a record that would be caught by the query
        Account a = new Account();
        a.Name = 'accountWith';
        a.Website = 'account.com';
        insert a;
        
        Query = SOQLQueries.accountsWithWebsite();
        System.assertEquals(1, Query.size());
        
        //Test Negative Single
        //Insert a record that would not be caught by the query
        
        a = new Account();
        a.Name = 'accountWithout';
        insert a;
        
        Query = SOQLQueries.accountsWithWebsite();
        System.assertEquals(1, Query.size());
        
        //Test Positive Bulk
        //Insert multiple (ITC: 3) records that would be caught by the query
        
        List<Account> aList = new List<Account>();
        for(Integer count = 0; count <3; count++) {
            a = new Account();
            a.Name = 'accountWith' +count;
            a.Website = 'account' + count +'.com';
            aList.add(a);
        }
        
        insert aList;
        
        Query = SOQLQueries.accountsWithWebsite();
        System.assertEquals(4, Query.size());
        
        //Test Negative Bulk
        //Insert multiple (ITC: 3) records that would not be caught by the query
        
        aList = new List<Account>();
        for(Integer count = 0; count <3; count++) {
            a = new Account();
            a.Name = 'accountWithout' +count;
            aList.add(a);
        }
        
        insert aList;
        
        Query = SOQLQueries.accountsWithWebsite();
        System.assertEquals(4, Query.size());
        
        test.stopTest();
    }
    
    @isTest
    public static void testForAccountNamesByDescOrder() {
        
        test.startTest();
        //test the accountsWithAccountsDescending() method
        
        //are we grabbing all the account records made through setup?
        //Not partically a required test but just a check really
        List<Account> Query = SOQLQueries.accountsWithAccountsDescending();
        System.assertEquals(10, Query.Size());
        
        //Check to see if everything is being returned in order
        //It's in descending so it starts at Account9 and goes down to Account0
        for (Integer count = Query.Size()-1; Count >= 0; Count --) {
            //check to see if the result at position = count does not equal the expected account name from the test setup
            if(Query[count].Name == ('Account'+count)) {
                System.assert(false);
            }
            System.assert(true);
        }
        
        //Test Positive Single
        //Insert a record and recheck order
        
        //Add a record with account name = 'Account10'
        //Since it is being ordered by accounts desc, this will be on top
        
        Account a = new Account();
        a.Name = 'Account10';
        insert a;
        
        
        //Checking - are we grabbing all the account records?
        Query = SOQLQueries.accountsWithAccountsDescending();
        System.assertEquals(11, Query.Size());
        
        for (Integer count = Query.Size()-1; Count >= 0; Count --) {
            //if the result at position = count does not equal the expected account name, fail the test
            if(Query[count].Name == ('Account'+count)) {
                System.assert(false);
            }
            System.assert(true);
        }
        
        
        //Test Positive Bulk
        //Insert multiple records and recheck order
        
        //Add records 'Account11' to 'Account15'
        
        List<Account> aList = new List<Account>();
        
        for(Integer count = 11; count <= 15; count ++) {
            a = new Account();
            a.Name = 'Account' + count;
            aList.add(a);
        }
        
        insert aList;
        
        //Checking - are we grabbing all the account records?
        Query = SOQLQueries.accountsWithAccountsDescending();
        System.assertEquals(16, Query.Size());
        
        for (Integer count = Query.Size()-1; Count >= 0; Count --) {
            //if the result at position = count does not equal the expected account name, fail the test
            if(Query[count].Name == ('Account'+count)) {
                System.assert(false);
            }
            System.assert(true);
        }
        
        test.stopTest();
    }
    
    @isTest
    public static void testForAccountsInEnergyIndustryAndRelatedContacts() {
        //test the accountsInEnergyIndustryAndRelatedContacts() method
        
        test.startTest();
        
        List<Account> Query = SOQLQueries.accountsInEnergyIndustryAndRelatedContacts();
        System.assertEquals(0, Query.size());
        
        //Test Negative Single - Add a record with a related contact that won't be grabbed
        Account a = new Account();
        Contact c = new Contact();
        
        a.Name = 'accountWithout';
        insert a;
        
        c.LastName = 'contactWithout';
        c.AccountId = Id.valueOf([SELECT Id FROM Account WHERE name = 'accountWithout'][0].Id);
        insert c;
        
        Query = SOQLQueries.accountsInEnergyIndustryAndRelatedContacts();
        System.assertEquals(0, Query.size());
        
        //Test Negative Bulk - Add records that won't be grabbed
        
        List<Account> aList = new List<Account>();
        List<Contact> cList = new List<Contact>();
        
        for(Integer count = 0; count <3; count++) {
            a = new Account();            
            a.Name = 'accountWithout' + count;
            aList.add(a);
        }
        
        insert aList;
        
        Set<String> checkList = new Set<String>();
        for(Account x: aList) {
            checkList.add(x.Name);
        }
        aList = [SELECT Id FROM Account WHERE Name =:checkList];
        
        for(Integer count = 0; count < aList.size(); count++) {
            c = new Contact();
            c.LastName = 'ContactWithout'+count;
            c.AccountId = Id.valueOf(aList[count].Id);
            cList.add(c);
        }
        
        insert cList;
        
        System.debug('cList: '+cList);
        
        Query = SOQLQueries.accountsInEnergyIndustryAndRelatedContacts();
        System.assertEquals(0, Query.size());
        
        
        //Test Postive Single - Add a record that would be grabbed
        
        a = new Account();
        c = new Contact();
        
        a.Name = 'accountWith';
        a.Industry = 'Energy';
        insert a;
        
        c.LastName = 'contactWith';
        c.AccountId = Id.valueOf([SELECT Id FROM Account WHERE name = 'accountWith'][0].Id);
        insert c;
        
        Query = SOQLQueries.accountsInEnergyIndustryAndRelatedContacts();
        System.assertEquals(1, Query.size());		        
        
        //Test Postive Bulk - Add records that would be grabbed
        
        aList = new List<Account>();
        cList = new List<Contact>();
        
        for(Integer count = 0; count <3; count++) {
            a = new Account();            
            a.Name = 'accountWith' + count;
            a.Industry = 'Energy';
            aList.add(a);
        }
        
        insert aList;
        
        checkList = new Set<String>();
        for(Account x: aList) {
            checkList.add(x.Name);
        }
        aList = [SELECT Id FROM Account WHERE Name =:checkList];
        
        for(Integer count = 0; count < aList.size(); count++) {
            c = new Contact();
            c.LastName = 'ContactWith'+count;
            c.AccountId = Id.valueOf(aList[count].Id);
            cList.add(c);
        }
        
        insert cList;
        
        System.debug('cList: '+cList);
        
        Query = SOQLQueries.accountsInEnergyIndustryAndRelatedContacts();
        System.assertEquals(4, Query.size());
        
        test.stopTest();
    }
    
    @isTest
    public static void testForNumberOfLeadsByLeadSource() {
        
        test.startTest();
        //test the numberOfLeadsWithSameLeadSource()
        
        //Test Negative Single - Insert a Record with no lead source
        //NOTE: To create a lead, LastName and company are required fields.
        
        Lead l = new Lead();
        l.LastName = 'leadWithout';
        l.Company = 'companyWithout';
        
        insert l;
        
        List<AggregateResult> Query = SOQLQueries.numberOfLeadsWithSameLeadSource();
        System.assertEquals(1, Query[0].get('expr0'));
        
        //Test Negative Bulk
        
        List<Lead> lList = new List<lead>();
        
        for(Integer Count = 0; Count < 3; Count++) {
            l = new Lead();
            l.LastName = 'leadWithout'+count;
            l.Company = 'companyWithout'+count;
            lList.add(l);
        }
        
        insert lList;        
        Query = SOQLQueries.numberOfLeadsWithSameLeadSource();
        
        System.assertEquals(4, Query[0].get('expr0'));
        
        
        //Test Postive Single
        
        l = new Lead();
        l.LastName = 'leadWith';
        l.Company = 'CompanyWith';
        l.LeadSource = 'Web';
        
        insert l;
        
        Query = SOQLQueries.numberOfLeadsWithSameLeadSource();
        
        System.assertEquals(4, Query[0].get('expr0'));
        System.assertEquals(1, Query[1].get('expr0'));
        
        //Test Postive Bulk
        
        lList = new List<lead>();
        
        for(Integer Count = 0; Count < 3; Count++) {
            l = new Lead();
            l.LastName = 'leadWith'+count;
            l.Company = 'companyWith'+count;
            l.LeadSource = 'Web';
            lList.add(l);
        }
        
        insert lList;
        
        Query = SOQLQueries.numberOfLeadsWithSameLeadSource();
        System.assertEquals(4, Query[0].get('expr0'));
        System.assertEquals(4, Query[1].get('expr0'));
        
        test.stopTest();
    }
}