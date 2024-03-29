import { LightningElement, track } from 'lwc';

export default class Q1 extends LightningElement {  
    @track currentResult;

    orangeNumber;

    numberChangeHandler(event) {
        this.orangeNumber = event.target.value;
    }

    addNum() {
        const APPLE_NUM = 5;
        const orangeN = parseInt(this.orangeNumber);

        this.currentResult = `みかんとリンゴの合計は ${APPLE_NUM + orangeN} 個です。`;
    }
}