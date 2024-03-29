public with sharing class Q5Controller {

    public String numA {get; set;}
    public String numB {get; set;}
    public Integer result {get; set;}

    private static final Integer UPPER_LIMIT = 101;
    private static final Integer LOWER_LIMIT = 0;

    public Q5Controller() {

    }

    public PageReference raisingNum() {
        PageReference pages;

        try {
            Integer numA = Integer.valueOf(this.numA);
            Integer numB = Integer.valueOf(this.numB);

            if ((numA < UPPER_LIMIT && numA > LOWER_LIMIT) && (numB < UPPER_LIMIT && numB > LOWER_LIMIT)) {
                this.result = Integer.valueOf(Math.pow(numA, numB));
                pages = Page.outputPageQ5;
            } else {
                pages = Page.errorPageQ5;
            }
        } catch (Exception e) {
            pages = Page.errorPageQ5;
        }

        return pages;
    }

    public PageReference back() {
        return Page.inputPageQ5;
    }
}