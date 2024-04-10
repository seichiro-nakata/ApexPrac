import { LightningElement, track } from 'lwc';

export default class Q8 extends LightningElement {
    @track currentResult;

    num;

    numberChangeHandler(event) {
        this.num = event.target.value;
    }

    numericJudgment() {
        let resVal;

        switch (String(this.num)) {
            case '1':
                resVal = 'one';
                break;
            case '2':
                resVal = 'two';
                break;
            case '3':
                resVal = 'three';
                break;
            default:
                resVal = this.num;
        }        

        this.currentResult = resVal;
    }
}