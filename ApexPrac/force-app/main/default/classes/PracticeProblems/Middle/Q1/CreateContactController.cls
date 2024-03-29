public with sharing class CreateContactController {
    // プロパティ
    public Account accProperty {get; set;}
    public Contact conProperty {get; set;}

    // コンストラクター
    public CreateContactController() {
        // init();
        accProperty = new Account();
        conProperty = new Contact();
    }

    // プロパティ初期化
    private void init() {
        accProperty = new Account();
        conProperty = new Contact();
    }

    // 取引先重複判定
    private Account searchAccount() {
        Account searchAcc = new Account();

        try {
            searchAcc = [SELECT Id, Name FROM Account WHERE Name = :accProperty.Name];
            
            accProperty = searchAcc;
        } catch (QueryException e) {
            searchAcc = new Account();
        }

        return searchAcc;
    }
    
    // 取引先責任者重複判定
    private Contact searchContact(Account acc) {
        Contact searchCon = new Contact();

        try {
            searchCon = [
                SELECT  Id, LastName, FirstName, Email, AccountId 
                FROM    Contact 
                WHERE   LastName    = :conProperty.LastName and
                        FirstName   = :conProperty.FirstName and
                        Email       = :conProperty.Email and
                        AccountId   = :acc.Id
            ];

            conProperty = searchCon;
        } catch (QueryException e) {
            searchCon = new Contact();
        }

        return searchCon;
    }
    
    // 取引先責任者作成
    private void createContact(Account acc) {
        Contact createCon = new Contact(
            LastName    = conProperty.LastName,
            FirstName   = conProperty.FirstName,
            Email       = conProperty.Email,
            AccountId   = acc.Id
        );

        insert createCon;

        conProperty = createCon;
    }

    // 保存ボタンアクション
    public PageReference save() {
        Account searchAcc = searchAccount();
        createContact(searchAcc);

        return Page.completedContactPage;
    }

    // 次へボタンアクション
    public PageReference next() {
        Contact searchCon = new Contact();
        PageReference pages;

        Account searchAcc = searchAccount();
        
        // 入力された取引先が存在するか判定
        if (searchAcc.Id == null) {
            // 取引先が存在しない場合のページへ遷移
            pages = Page.notExistAccountPage;
        } else {
            searchCon = searchContact(searchAcc);
            // 取引先責任者が重複しているか判定
            if (searchCon.Id == null) {
                // 取引先責任者作成ページへ遷移
                pages = Page.inputConfirmContactPage;
            } else {
                // 取引先責任者が重複している場合のページへ遷移
                pages = Page.duplicationContactPage;
            }
        }
        
        return pages;
    }

    // 戻るボタンアクション
    public PageReference back() {
        init();
        return Page.inputContactPage;
    }
}