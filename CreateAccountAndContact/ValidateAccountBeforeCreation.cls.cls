public class ValidateAccountBeforeCreation {

    public static void addAccount(List<Account> newAccounts) {
        
        Integer i = 0;
        String eachError = '';
        
        try {
            
            for (Account eachAccount: newAccounts) {
                
                if (!(newAccounts[i].BillingStreet == null || newAccounts[i].BillingStreet.isWhitespace()
                      || newAccounts[i].BillingCity ==  null || newAccounts[i].BillingCity.isWhitespace()
                      || newAccounts[i].BillingState == null || newAccounts[i].BillingState.isWhitespace()
                      || newAccounts[i].BillingCountry == null || newAccounts[i].BillingCountry.isWhitespace()
                      || newAccounts[i].ShippingStreet == null || newAccounts[i].ShippingStreet.isWhitespace()
                      || newAccounts[i].ShippingCity ==  null || newAccounts[i].ShippingCity.isWhitespace()
                      || newAccounts[i].ShippingState == null || newAccounts[i].ShippingState.isWhitespace()
                      || newAccounts[i].ShippingCountry == null || newAccounts[i].ShippingCountry.isWhitespace()
                      || newAccounts[i].Phone == null || newAccounts[i].Phone.isWhitespace())) {
                    
                    eachAccount.BillingStreet = String.escapeSingleQuotes(newAccounts[i].BillingStreet);
                    eachAccount.BillingCity = String.escapeSingleQuotes(newAccounts[i].BillingCity);
                    eachAccount.BillingState = String.escapeSingleQuotes(newAccounts[i].BillingState);
                    
                    if (newAccounts[i].BillingPostalCode == null) {
                         
                        eachAccount.BillingPostalCode = '(no data)';
                    } else {
                        
                       eachAccount.BillingPostalCode = String.escapeSingleQuotes(newAccounts[i].BillingPostalCode); 
                    }
                    
                    eachAccount.BillingCountry = String.escapeSingleQuotes(newAccounts[i].BillingCountry);
                    eachAccount.ShippingStreet = String.escapeSingleQuotes(newAccounts[i].ShippingStreet);
                    eachAccount.ShippingCity = String.escapeSingleQuotes(newAccounts[i].ShippingCity);
                    eachAccount.ShippingState = String.escapeSingleQuotes(newAccounts[i].ShippingState);
                    
                    if (newAccounts[i].ShippingPostalCode == null) {
                         
                        eachAccount.ShippingPostalCode = '(no data)';
                    } else {
                        
                       eachAccount.ShippingPostalCode = String.escapeSingleQuotes(newAccounts[i].ShippingPostalCode); 
                    }

                    eachAccount.ShippingCountry = String.escapeSingleQuotes(newAccounts[i].ShippingCountry);
                    eachAccount.Phone = String.escapeSingleQuotes(newAccounts[i].Phone);
                } else {
                    
                    eachError += 'Account failed to be saved for the following reason(s): ';
                    
                    if (newAccounts[i].BillingStreet == null || newAccounts[i].BillingStreet.isWhitespace()) {
                        
                        eachError += 'Provide a billing address. ';
                    }
                    
                    if (newAccounts[i].BillingCity == null || newAccounts[i].BillingCity.isWhitespace()) {
                        
                        eachError += 'Provide a billing city. ';
                    }
                    
                    if (newAccounts[i].BillingState == null || newAccounts[i].BillingState.isWhitespace()) {
                        
                        eachError += 'Provide a billing state. ';
                    }
                    
                    if (newAccounts[i].BillingCountry == null || newAccounts[i].BillingCountry.isWhitespace()) {
                        
                        eachError += 'Provide a billing country. ';
                    }
                    
                    if (newAccounts[i].ShippingStreet == null || newAccounts[i].ShippingStreet.isWhitespace()) {
                        
                        eachError += 'Provide a shipping address. ';
                    }
                    
                    if (newAccounts[i].ShippingCity == null || newAccounts[i].ShippingCity.isWhitespace()) {
                        
                        eachError += 'Provide a shipping city. ';
                    }
                    
                    if (newAccounts[i].ShippingState == null || newAccounts[i].ShippingState.isWhitespace()) {
                        
                        eachError += 'Provide a shipping state. ';
                    }
                    
                    if (newAccounts[i].ShippingCountry == null || newAccounts[i].ShippingCountry.isWhitespace()) {
                        
                        eachError += 'Provide a shipping country. ';
                    }
                    
                    if (newAccounts[i].Phone == null || newAccounts[i].Phone.isWhitespace()) {
                        
                        eachError += 'Provide a phone number. ';
                    }
                    
                    eachAccount.addError(eachError);
                }
            }
        } catch (DMLException e) {
            
            System.debug('Sorry, but your account was not added due to the following reasons: ' + e.getMessage());
        }
    }
}
