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
        String scor;

        for (Account newObj : newList) {
            Integer num = Integer.valueOf(newObj.NumberOfEmployees);

            if (num >= 1000) {
                scor = 'Hot';
            } else if (num >= 100) {
                scor = 'Warm';
            } else {
                scor = 'Cold';
            }

            obj = new ObjectsForCopy__c(
                Name = newObj.Name + NAME_TEXT,
                CopyAccountId__c = newObj.Id,
                CopyAccountName__c = newObj.name,
                ScorintResults__c = scor
            );
        } 

        try {
            insert obj;
        } catch (Exception e) {
            System.debug('レコード作成エラー');
        }
    }
}