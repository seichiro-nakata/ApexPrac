public with sharing class objectCopyController {
    // 再帰処理防止フラグ（トリガーから参照可能にしている）
    public static Boolean hasExecuting = false;
    // トリガーからの呼び出し判定
    private Boolean isExecuting = false;
    // トリガーのレコードサイズ
    private Integer batchSize = 0;
    // 取得可能レコード数 = 最大取得可能レコード数 - 消費済レコード数
    private Integer canExecuteRowsLimit = Limits.getLimitQueryRows() - Limits.getQueryRows();
    
    public objectCopyController(Boolean isExecuting, Integer batchSize) {
        this.isExecuting = isExecuting;
        this.batchSize = batchSize;
    }

    // afterトリガー　insert処理
    public void onAfterInsert(List<triggerObject__c> newTriggerObject) {
        triggercopyobject__c insertTriggerObject;

        for (triggerObject__c newObject : newTriggerObject) {
            insertTriggerObject = new triggercopyobject__c(
                Name        = newObject.Name + '_after',
                name__c     = newObject.name__c + '_コピー',
                kingaku__c  = newObject.kingaku__c,
                ID__c       = newObject.Id
            );
        }

        insert insertTriggerObject;
    }

    // beforeトリガー　insert処理
    public void onBeforeInsert(List<triggerObject__c> newTriggerObject) {
        triggercopyobject__c insertTriggerObject;

        for (triggerObject__c newObject : newTriggerObject) {
            insertTriggerObject = new triggercopyobject__c(
                Name        = newObject.Name + '_before',
                name__c     = newObject.name__c + '_コピー',
                kingaku__c  = newObject.kingaku__c,
                ID__c       = newObject.Id
            );
        }

        insert insertTriggerObject;
    }
}