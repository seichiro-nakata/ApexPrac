import { LightningElement, track } from 'lwc';

export default class Q15 extends LightningElement {
    @track currentResult;

    text;

    numberChangeHandler(event) {
        this.text = event.target.value;
    }

    delimiter() {
        const regex = /[^0-9]/g;
        let resVal = this.text.replace(regex, '');

        this.currentResult = `出力結果：「${resVal}」`;
    }
}