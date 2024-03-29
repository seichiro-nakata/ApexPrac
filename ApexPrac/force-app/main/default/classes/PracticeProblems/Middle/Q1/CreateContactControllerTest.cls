@isTest
public with sharing class CreateContactControllerTest {
    // ＝＝＝＝＝テストデータ作成＝＝＝＝＝
    @TestSetup
    static void setup(){
        // 取引先作成
        Account account = new Account(Name = 'テスト株式会社');
        insert account;

        // 取引先責任者作成
        Contact contact = new Contact(
            LastName = 'テスト',
            FirstName = '太郎',
            Email = 'test@test.com',
            AccountId = account.Id
        );
        insert contact;
    }

    // ＝＝＝＝＝正常時テスト＝＝＝＝＝
    @isTest
    static void SuccessTest() {
        // テスト対象Visualforceページの生成
        PageReference startPage = Page.inputContactPage;

        // テストメソッド起動
        Test.startTest();

        // カレントページにテスト対象Visualforceページを設定
        Test.setCurrentPage(startPage);

        // テスト対象コントローラーのオブジェクト化
        CreateContactController controller = new CreateContactController();

        // コントローラー内のsetterメソッドのテスト
        // 実画面で入力するデータを作成してメソッドへ渡す
        controller.setAccount(new Account(Name = 'テスト株式会社'));
        controller.setContact(
            new Contact(
                LastName    = 'テスト',
                FirstName   = '次郎',
                Email       = 'jiro@test.com'
            )
        );

        // コントローラーのnextメソッドのgetUrlを呼び出して、遷移先URLを取得
        // 想定しているページはinputConfirmContactPage（登録確認画面）
        String nextPage = controller.next().getUrl();

        // 遷移先ページをカレントページに設定
        // nextPageはString型なので型変換が必要
        Test.setCurrentPage(new PageReference(nextPage));

        // コントローラー内のgetterメソッドのテスト
        // inputConfirmContactPageに遷移した時点でgetterから渡された値を保持
        // 実画面で表示される値を想定
        Account nextPageAccout = controller.getAccount();
        Contact nextPageContact = controller.getContact();

        // コントローラー内のsaveメソッドのgetUrlを呼び出して、遷移先URLを取得
        // 想定しているページはcompletedContactPage（登録完了画面）
        // カレントページに設定する
        String savePage = controller.save().getUrl();
        Test.setCurrentPage(new PageReference(savePage));

        // completedContactPageに遷移した時点でgetterから渡された値を保持
        Account savePageAccount = controller.getAccount();
        Contact savePageContact = controller.getContact();

        // コントローラーのbackメソッドのgetUrlを呼び出して、遷移先URLを取得
        // 想定しているページはinputContactPage（初期画面）
        // カレントページに設定
        String backPage = controller.back().getUrl();
        Test.setCurrentPage(new PageReference(backPage));

        // 初期画面に遷移した時点でgetterから渡された値を保持
        Account startPageAccount = controller.getAccount();
        Contact startPageContact = controller.getContact();

        // テストメソッド終了
        Test.stopTest();


        // ＝＝＝＝＝テスト結果検証＝＝＝＝＝
        // 登録内容確認画面に出力された値の検証
        System.assertEquals('テスト有限会社', nextPageAccout.Name);
        System.assertEquals('テスト', nextPageContact.LastName);
        System.assertEquals('次郎', nextPageContact.FirstName);
        System.assertEquals('jiro@test.com', nextPageContact.Email);

        // 登録完了画面に出力された値の検証
        System.assertEquals('テスト有限会社', savePageAccount.Name);
        System.assert.isNotNull(savePageContact.Id);
        System.assertEquals('テスト', savePageContact.LastName);
        System.assertEquals('次郎', savePageContact.FirstName);
        System.assertEquals('jiro@test.com', savePageContact.Email);

        // 初期画面遷移時の値の初期化の検証
        System.assert.isNull(startPageAccount.Name);
        System.assert.isNull(startPageContact.Id);
        System.assert.isNull(startPageContact.LastName);
        System.assert.isNull(startPageContact.FirstName);
        System.assert.isNull(startPageContact.Email);

        // nextPageのURLの検証
        System.assertEquals('/apex/inputconfirmcontactpage', nextPage);
        
        // backPageのURLの検証
        System.assertEquals('/apex/inputcontactpage', backPage);

        // savePageのURLの検証
        System.assertEquals('/apex/completedcontactpage', savePage);
    }

    // ＝＝＝＝＝異常時テスト＝＝＝＝＝
    @isTest
    static void ErrorTest() {
        // テスト対象Visualforceページの生成
        PageReference startPage = Page.inputContactPage;

        // テストメソッド起動
        Test.startTest();

        // カレントページの設定
        Test.setCurrentPage(startPage);

        // テスト対象コントローラーのオブジェクト化
        CreateContactController controller = new CreateContactController();

        // コントローラー内のsetterメソッドのテスト
        // 実画面で入力するデータを作成してメソッドへ渡す
        controller.setAccount(new Account(Name = 'テスト株式会社'));
        controller.setContact(
            new Contact(
                LastName = 'テスト',
                FirstName = '太郎',
                Email = 'test@test.com'
            )
        );

        // コントローラーのnextメソッドのgetUrlを呼び出して、遷移先URLを取得
        // 想定しているページはduplicationContactPage（重複時画面）
        String nextPage = controller.next().getUrl();

        // カレントページの設定
        Test.setCurrentPage(nextPage);

        // 重複時ページ遷移時点のgetterの値を保持
        Account testAccount = controller.getAccount();
        Contact testContact = controller.getContact();

        // コントローラーのbackメソッドのgetUrlを呼び出して、遷移先URLを取得
        // 想定しているページはinputContactPage（初期画面）
        String backPage = controller.back().getUrl();

        // テストメソッド終了
        Test.stopTest();


        // ＝＝＝＝＝テスト結果検証＝＝＝＝＝
        System.assertEquals('テスト株式会社', testAccount.Name);
        System.assert.isNotNull(testContact.Id);
        System.assertEquals('テスト', testContact.LastName);
        System.assertEquals('太郎', testContactFirstName);
        System.assertEquals('test@test.com', testContact.Email);
        System.assertEquals('/apex/duplicationcontactpage', nextPage);
        System.assertEquals('/apex/inputcontactpage', backPage);
    }
}