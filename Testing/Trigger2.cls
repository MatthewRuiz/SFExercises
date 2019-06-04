trigger ContactInsert on Account (after insert) {
    
    if (Trigger.isInsert){
        List<Contact> con= new List<Contact>();
        for(Account acc: Trigger.new){
            Contact c= new Contact(LastName = acc.name,
                                   AccountId= acc.id,
                                   mailingstreet= acc.billingstreet,
                                   mailingcity= acc.billingcity);
            
            con.add(c);
                                   
}
        insert con;
        
        
        
    }

}