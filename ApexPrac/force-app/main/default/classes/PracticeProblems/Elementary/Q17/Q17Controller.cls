public with sharing class Q17Controller {
    public static Boolean hasExecuting = false;
    private Boolean isExecuting = false;
    private Integer batchSize = 0;
    private Integer canExecuteRowsLimit = Limits.getLimitQueryRows() - Limits.getQueryRows();

    private static final String RELATION_STRING = '_更新済';

    public Q17Controller(Boolean isExecuting, Integer batchSize) {
        this.isExecuting = isExecuting;
        this.batchSize = batchSize;
    }

    public void AccountUpdateCopy(List<Account> newList) {
        ObjectsForCopy__c selectObj;
        ObjectsForCopy__c updateObj;

        for (Account newObj : newList) {
            selectObj = [SELECT Id, Name FROM ObjectsForCopy__c WHERE CopyAccountId__c = :newObj.Id];
            
            if (selectObj != null) {
                String strName = String.valueOf(selectObj.Name);

                if (strName.right(4).equals(RELATION_STRING)) {
                    updateObj = new ObjectsForCopy__c (
                        Name                = newObj.Name + RELATION_STRING + '2',
                        CopyAccountId__c    = newObj.Id,
                        CopyAccountName__c  = newObj.Name,
                        Id                  = selectObj.Id
                    );
                } else if (strName.right(5).left(4).equals(RELATION_STRING)) {
                    Integer countNum = Integer.valueOf(strName.right(1));
                    countNum += 1;
                    
                    updateObj = new ObjectsForCopy__c (
                        Name                = newObj.Name + RELATION_STRING + String.valueOf(countNum),
                        CopyAccountId__c    = newObj.Id,
                        CopyAccountName__c  = newObj.Name,
                        Id                  = selectObj.Id
                    );
                } else {
                    updateObj = new ObjectsForCopy__c (
                        Name                = newObj.Name + RELATION_STRING,
                        CopyAccountId__c    = newObj.Id,
                        CopyAccountName__c  = newObj.Name,
                        Id                  = selectObj.Id
                    );
                }

                update updateObj;
            }
        }
    }
}