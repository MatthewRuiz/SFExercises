public class newMethod1 {
    /*
    public static List<Account> methodNumSix() {
        List<Account> accountList = new List<Account>();
        for(account a:[SELECT id, Name, NumberOfEmployees, Size__c FROM Account]) {
            if (a.NumberOfEmployees < 1000 && a.NumberOfEmployees > 1){
                a.Size__c = 'Small';
                //updateAccounts.add(a);
            } else if(a.NumberOfEmployees > 1000 && a.NumberOfEmployees <= 10000 ) {
                a.Size__c = 'Medium';
		//updateAccounts.add(a);
            } else if(a.NumberOfEmployees > 10000) {
                a.Size__c = 'Large'
		//updateAccounts.add(a);
            }
        }
        
        
        return accountList;
    }
*/
}

//use upsert to update the database
//Yay