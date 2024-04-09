import { LightningElement, track } from 'lwc';

export default class Q7 extends LightningElement {
    @track currentResult;

    num;

    numberChangeHandler(event) {
        this.num = event.target.value;
    }

    numericJudgment() {
        if (this.num == 1) {
            this.currentResult = 'one';
        } else if (this.num == 2) {
            this.currentResult = 'two';
        } else if (this.num == 3) {
            this.currentResult = 'three';
        } else {
            this.currentResult = this.num;
        }
    }
}