public with sharing class BulkDeleteOpportunity {
    // プロパティ
    public List<Opportunity> selectedOpportunities {get; set;}

    // 定数
    private static final Integer UPPER_LIMIT = 30;
    private static final Integer LOWER_LIMIT = 0;
    private static final String LISTVIEW_URL = 'https://intloop22-dev-ed.develop.lightning.force.com/lightning/o/Opportunity/list?filterName=00B5j00000RR74BEAT';
    
    // コンストラクター　リストビューを扱う際は引数にApexPages.StandardSetControllerを指定する
    public BulkDeleteOpportunity(ApexPages.StandardSetController controller) {
        // リストビューで選択したレコード情報を取得
        List<Opportunity> selectedOppList = controller.getSelected();

        // 取得したリストビュー情報を基にレコードの情報を取得
        this.selectedOpportunities = [
            SELECT Id, 
            Name FROM 
            Opportunity 
            WHERE Id IN :(new Map<Id, Opportunity>(selectedOppList)).keySet()
        ]; 
        // Idがキーのマップに上でとってきたリストを入れてマップを作り、.keyset()でキー値のIdのみを取り出す。それをWHEREのIdにいれている。
    }

    // 削除ボタンアクション
    public PageReference del() {
        PageReference pages;

        // 選択件数判定
        if (this.selectedOpportunities.size() == LOWER_LIMIT || this.selectedOpportunities.size() >= UPPER_LIMIT) {
            pages = Page.errorOpportunityPage;
        } else {
            deleteOpportunity();
            pages = Page.completeDelOppPage;
        }

        return pages;
    }

    // 戻るボタンアクション
    public PageReference back() {
        // 組織ページへ遷移
        PageReference pages = new PageReference(LISTVIEW_URL);
        return pages;
    }

    // レコード削除
    private void deleteOpportunity() {
        delete this.selectedOpportunities;
    }
}