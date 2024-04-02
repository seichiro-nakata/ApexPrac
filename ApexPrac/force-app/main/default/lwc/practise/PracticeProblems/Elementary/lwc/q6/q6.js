import { LightningElement, track } from 'lwc';

export default class Q6 extends LightningElement {
    @track currentResult;

    num;

    numberChangeHandler(event) {
        this.num = event.target.value;
    }

    calculateSum() {
        let resVal = 0;

        for (let i = 1; i <= this.num; i++) {
            resVal += i;
        }

        this.currentResult = `計算結果：${resVal}`;
    }
}