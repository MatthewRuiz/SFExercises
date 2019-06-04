public with sharing class MattSOQLExercises {
    public static void accountsWith520AreaCode() {
        //So we need to first have a container that will house our accounts
        List<Account> accList = new List<Account>();
        //Query for the appropiate accounts
        accList = [SELECT Name, Phone, Id FROM Account WHERE Phone LIKE '%(520)%'];
        //Debug the list
        System.debug(accList);
    }
    
    public static void accountsWithWebsites() {
        List<Account> accList = new List<Account>();
        accList = [SELECT Name, Phone, Id FROM Account WHERE Website != null];
        System.debug(accList);
    }
    
    public static void accountsOrderedByZtoA () {
        List<Account> accList = new List<Account>();
        accList = [SELECT Name, Phone, Id FROM Account ORDER BY Name DESC];
        System.debug(accList);
    }
    
    public static void accsWithTheirRelatedContacts() {
        List<Account> accList = new List<Account>();
        accList = [SELECT Name, (SELECT Name FROM Contacts) FROM Account];
        System.debug(accList);
    }
    
    public static void energyAccsWithContacts() {
        List<Account> accList = new List<Account>();
        accList = [SELECT Name, (SELECT Name FROM Contacts) FROM Account WHERE Industry = 'Energy'];
        System.debug(accList);
    }
    
    public static void numOfLeadsWithSameSource() {
        //So here we need a list to display the number of leads with the same source.
        AggregateResult[] leadResults = [SELECT LeadSource, COUNT(Name) FROM Lead GROUP BY LeadSource];
        System.debug(leadResults);
    }
}