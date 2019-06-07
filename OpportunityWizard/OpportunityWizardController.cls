public class OpportunityWizardController {
	//Name,stage,closedate (fields to track)
	
	Opportunity opportunity;
    
    public Opportunity getOpportunity(){
        if(Opportunity == null){
            opportunity = new Opportunity();
        }
        return opportunity;
    }
    
	public PageReference page1(){
		return Page.CreatingOpportunitiesWizard;
	}
	
	public PageReference page2(){
		return Page.CreatingOpportunitiesWizard2;
	}	

	public PageReference page3(){
		return Page.CreatingOpportunitiesWizard3;
	}

	public PageReference finalPage(){
		return Page.CreatingOpportuntiesWizardFinal;
	}

    public PageReference Save(){
        insert opportunity;
        PageReference opptyPage = new ApexPages.StandardController(opportunity).view();
      	opptyPage.setRedirect(true);
        return opptyPage;
    }

}