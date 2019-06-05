trigger accountCon on Account (after insert) {
list<contact> newContact = new list<contact>();
    for(account a : trigger.new){	
        
       contact x = new contact(
       lastname = 'Idk',
        accountId = a.id  
       );	      
    newContact.add(x);
    }    
    insert newContact; 
    
}