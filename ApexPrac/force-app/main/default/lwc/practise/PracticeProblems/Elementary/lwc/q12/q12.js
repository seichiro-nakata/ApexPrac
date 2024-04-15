import { LightningElement, track } from 'lwc';

export default class Q12 extends LightningElement {
    @track currentResult;

    text;

    numberChangeHandler(event) {
        this.text = event.target.value;
    }

    extraction3rdCharacter() {
        this.currentResult = `出力結果：${this.text.substring(2, 3)}`;
    }
}