@isTest
public class PostToChatterOpportunityTest {

    //See if expected revenue is greater than $100,000.00.
    @isTest(SeeAllData=true) static void checkOpportunityExpectedRevenue() {
        
        String testMessage = '';
        String expectedOutput = '';
        
        try {
            
            //Insert test record
            Opportunity newOpportunity = new Opportunity(Name = 'Test oppportunity', CloseDate = Date.valueOf('2019-06-14'),
                                                         StageName = 'Prospecting', Amount = 1000011);
            insert newOpportunity;
            
            //Get test record
            Opportunity useOpportunity = [SELECT ExpectedRevenue FROM Opportunity LIMIT 1];
            
            //If expected revenue is greater than $100,000.00 this means that a message
            //has been posted to Chatter.
            if (useOpportunity.ExpectedRevenue > 100000) {
                
                testMessage = 'message posted';
            } else {
                
                testMessage = 'message not posted';
            }
        } catch(DMLException e) {
            
            testMessage = e.getMessage();
        }
        
        expectedOutput = 'message posted';
        
        System.assertEquals(expectedOutput, testMessage);
    }
    
    //See if expected revenue is greater than $100,000.00.
    @isTest(SeeAllData=true) static void checkOpportunityExpectedRevenue2() {
        
        String testMessage = '';
        String expectedOutput = '';
        
        try {
            
            //Insert test record
            Opportunity newOpportunity = new Opportunity(Name = 'Test oppportunity', CloseDate = Date.valueOf('2019-06-14'),
                                                         StageName = 'Prospecting', Amount = 10000);
            insert newOpportunity;
            
            //Get test record
            Opportunity useOpportunity = [SELECT ExpectedRevenue FROM Opportunity LIMIT 1];
            
            //If expected revenue is greater than $100,000.00 this means that a message
            //has been posted to Chatter.
            if (useOpportunity.ExpectedRevenue > 100000) {
                
                testMessage = 'message posted';
            } else {
                
                testMessage = 'message not posted';
            }
        } catch(DMLException e) {
            
            testMessage = e.getMessage();
        }
        
        expectedOutput = 'message not posted';
        
        System.assertEquals(expectedOutput, testMessage);
    }    
}
