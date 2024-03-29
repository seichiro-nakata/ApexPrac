public with sharing class Q12Controller {

    private static Integer STRING_LENGTH_LIMIT = 2;
    
    public String inputVal {get; set;}
    public String outputVal {get; set;}
    
    public Q12Controller() {
        init();
    }

    private void init() {
        this.inputVal = null;
    }

    public PageReference teletext() {
        PageReference pages;

        if (this.inputVal.length() > STRING_LENGTH_LIMIT) {
            this.outputVal = this.inputVal.substring(2, 3);
            pages = Page.outputPageQ12;
        } else {
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, '3文字以上の文字列を入力してください'));
            init();
            pages = null;
        }

        return pages;
    }

    public PageReference back() {
        init();
        return Page.inputPageQ12;
    }
}