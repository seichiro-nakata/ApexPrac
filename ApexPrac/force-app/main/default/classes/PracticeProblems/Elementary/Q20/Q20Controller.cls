public with sharing class Q20Controller {
    public static Boolean hasExecuting = false;
    private Boolean isExecuting = false;
    private Integer batchSize = 0;
    private Integer canExecuteRowLimit = Limits.getLimitQueryRows() - Limits.getQueryRows();

    public Q20Controller(Boolean isExecuting, Integer batchSize) {
        this.isExecuting = isExecuting;
        this.batchSize = batchSize;
    }

    public void accountUndelete(List<Account> accList) {
        ObjectsForCopy__c obj;
        Id getAccountId;

        for (Account newObj : accList) {
            getAccountId = newObj.Id;
        }

        obj = [SELECT Id, Name FROM ObjectsForCopy__c WHERE CopyAccountId__c = :getAccountId  ALL ROWS];

        try {
            undelete obj;
        } catch (Exception e) {
            System.debug('レコード作成エラー');
        }
    }
}