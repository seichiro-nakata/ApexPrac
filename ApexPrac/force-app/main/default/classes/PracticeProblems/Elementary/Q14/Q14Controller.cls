public with sharing class Q14Controller {
    private static final String FIRST_TWO_CHAR = 'AB';

    public String inputVal {get; set;}
    public String outputVal {get; set;}
    
    public Q14Controller() {
        init();
    }

    private void init() {
        this.inputVal = null;
    }

    public PageReference firstTwoChars() {
        PageReference pages;


        if (String.isBlank(this.inputVal)) {
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, '文字列を入力してください'));
            pages = null;
        } else {
            if (this.inputVal.startsWith(FIRST_TWO_CHAR)) {
                this.outputVal = 'OK';
            } else {
                this.outputVal = 'NG';
            }

            pages = Page.outputPageQ14;
        }

        return pages;
    }

    public PageReference back() {
        init();
        return Page.inputPageQ14;
    }
}