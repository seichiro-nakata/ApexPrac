public with sharing class Q19Controller {
    public static Boolean hasExecuting = false;
    private Boolean isExecuting = false;
    private Integer batchSize = 0;
    private Integer canExecuteRowLimit = Limits.getLimitQueryRows() - Limits.getQueryRows();

    public Q19Controller(Boolean isExecuting, Integer batchSize) {
        this.isExecuting = isExecuting;
        this.batchSize = batchSize;
    }

    public void accountDelete(List<Account> accList) {
        ObjectsForCopy__c obj;
        Id getAccountId;

        for (Account newObj : accList) {
            getAccountId = newObj.Id;
        }

        obj = [SELECT Id, Name FROM ObjectsForCopy__c WHERE CopyAccountId__c = :getAccountId];

        try {
            delete obj;
        } catch (Exception e) {
            System.debug('レコード作成エラー');
        }
    }
}