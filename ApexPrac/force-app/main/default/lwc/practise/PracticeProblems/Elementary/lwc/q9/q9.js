import { LightningElement, track } from 'lwc';

export default class Q9 extends LightningElement {
    @track currentResult;

    num;
    num1;
    num2;

    numberChangeHandler(event) {
        const eventName = event.target.name;

        if (eventName === 'num') {
            this.num = event.target.value;
        } else if (eventName === 'num1') {
            this.num1 = event.target.value;
        } else if (eventName === 'num2') {
            this.num2 = event.target.value;
        }
    }

    multipleAdjudication() {
        let resList = [];

        for (let i = 1; i <= this.num; i++) {
            if ((i % this.num1 === 0) || (i % this.num2 === 0)) {
                resList.push(i);
            }
        }

        this.currentResult = `${this.num1}と${this.num2}の${this.num}までの倍数の合計は、【${resList.length}】個である。`;
    }
}