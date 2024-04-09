trigger test on SOBJECT (after insert, after update, after delete, after undelete, before insert, before update, before delete) {
    //再帰時やトリガオフスイッチがTrueの場合は処理を終了する。TriggerSwitch__mdt.getInstance('')の('')にはオブジェクト名を記述する
    if (objectCopyController.hasExecuting || TriggerSwitch__mdt.getInstance('').IsTriggerOff__c) {
        return;
    }
    //再帰処理防止フラグをON
    objectCopyController.hasExecuting = true; 
    // Apexクラスのコンストラクタを呼び出す
    objectCopyController handler = new objectCopyController(Trigger.isExecuting, Trigger.size);

    switch on Trigger.operationType {
        when AFTER_INSERT {
            // insert処理がDBに保存された後に起動する処理
        }
        when AFTER_UPDATE {
            // update処理がDBに保存された後に起動する処理
        }
        when AFTER_DELETE {
            // delete処理がDBに保存された後に起動する処理
        }
        when AFTER_UNDELETE {
            // undelete処理がDBに保存された後に起動する処理
        }
        when BEFORE_INSERT {
            // insert処理がDBに保存される前に起動する処理
        }
        when BEFORE_UPDATE {
            // update処理がDBに保存される前に起動する処理
        }
        when BEFORE_DELETE {
            // delete処理がDBに保存される前に起動する処理
        }
    }
}