public with sharing class Q18Controller {
    public static Boolean hasExecuting = false;
    private Boolean isExecuting = false;
    private Integer batchSize = 0;
    private Integer canExecuteRowLimit = Limits.getLimitQueryRows() - Limits.getQueryRows();

    private static final String NAME_TEXT = '_スコアリング';

    public Q18Controller(Boolean isExecuting, Integer batchSize) {
        this.isExecuting = isExecuting;
        this.batchSize = batchSize;
    }

    public void AccountScoring(List<Account> newList) {
        ObjectsForCopy__c obj;

        for (Account newObj : newList) {
            Integer scor = calculateScoring(newObj.NumberOfEmployees, newObj.Rating);
            String result = calculateResult(scor);

            obj = new ObjectsForCopy__c(
                Name = newObj.Name + NAME_TEXT,
                CopyAccountId__c = newObj.Id,
                CopyAccountName__c = newObj.name,
                scoringResultText__c = result,
                scoringResult__c = scor
            );
        } 

        try {
            insert obj;
        } catch (Exception e) {
            System.debug('レコード作成エラー');
        }
    }

     // 従業員数と評価からスコアリングを計算
     private static Integer calculateScoring(Integer numberOfEmployees, String rating) {
        Integer scor = 0;

        // 従業員スコアリング
        if (numberOfEmployees >= 1000) {
            scor += 3;
        } else if (numberOfEmployees >= 100) {
            scor += 2;
        } else {
            scor += 1;
        }

        // 評価スコアリング
        switch on rating {
            when 'Hot' {
                scor += 3;
            } when 'Warm' {
                scor += 2;
            } when else {
                scor += 1;
            }
        }
        return scor;
    }

    // スコアリングから結果を計算
    private static String calculateResult(Integer scoring) {
        if (scoring >= 5) {
            return 'Hot';
        } else if (scoring >= 3) {
            return 'Warm';
        } else {
            return 'Cold';
        }
    }
}


// public with sharing class Q18Controller {
//     public static Boolean hasExecuting = false;
//     private Boolean isExecuting = false;
//     private Integer batchSize = 0;
//     private Integer canExecuteRowLimit = Limits.getLimitQueryRows() - Limits.getQueryRows();

//     private static final String NAME_TEXT = '_スコアリング';

//     public Q18Controller(Boolean isExecuting, Integer batchSize) {
//         this.isExecuting = isExecuting;
//         this.batchSize = batchSize;
//     }

//     public void AccountScoring(List<Account> newList) {
//         ObjectsForCopy__c obj;
//         String scor;

//         for (Account newObj : newList) {
//             Integer num = Integer.valueOf(newObj.NumberOfEmployees);

//             if (num >= 1000) {
//                 scor = 'Hot';
//             } else if (num >= 100) {
//                 scor = 'Warm';
//             } else {
//                 scor = 'Cold';
//             }

//             obj = new ObjectsForCopy__c(
//                 Name = newObj.Name + NAME_TEXT,
//                 CopyAccountId__c = newObj.Id,
//                 CopyAccountName__c = newObj.name,
//                 ScorintResults__c = scor
//             );
//         } 

//         try {
//             insert obj;
//         } catch (Exception e) {
//             System.debug('レコード作成エラー');
//         }
//     }
// }