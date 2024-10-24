public with sharing class AccountOpportunityController {

    @AuraEnabled(cacheable=true)
    public static List<Opportunity> getAccountOpportunity(List<String> accountIds) {
        // Fetch data based on the provided Account IDs
        List<Opportunity> opportunities = InvocableAccountOpportunityController.getAccountOpportunity(accountIds);
        return opportunities;
    }
}