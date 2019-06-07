public class SOQLQueryExamples {
    //All Accounts that have the 520 area code.
    List<Account> accsWithAreaCode520 = [SELECT Name, Phone FROM Account WHERE Phone LIKE '520%'];
    //All Accounts with a website
    List<Account> accsWithWebsite = [SELECT Name, Website FROM Account WHERE Website LIKE '%'];
    //List of Accounts with Accounts starting with z at the top and a at the bottom.
    List<Account> accsFromZtoA = [SELECT Name FROM Account ORDER BY Name DESC];
    //List of Accounts and their related Contacts.
    List<Account> accsAndContacts = [SELECT Name, (SELECT Name FROM Contacts) FROM Account];
    //List of Accounts in the 'Energy' industry and their related Contacts
    List<Account> accsInEnergyAndContacts = [SELECT Name, Industry, (SELECT Name FROM Contacts) FROM Account WHERE Industry = 'Energy'];
    //List displaying the number of Leads with the same 'Lead Source'
    List<AggregateResult> leadsCountSameLeadSource = [SELECT LeadSource, COUNT(id) FROM Lead GROUP BY LeadSource];
}