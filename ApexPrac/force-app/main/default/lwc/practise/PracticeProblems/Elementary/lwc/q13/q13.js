import { LightningElement, track } from 'lwc';

export default class Q13 extends LightningElement {
    @track currentResult;

    text;

    numberChangeHandler(event) {
        this.text = event.target.value;
    }

    finalCharacterString() {
        this.currentResult = `出力結果：${this.text.slice(-1)}`;
    }
}