import { LightningElement, track } from 'lwc';

export default class Q10 extends LightningElement {
    @track currentResult;

    num;

    numberChangeHandler(event) {
        this.num = event.target.value;
    }

    sumOfStairs() {
        let resVal = 1;

        for (let i = 1; i <= this.num; i++) {
            resVal *= i;
        }

        this.currentResult = `計算結果：${resVal}`;
    }
}