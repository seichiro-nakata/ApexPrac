import { LightningElement, track } from 'lwc';

export default class Q4 extends LightningElement {
    @track currentResult;

    num;

    numberChangeHandler(event) {
        this.num = event.target.value;
    }

    isEvenOdd() {
        if (this.num % 2 == 0) {
            this.currentResult = `${this.num}は偶数です`;
        } else {
            this.currentResult = `${this.num}は奇数です`;
        }
    }
}