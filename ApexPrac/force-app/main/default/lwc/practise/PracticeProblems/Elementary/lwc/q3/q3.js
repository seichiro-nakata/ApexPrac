import { LightningElement, track } from 'lwc';

export default class Q3 extends LightningElement {
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

    calcNum() {
        const n1 = parseInt(this.num1);
        const n2 = parseInt(this.num2);
        const n3 = parseInt(this.num3);

        const calcVal = n1 * n2 * n3;

        this.currentResult = `計算結果：${calcVal}`;
    }
}