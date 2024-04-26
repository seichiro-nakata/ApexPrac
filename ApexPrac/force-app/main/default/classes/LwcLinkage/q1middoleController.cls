public with sharing class q1middoleController {

    @AuraEnabled
    public static void createContact(String accountName, String lastName, String firstName, String email){      
        Account searchAccount;

        // 取引先を検索
        try {
            searchAccount = [SELECT Id, Name FROM Account WHERE Name = :accountName LIMIT 1];
        } catch (QueryException e) {
            searchAccount = new Account(Name = accountName); // 取引先が見つからない場合に新規作成
            insert searchAccount; // 新しい取引先を保存
        }
        
        try {
            Contact insertContact = new Contact(
                LastName = lastName,
                FirstName = firstName,
                Email = email,
                AccountId = searchAccount.Id // 新規または既存の取引先に関連付け
            );

            insert insertContact; // 取引先責任者を保存
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}


// private Account searchAccount(String Name) {
    //     Account searchAccount = new Account();

    //     try {
    //         searchAccount = [SELECT Id, Name FROM Account WHERE Name = :Name LIMIT 1];
    //     } catch (QueryException e) {
    //         searchAccount = new Account();
    //     }

    //     return searchAccount;
    // }