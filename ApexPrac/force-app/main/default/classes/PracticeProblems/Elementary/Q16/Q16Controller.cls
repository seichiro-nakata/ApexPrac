public with sharing class Q16Controller {
    public static Boolean hasExecuting = false;
    private Boolean isExecuting = false;
    private Integer batchSize = 0;
    private Integer canExecuteRowsLimit = Limits.getLimitQueryRows() - Limits.getQueryRows();

    public Q16Controller(Boolean isExecuting, Integer batchSize) {
        this.isExecuting = isExecuting;
        this.batchSize = batchSize;
    }

    public void AccountCopy(List<Account> newList) {
        ObjectsForCopy__c obj;

        for (Account newObj : newList) {
            obj = new ObjectsForCopy__c (
                Name = newObj.name + '_copy',
                CopyAccountId__c = newObj.Id,
                CopyAccountName__c = newObj.Name
            );
        }

        try {
            insert obj;
        } catch (Exception e) {
            System.debug('レコード作成エラー');
        }
    }
}