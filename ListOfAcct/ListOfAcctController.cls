public class ListOfAcctController {

    @AuraEnabled
    public static List<Account> getAccts(){
        if(!Schema.SObjectType.Account.isAccessible()){
            throw new AuraHandledException('You Do Not Have Object Level Access');
        }
        String[] acctFields = new String[]{'Id','Name'};
            Map<String, Schema.SObjectField> acctMap = Schema.SObjectType.Account.fields.getMap();
        for(String field : acctFields){
            if(!acctMap.get(field).getDescribe().isAccessible()){
                return new List<Account>();
            }
        }
        return [SELECT Id, Name FROM Account];
    }
}