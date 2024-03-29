public with sharing class Q7Controller {

    public String inputVal {get; set;}
    public String outputVal {get; set;}

    public Q7Controller() {

    }

    public PageReference checkCondition() {
        PageReference pages;

        try {
            Integer num = Integer.valueOf(this.inputVal);

            if (num == 1) {
                this.outputVal = 'one';
            } else if (num == 2) {
                this.outputVal = 'two';
            } else if (num == 3) {
                this.outputVal = 'three';
            } else {
                this.outputVal = String.valueOf(num);
            }

            pages = Page.outputPageQ7;
        } catch (Exception e) {
            pages = Page.errorPageQ7;
        }

        return pages;
    }

    public PageReference back() {
        return Page.inputPageQ7;
    }
}