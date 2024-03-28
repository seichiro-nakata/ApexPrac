public with sharing class Q10Controller {
    
    private static final Integer UPPER_LIMIT = 21;
    private static final Integer LOWER_LIMIT = 0;

    public String inputVal {get; set;}
    public Integer outputVal {get; set;}
    
    public Q10Controller() {
        init();
    }

    public void init() {
        this.inputVal = null;
        this.outputVal = 1;
    }

    public PageReference factorial() {
        PageReference pages;

        Integer inpVal;

        try {
            inpVal = Integer.valueOf(this.inputVal);

            if (inpVal < UPPER_LIMIT && inpVal > LOWER_LIMIT) {
                for (Integer i = inpVal; i > 1; i--){
                    this.outputVal *= i;
                }

                pages = Page.outputPageQ10;
            } else {
                ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, '1以上20以下の整数を入力してください'));
                pages = null;
            }
        } catch (TypeException e) {
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, '1以上20以下の整数を入力してください'));
            pages = null;
        }

        return pages;
    }

    public PageReference back() {
        init();
        return Page.inputPageQ10;
    }
}