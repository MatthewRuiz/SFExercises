@isTest
public class testNewTaskTrigger {
    @isTest static void testMeth (){
    //3 ways to create test data, test factory, start and stop test, and static resources
    Account acc = new Account (Name = 'testAccount', BillingState = 'HI');
    test.startTest();
        database.SaveResult result = database.insert(acc);
    test.stopTest();  
        System.assert(result.isSuccess(), 'Never asserted data');
        Account bug = [SELECT Id, BillingState FROM Account WHERE Id = :result.getId()];
        Task noodle = [SELECT WhatId FROM Task WHERE whatId = :bug.Id];
        System.assertEquals('HI', bug.BillingState);
        System.assert(acc.Id == bug.Id);
        System.assert(noodle != NULL);
        
    }
}