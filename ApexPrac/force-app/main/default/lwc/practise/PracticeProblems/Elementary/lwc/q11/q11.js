import { LightningElement, track } from 'lwc';

export default class Q11 extends LightningElement {
    @track currentResult;

    num;

    numberChangeHandler(event) {
        this.num = event.target.value;
    }

    primeFactorization() {
        let tar = this.num;
        let resList = [];
        
        for (let i = 2; i <= tar; i++) {
            while (tar % i == 0) {
                tar /= i;
                resList.push(i);
            } 
        }

        this.currentResult = `計算結果：${resList.join()}`;
    }
}