import { LightningElement, track } from 'lwc';

export default class Pra4 extends LightningElement {
    @track currentResult;

    firstNumber;
    secondNumber;

    numberChangeHandler(event) {
        const inputBoxName = event.target.name;
        if (inputBoxName === 'firstNumber') {
            this.firstNumber = event.target.value;
        } else if (inputBoxName === 'secondNumber') {
            this.secondNumber = event.target.value;
        }
    }

    // parseInt：文字列を整数に変換する
    addHandler() {
        const firstN = parseInt(this.firstNumber);
        const secondN = parseInt(this.secondNumber);

        this.currentResult = `Result of ${firstN} + ${secondN} is ${firstN + secondN}`;
    }

    subHandler() {
        const firstN = parseInt(this.firstNumber);
        const secondN = parseInt(this.secondNumber);

        this.currentResult = `Result of ${firstN} - ${secondN} is ${firstN - secondN}`;
    }

    multiplyHandler() {
        const firstN = parseInt(this.firstNumber);
        const secondN = parseInt(this.secondNumber);

        this.currentResult = `Result of ${firstN} x ${secondN} is ${firstN * secondN}`;
    }

    divisionHandler() {
        const firstN = parseInt(this.firstNumber);
        const secondN = parseInt(this.secondNumber);

        this.currentResult = `Result of ${firstN} / ${secondN} is ${firstN / secondN}`;
    }


}