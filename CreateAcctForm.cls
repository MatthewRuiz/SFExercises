<aura:component implements="force:appHostable,flexipage:availableForAllPageTypes,flexipage:availableForRecordHome,force:hasRecordId,force:lightningQuickAction,force:hasSObjectName" access="global" >
    <aura:attribute name="fields" type="String[]" default="['Name', 'ShippingAddress']"/>
    
    
    <lightning:card title="Create Account" iconName="standard:account">
        <lightning:recordForm
                              objectApiName="Account"
                              fields="{!v.fields}"                              
                              columns="2"
                              mode="edit">
            <lightning:messages />            
        </lightning:recordForm>
    </lightning:card>
</aura:component>