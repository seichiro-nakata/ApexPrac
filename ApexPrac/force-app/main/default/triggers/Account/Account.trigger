trigger Account on Account (after insert, after update) {
    //再帰時やトリガオフスイッチがTrueの場合は処理を終了する。
    if (Q16Controller.hasExecuting || TriggerSwitch__mdt.getInstance('Account').IsTriggerOff__c) {
        return;
    } 
    
    //再帰処理防止フラグをON 
    Q16Controller.hasExecuting = true;
    
    // Apexクラスのコンストラクタを呼び出す
    Q16Controller Q16handler = new Q16Controller(Trigger.isExecuting, Trigger.size);
    Q17Controller Q17handler = new Q17Controller(Trigger.isExecuting, Trigger.size);
    Q18Controller Q18handler = new Q18Controller(Trigger.isExecuting, Trigger.size);

    switch on Trigger.operationType {
        when AFTER_INSERT {
            // insert処理がDBに保存された後に起動する処理
            // Q16handler.AccountCopy(Trigger.new);
            Q18handler.AccountScoring(Trigger.new);
        }
        when AFTER_UPDATE {
            // update処理がDBに保存された後に起動する処理
            Q17handler.AccountUpdateCopy(Trigger.new);
        }
    }
}