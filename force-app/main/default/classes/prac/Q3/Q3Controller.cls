public with sharing class Q3Controller {

    private static final Integer UPPER_LIMIT = 101;
    private static final Integer LOWER_LIMIT = 0;

    public Integer num1 {get; set;}
    public Integer num2 {get; set;}
    public Integer num3 {get; set;}
    public Integer total {get; set;}
    
    public Q3Controller() {
        init();
    }

    public void init() {
        this.total = 1;
    }

    public PageReference multiplication() {
        PageReference pages;
        List<Integer> numList = new List<Integer>();

        numList.add(this.num1);
        numList.add(this.num2);        
        numList.add(this.num3);

        for (Integer i : numList) {
            if (i < UPPER_LIMIT && i > LOWER_LIMIT && this.total != 0) {
                this.total *= i;
                pages = Page.outputPageQ3;
            } else {
                pages = Page.errorPageQ3;
                break;
            }
        }
        
        return pages;
    }

    public PageReference back() {
        init();
        return Page.inputPageQ3;
    }
}