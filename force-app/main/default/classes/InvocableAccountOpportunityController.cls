public with sharing class InvocableAccountOpportunityController {
    @InvocableMethod(label='Get Account Opportunities' description='Fetches open opportunities related to an account')
    public static List<Opportunity> getAccountOpportunity(List<String> accountIds) {
        // Fetch data based on the provided Account IDs
        List<Opportunity> opportunities = [
            SELECT Id, Name, StageName, Amount, CloseDate, 
                    (SELECT Id, Name, Status, TotalPrice, 
                            (SELECT Id, Description, Quantity, Subtotal, Product2.Name
                             FROM QuoteLineItems) 
                    FROM Quotes) 
            FROM Opportunity 
            WHERE IsClosed = FALSE 
            AND AccountId IN :accountIds
        ];
        return opportunities;
    }
}