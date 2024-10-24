public with sharing class AccountOpportunityController {
    @AuraEnabled(cacheable=true)
    public static List<Opportunity>  getAccounts(String accountId) {
        // Fetch data 
        List<Opportunity> opportunities = [
            SELECT Id, Name, StageName, Amount, CloseDate, 
                    (SELECT Id, Name, Status, TotalPrice, 
                            (SELECT Id,Description,QuoteId,TotalPrice,Subtotal
                            FROM QuoteLineItems) 
                    FROM Quotes) 
            FROM Opportunity 
            WHERE  IsClosed = FALSE
        ];
        return opportunities;
    }
}