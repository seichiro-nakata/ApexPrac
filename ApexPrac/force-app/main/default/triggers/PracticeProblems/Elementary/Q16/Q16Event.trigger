trigger Q16Event on Account (after insert, after update, after delete, after undelete, before insert, before update, before delete) {
    //再帰時やトリガオフスイッチがTrueの場合は処理を終了する。
    if (Q16Controller.hasExecuting || TriggerSwitch__mdt.getInstance('Account').IsTriggerOff__c) {
        return;
    } 
    
    //再帰処理防止フラグをON 
    Q16Controller.hasExecuting = true;
    
    // Apexクラスのコンストラクタを呼び出す
    Q16Controller handler = new Q16Controller(Trigger.isExecuting, Trigger.size);

    switch on Trigger.operationType {
        when AFTER_INSERT {
            // insert処理がDBに保存された後に起動する処理
            handler.AccountCopy(Trigger.new);
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

    // 再帰チェック変数の値を反転させる
    Q16Controller.hasExecuting = false;
}