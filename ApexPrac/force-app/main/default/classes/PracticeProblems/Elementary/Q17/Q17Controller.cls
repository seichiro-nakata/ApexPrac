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

                if (strName.endsWith(RELATION_STRING)) {
                    // 二回目
                    updateObj = new ObjectsForCopy__c (
                        Name                = newObj.Name + RELATION_STRING + '2',
                        CopyAccountId__c    = newObj.Id,
                        CopyAccountName__c  = newObj.Name,
                        Id                  = selectObj.Id
                    );
                } else if (strName.contains(RELATION_STRING)) {
                    // 三回目以降
                    Integer index = strName.indexOf(RELATION_STRING);
                    Integer countNum = Integer.valueOf(strName.substring(index + 4));
                    
                    countNum += 1;
                    
                    updateObj = new ObjectsForCopy__c (
                        Name                = newObj.Name + RELATION_STRING + String.valueOf(countNum),
                        CopyAccountId__c    = newObj.Id,
                        CopyAccountName__c  = newObj.Name,
                        Id                  = selectObj.Id
                    );
                } else {
                    // 初回
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