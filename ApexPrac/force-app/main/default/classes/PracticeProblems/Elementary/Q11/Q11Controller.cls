public with sharing class Q11Controller {

    private static final Integer UPPER_LIMIT = 101;
    private static final Integer LOWER_LIMIT = 0;

    public String inputVal {get; set;}
    public String outputVal {get; set;}

    public Q11Controller() {

    }

    public PageReference factorize() {
        PageReference pages;

        Integer inpVal;

        try {
            inpVal = Integer.valueOf(this.inputVal);

            if (inpVal < UPPER_LIMIT && inpVal > LOWER_LIMIT) {
                this.outputVal = getFacRes(inpVal);
                
                pages = Page.outputPageQ11;
            } else {
                ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, '1以上100以下の整数を入力してください'));
            }
        } catch (TypeException e) {
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, '1以上100以下の整数を入力してください'));
        }

        return pages;
    }

    public PageReference back() {
        return Page.inputPageQ11;
    }

    public String getFacRes(Integer inpVal) {
        List<String> resList = new List<String>();
    
        for (Integer i = 2; i <= inpVal; i++) {
            while (Math.mod(inpVal, i) == 0) {
                inpVal /= i;
                resList.add(String.valueOf(i));
            }
        }
    
        return String.join(resList, ',');
    }
    
}