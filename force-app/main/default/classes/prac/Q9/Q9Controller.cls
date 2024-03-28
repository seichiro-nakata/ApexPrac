public with sharing class Q9Controller {
    
    private static final Integer UPPER_LIMIT = 1000001;
    private static final Integer LOWER_LIMIT = 0;

    public String inputVal {get; set;}
    public String multi1 {get; set;}
    public String multi2 {get; set;}
    public Integer outputVal {get; set;}

    public void init() {
        this.inputVal = null;
        this.multi1 = null;
        this.multi2 = null;
    }

    public PageReference multipleCalc() {
        PageReference pages;

        Integer inputVal;
        Integer multi1;
        Integer multi2;

        List<Integer> multiList = new List<Integer>();

        try {
            inputVal = Integer.valueOf(this.inputVal);
            multi1 = Integer.valueOf(this.multi1);
            multi2 = Integer.valueOf(this.multi2);
            if ((inputVal < UPPER_LIMIT && inputVal > LOWER_LIMIT) &&
                (multi1 < UPPER_LIMIT && multi1 > LOWER_LIMIT) &&
                (multi2 < UPPER_LIMIT && multi2 > LOWER_LIMIT)) {
                    for (Integer i = 1; i <= inputVal; i++) {
                        if (Math.mod(i, multi1) == 0 || Math.mod(i, multi2) == 0) {
                            multiList.add(i);
                        }
                    }
        
                    this.outputVal = multiList.size();
        
                    pages = Page.outputPageQ9;
            } else {
                ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, '整数を入力してください'));
                pages = null;
            }
        } catch (TypeException e) {
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, '整数を入力してください'));
            pages = null;
        } finally {
            init();
        }

        return pages;
    }

    public PageReference back() {
        init();
        return Page.inputPageQ9;
    }
}