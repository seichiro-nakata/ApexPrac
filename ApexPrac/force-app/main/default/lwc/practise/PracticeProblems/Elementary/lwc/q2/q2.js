import { LightningElement, track } from 'lwc';

export default class Q2 extends LightningElement {
    @track currentResult;

    num1;
    num2;
    num3;

    numberChangeHandler(event) {
        const inputBoxName = event.target.name;
        if (inputBoxName === 'num1') {
            this.num1 = event.target.value;
        } else if (inputBoxName === 'num2') {
            this.num2 = event.target.value;
        } else if (inputBoxName === 'num3') {
            this.num3 = event.target.value;
        }
    }

    addNum() {
        const num1 = parseInt(this.num1);
        const num2 = parseInt(this.num2);
        const num3 = parseInt(this.num3);

        const addResult = num1 + num2 + num3;

        this.currentResult = `計算結果：${addResult}`;
    }
}