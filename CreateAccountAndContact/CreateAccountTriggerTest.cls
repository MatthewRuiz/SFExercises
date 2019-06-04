@isTest
public class CreateAccountTriggerTest {

    //Positive test
    @isTest static void insertAccountAndContact() {
        
        String testMessage = '';
        
        try {
            
            Account newAccount = new Account(Name = 'Test name', BillingStreet = 'Test street',
                                            BillingCity = 'Test city', BillingState = 'Test state',
                                            BillingPostalCode = null, BillingCountry = 'Test country',
                                            ShippingStreet = 'Test street', ShippingCity = 'Test city',
                                            ShippingState = 'Test state', ShippingPostalCode = null,
                                            ShippingCountry = 'Test country', Phone = '1234567890');
            
            insert newAccount;
            
            testMessage = 'record inserted';
        } catch (DMLException e) {
            
            testMessage = e.getMessage();
        }
        
        System.assertEquals('record inserted', testMessage);
    }
    
    //Negative test
    @isTest static void insertAccountAndContact2() {
        
        String testMessage = '';
        String expectedResult = '';
        
        try {
            
            Account newAccount = new Account(Name = ' ', BillingStreet = ' ',
                                            BillingCity = ' ', BillingState = ' ',
                                            BillingPostalCode = null, BillingCountry = ' ',
                                            ShippingStreet = ' ', ShippingCity = ' ',
                                            ShippingState = ' ', ShippingPostalCode = null,
                                            ShippingCountry = ' ', Phone = ' ');
            
            insert newAccount;
            
            testMessage = 'record inserted';
        } catch (DMLException e) {
            
            testMessage = e.getMessage();
        }
        
		expectedResult = 'Insert failed. First exception on row 0; first error: FIELD_CUSTOM_VALIDATION_EXCEPTION, ';
        expectedResult += 'Account failed to be saved for the following reason(s): Provide a billing address. ';
        expectedResult += 'Provide a billing city. Provide a billing state. Provide a billing country. ';
        expectedResult += 'Provide a shipping address. Provide a shipping city. Provide a shipping state. ';
        expectedResult += 'Provide a shipping country. Provide a phone number. : []';
        
        System.assertEquals(expectedResult, testMessage);
    }   
}
