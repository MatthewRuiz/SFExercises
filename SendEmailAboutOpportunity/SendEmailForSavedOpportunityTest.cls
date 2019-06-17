@isTest
public class SendEmailForSavedOpportunityTest {
    
    //See if expected revenue is less than or equal to $100,000.00.
    @isTest static void sendEmail() {
        
        String testMessage = '';
        String expectedOutput = '';
        List<Opportunity> eachOpportunity = new List<Opportunity>();
        
        try {
            
        	//Insert test record
        	Opportunity newOpportunity = new Opportunity(Name = 'Test oppportunity', CloseDate = Date.valueOf('2019-06-14'),
                                                         StageName = 'Prospecting', Amount = 100001);
        
        	insert newOpportunity;
            
			//Get the expected revenue
            Opportunity useOpportunity = [SELECT Name, CloseDate, StageName, Amount, ExpectedRevenue FROM Opportunity LIMIT 1];
            
            eachOpportunity.add(useOpportunity);
            
            //Generate email for sending
            SendEmailForSavedOpportunity.generateEmail(eachOpportunity);
            
            //If number of changed opportunities is at least 1, this means an email has been sent.
            if (SendEmailForSavedOpportunity.numberOfChangedOpportunities > 0) {
                
                testMessage = 'email sent';
            } else {
                
                testMessage = 'email not sent'; 
            }
        } catch (DMLException e) {
            
            testMessage = e.getMessage();
        }
        
        expectedOutput = 'email sent';
        
        System.assertEquals(expectedOutput, testMessage);
    }
    
    //See if expected revenue is less than or equal to $100,000.00.
    @isTest static void sendEmail2() {
        
        String testMessage = '';
        String expectedOutput = '';
        List<Opportunity> eachOpportunity = new List<Opportunity>();
        
        try {
            
        	//Insert test record
        	Opportunity newOpportunity = new Opportunity(Name = 'Test oppportunity', CloseDate = Date.valueOf('2019-06-14'),
                                                         StageName = 'Prospecting', Amount = 10000000);
        
        	insert newOpportunity;
            
			//Get the expected revenue
            Opportunity useOpportunity = [SELECT Name, CloseDate, StageName, Amount, ExpectedRevenue FROM Opportunity LIMIT 1];
            
            eachOpportunity.add(useOpportunity);

            //Generate email for sending
            SendEmailForSavedOpportunity.generateEmail(eachOpportunity);
            
            //If number of changed opportunities is at least 1, this means an email has been sent.            
            SendEmailForSavedOpportunity.generateEmail(eachOpportunity);
            
            if (SendEmailForSavedOpportunity.numberOfChangedOpportunities > 0) {
                
                testMessage = 'email sent';
            } else {
                
                testMessage = 'email not sent'; 
            }
        } catch (DMLException e) {
            
            testMessage = e.getMessage();
        }
        
        expectedOutput = 'email not sent';
        
        System.assertEquals(expectedOutput, testMessage);
    }
}
