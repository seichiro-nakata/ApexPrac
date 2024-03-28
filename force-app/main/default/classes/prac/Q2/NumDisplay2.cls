public with sharing class NumDisplay2 {

    private static final Integer UPPER_LIMIT = 101;
    private static final Integer LOWER_LIMIT = 0;

    public String num1 {get; set;}
    public String num2 {get; set;}
    public String num3 {get; set;}
    // public Double total {get; set;}
    public Integer total {get; set;}
    
    public NumDisplay2() {
        totalInit();
    }

    private void numInit() {
        this.num1 = '';
        this.num2 = '';
        this.num3 = '';
    }

    private void totalInit() {
        this.total = 0;
    }

    public PageReference numSum() {
        PageReference pages;

        List<Integer> numList = new List<Integer>();
        List<Integer> sumList = new List<Integer>();

        try {
            numList.add(Integer.valueOf(this.num1));
            numList.add(Integer.valueOf(this.num2));
            numList.add(Integer.valueOf(this.num3));

            for (Integer i : numList) {
                if (i > LOWER_LIMIT && i < UPPER_LIMIT) {
                    this.total += i;
                    pages = Page.outputNumPageQ2;
                } else {
                    pages = Page.errorPageQ2;
                    break;
                }
            }
        } catch (Exception e) {
            pages = Page.errorPageQ2;
        } finally {
            numInit();
        }

        return pages;
    }

    public PageReference back() {
        totalInit();
        return Page.inputNumPageQ2;
    }
}