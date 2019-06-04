public with sharing class inputTestPageController {
    @AuraEnabled
    public static Workout__c getWorkout() {
        return [SELECT Id, Name FROM Workout__c];
    }
    @AuraEnabled
    public static Body_Area__c getBodyArea() {
        return [SELECT Id, Name FROM Body_Area__c];
    }
}