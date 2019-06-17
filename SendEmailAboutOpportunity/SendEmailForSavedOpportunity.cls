public class SendEmailForSavedOpportunity {

    //Global variables
    public static integer numberOfChangedOpportunities;
    public static string subject;
    public static String emailMessage;
    public static List<String> toAddresses;
    
   	ApexPages.StandardController ctrl;
    
    public SendEmailForSavedOpportunity(ApexPages.StandardController stdController) {
        
		this.ctrl = stdController;
    }
    
    //Set the recipient address.
    //Set the subject.
    //Compose the email body.
    public static void generateEmail(List<Opportunity> useOpportunities) {
        
        numberOfChangedOpportunities = 0;
        subject = '';
        emailMessage = '';
        
        //Get logged in user email
        toAddresses = new List<String>{UserInfo.getUserEmail()};
        
        //Set subject
        subject = 'Expected revenue at or below $100,000';
        

       	emailMessage += UserInfo.getFirstName() + ' ' + UserInfo.getLastName() + ', ' +
                'your expected revenue has fallen for the following opportunity/opportunities.\n\nHere are the details:\n\n';
        
        //For each opportunity that has an expected revenue of $100,000 or less, show details.
        for (Opportunity eachOpportunity: useOpportunities) {
            
            if (eachOpportunity.ExpectedRevenue <= 100000) {
                
                emailMessage += 'Opportunity name: ' + eachOpportunity.Name + '\n';
                emailMessage += 'Stage: ' + eachOpportunity.StageName + '\n';
                emailMessage += 'Expected revenue: $' + eachOpportunity.ExpectedRevenue + '\n\n';
                
                numberOfChangedOpportunities++;
            }
        }
        
        emailMessage += 'Do not reply to this message.';
    }
    
    public static void sendEmail() {
        
        try {

        	Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            
        	mail.setToAddresses(toAddresses);
        	mail.setSubject(subject);
        	mail.setPlainTextBody(emailMessage);
        
        	//There must be at least one changed opportunity, with an expected revenue of $100,000 or less.
        	//Otherwise, no email is sent.
        	if (numberOfChangedOpportunities >= 1) {
            
            	Messaging.sendEmail(new List<Messaging.SingleEmailMessage> {mail});
        	}
        } catch(Exception e) {
            
            System.debug('An unexpected error has occurred: ' + e.getMessage());
        }        
    }
}
