public with sharing class Q4Controller {
    private static final Integer UPPER_LIMIT = 101;
    private static final Integer LOWER_LIMIT = 0;

    public Integer num {get; set;}
    public String result {get; set;}

    public Q4Controller() {

    }

    public void init() {
        this.num = 0;
    }

    public PageReference checkEvenOdd() {
        PageReference pages;
        
        if (this.num < UPPER_LIMIT && this.num > LOWER_LIMIT) {
            if (Math.mod(this.num, 2) == 0) {
                this.result = '偶数';
            } else {
                this.result = '奇数';
            }
            pages = Page.outputPageQ4;
        } else {
            pages = Page.errorQ4;
        }

        return pages;
    }

    public PageReference back() {
        init();
        return Page.inputPageQ4;
    }
}