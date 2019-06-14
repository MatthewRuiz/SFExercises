public class PostToChatterOpportunity {

    public static void postOpportunityToChatter(List<Opportunity> useOpportunities) {
        
        //Create post for each opportunity, with an expected revenue over $100,000.00.
        for (Opportunity eachOpportunity: useOpportunities) {
            
            if (eachOpportunity.ExpectedRevenue > 100000) {
                
                ConnectApi.FeedElement feedElement = ConnectApi.ChatterFeeds.postFeedElement(
                    Network.getNetworkId(), eachOpportunity.Id, ConnectApi.FeedElementType.FeedItem,
                'You have an opportunity worth $' + eachOpportunity.ExpectedRevenue + '.');
            }
        }
    }
}
