@isTest
public with sharing class BulkDeleteOpportunityTest {
    @isTest
    // 異常ケース　対象レコード数：0件
    static void error() {
        // 空リスト作成
        List<Opportunity> opportunities = new List<Opportunity>();

        // 選択確認画面をカレントページに設定
        PageReference pageRef = Page.deleteConfirmOpportunityPage;
        System.Test.setCurrentPage(pageRef);

        System.Test.startTest();

        // コントローラの設定
        // 標準コントローラのインスタンス化　商談のリストを渡す
        ApexPages.StandardSetController sc0 = new ApexPages.StandardSetController(opportunities);

        // 「選択されたレコード」を指定する
        sc0.setSelected(opportunities);

        // カスタムコントローラのインスタンス化　標準コントローラを渡す
        BulkDeleteOpportunity oppCtr0 = new BulkDeleteOpportunity(sc0);

        // エラーページが表示されるので「戻る」ボタン押下時のアクションを検証
        oppCtr0.back();

        System.Test.stopTest();
    }

    @isTest
    // 正常ケース　対象レコード数：29件
    static void success() {
        // テストデータ作成　レコード件数29件
        List<Opportunity> opportunities = new List<Opportunity>();

        // 29件のテストレコードをリストに追加
        for (Integer i = 0; i < 29; i++) {
            Opportunity opportunity = new Opportunity(
                Name        = 'TestOpp' + i,
                CloseDate   = Date.today().addMonths(2),
                StageName   = 'Prospecting'
            );

            opportunities.add(opportunity);
        }

        insert opportunities;

        // 選択確認画面をカレントページに設定
        PageReference pageRef = Page.deleteConfirmOpportunityPage;
        System.Test.setCurrentPage(pageRef);

        System.Test.startTest();

        // コントローラーの設定
        ApexPages.StandardSetController sc1 = new ApexPages.StandardSetController(opportunities);
        sc1.setSelected(opportunities);
        BulkDeleteOpportunity oppCtr1 = new BulkDeleteOpportunity(sc1);

        // 削除アクションの検証
        // oppCtr1.del();
        String str = oppCtr1.del().getUrl();

        System.Test.stopTest();

        List<Opportunity> remainingOpportunities = [SELECT Id FROM Opportunity WHERE Id IN :opportunities];
        System.assertEquals(0, remainingOpportunities.size());
        System.debug(remainingOpportunities.size());
    }
}