public class AccountListController {
    @AuraEnabled
    public static List<Account> getAccounts(){
        return [SELECT Id, Name, Industry, BillingCity, BillingState FROM Account];   
    }
    
}
