trigger postToChatter on Opportunity (after insert) {
list<feedItem>posts = new list <feedItem>();
    for(opportunity o : trigger.new){
     
        if(o.expectedrevenue > 100000){
        feedItem post = new feedItem(
           ParentId = o.Id,
           Body = 'write anything');
        posts.add(post);    
        }   
    }
   insert posts; 
}