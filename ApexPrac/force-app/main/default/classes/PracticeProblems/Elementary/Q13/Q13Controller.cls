public with sharing class Q13Controller {
    public String inputVal {get; set;}
    public String outputVal {get; set;}
    
    public Q13Controller() {
        init();
    }

    private void init() {
        this.inputVal = null;
    }

    public PageReference getLastCharacter() {
        PageReference pages;
        
        if (String.isBlank(this.inputVal)) {
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, '文字列を入力してください'));
            pages = null;
        } else {
            this.outputVal = this.inputVal.right(1);
            pages = Page.outputPageQ13;
        }

        return pages;
    }

    public PageReference back() {
        init();
        return Page.inputPageQ13;
    }
}  