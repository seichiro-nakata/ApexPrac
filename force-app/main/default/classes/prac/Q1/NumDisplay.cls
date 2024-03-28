public with sharing class NumDisplay {
    
    // リンゴの個数を格納する定数
    private static final Integer APPLE = 5;
    private static final Integer UPPER_LIMIT = 101;
    private static final Integer LOWER_LIMIT = 0;

    // みかんの個数を扱うString型のプロパティ
    public String orange {get; set;}
    // 計算後の個数を扱うInteger型のプロパティ
    public Integer total {get; set;}
    
    // コンストラクター（今回はなにも記述しない）
    public NumDisplay() {

    }

    // みかんの個数を扱うプロパティの値を初期化するメソッド
    public void init() {
        // String型のプロパティなので空文字を入れる
        this.orange = '';
    }

    // 入力されたみかんの個数とリンゴの個数を計算するメソッド
    public PageReference numSum() {
        // ページ遷移用の変数を定義
        PageReference pages;

        // みかんの個数に数字が入力された場合の処理
        try {
            // 入力されたみかんの個数をInteger型に型変換してInteger型の変数に格納
            Integer orangeNum = Integer.valueOf(this.orange);

            // 入力されたみかんの個数が1個以上100個以下であることを判定する
            if (orangeNum < UPPER_LIMIT && orangeNum > LOWER_LIMIT) {
                // 計算結果格納用のプロパティにみかんとリンゴの個数の計算結果を格納
                this.total = orangeNum + APPLE;
                // 処理が正常に終了した場合のページをページ遷移用の変数に格納
                // 計算結果を表示させるページに遷移させる
                pages = Page.outputNumPage;
            } else {
                // 入力されたみかんの個数が条件に合わない場合にページ遷移させるページを変数に格納
                // 今回はVisualforceでエラーページを作成しているのでそこに遷移させる
                pages = Page.errorPage;
            }
        // みかんの個数に文字列が入力された場合のエラー処理
        } catch(Exception e) {
            // 今回はVisualforceページでエラーページを作成しているのでそこに遷移させる
            pages = Page.errorPage;
        // 計算処理が終了した後に実行させたい処理
        } finally {
            // みかんの個数用のプロパティ値の初期化
            init();
        }
        
        // ページ遷移用の変数をreturnさせてページ遷移を実行
        return pages;
    }

    // 戻るボタン押下時に処理を行うメソッド
    public PageReference back() {
        // 最初のページをreturnさせてページ遷移を実行
        init();
        return Page.inputNumPage;
    }
}