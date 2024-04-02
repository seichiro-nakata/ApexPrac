import { LightningElement, track } from 'lwc';

export default class Q5 extends LightningElement {
    @track currentResult;

    num1;
    num2;

    numberChangeHandler(event) {
        const inpVal = event.target.name;

        if (inpVal === 'num1') {
            this.num1 = event.target.value;
        } else {
            this.num2 = event.target.value;
        }
    }

    power() {
        const resultVal = this.num1 ** this.num2;

        this.currentResult = `計算結果：${resultVal}`;
    }
}