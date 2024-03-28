public with sharing class Q8Controller {
    
    public String inputVal {get; set;}
    public String outputVal {get; set;}
    
    public Q8Controller() {

    }

    public PageReference switchJudgment() {
        PageReference pages;

        try {
            Integer num = Integer.valueOf(this.inputVal);

            switch on num {
                when  1{
                    this.outputVal = 'one';
                }
                when  2{
                    this.outputVal = 'two';
                }
                when  3{
                    this.outputVal = 'three';
                }
                when else {
                    this.outputVal = String.valueOf(num);
                }
            }
            pages = Page.outputPageQ8;
        } catch (Exception e) {
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, '数値を入力してください'));
            pages = null;
        }

        return pages;
    }

    public PageReference back() {
        return Page.inputPageQ8;
    }
}