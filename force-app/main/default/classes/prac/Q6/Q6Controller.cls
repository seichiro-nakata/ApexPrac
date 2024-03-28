public with sharing class Q6Controller {

    private static final Integer UPPER_LIMIT = 101;
    private static final Integer LOWER_LIMIT = 0;

    public String inputVal {get; set;}
    public Integer result {get; set;}

    public Q6Controller() {
        init();
    }

    private void init() {
        this.result = 0;
    }

    public PageReference factorial() {
        PageReference pages;
        
        try {
            Integer num = Integer.valueOf(this.inputVal);

            if (num < UPPER_LIMIT && num > LOWER_LIMIT) {
                for (Integer i = num; i > 0; i--) {
                    this.result += i;
                }

                pages = Page.outputPageQ6;
            } else {
                pages = Page.errorPageQ6;
            }
        } catch (Exception e) {
            pages = Page.errorPageQ6;
        }

        return pages;
    }

    public PageReference back() {
        init();
        return Page.inputPageQ6;
    }
}