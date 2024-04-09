public with sharing class Q15Controller {
    private static final String REGEX = '([0-9０-９])';

    public String inputVal {get; set;}
    public String outputVal {get; set;}
    
    public Q15Controller() {

    }

    private void init() {
        this.inputVal = '';
        this.outputVal = '';
    }

    public PageReference extractDigits() {
        PageReference pages;


        if (String.isBlank(this.inputVal)) {
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, '文字列を入力してください'));
            pages = null;
        } else {
            Pattern p = Pattern.compile(REGEX);
            Matcher m = p.matcher(this.inputVal);

            while (m.find()) {
                this.outputVal += m.group();
            }

            pages = Page.outputPageQ15;
        }

        return pages;
    }

    public PageReference back() {
        init();
        return Page.inputPageQ15;
    }
}