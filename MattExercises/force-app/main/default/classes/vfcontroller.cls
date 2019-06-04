public class vfcontroller {
    public string inputforpageuno{get; set;}
    
    public pageReference newPR(){
        pageReference meh = page.pagedos;
        meh.setRedirect(true);
        return meh;
    }
}