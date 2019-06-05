<aura:component implements="force:appHostable,flexipage:availableForAllPageTypes,flexipage:availableForRecordHome,force:hasRecordId,force:lightningQuickAction,force:hasSObjectName" access="global" >
    <aura:attribute name="recordId" type="String" />
    <aura:attribute name="fields" type="String[]" default="Name"/>
    
    
    <lightning:card title="Create Account" iconName="standard:Account">
        <lightning:recordForm
                              aura:id="recordViewForm" 
                              recordId="{!v.recordId}"
                              objectApiName="Account"                              
                              layoutType="Compact"
                              fields="{!v.fields}"
                              columns="3"
                              mode="edit">
            <lightning:messages />            
        </lightning:recordForm>
    </lightning:card>
</aura:component>