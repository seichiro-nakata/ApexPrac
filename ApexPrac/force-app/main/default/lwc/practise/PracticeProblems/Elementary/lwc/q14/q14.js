import { LightningElement, track } from 'lwc';

export default class Q14 extends LightningElement {
    @track currentResult;

    text;

    numberChangeHandler(event) {
        this.text = event.target.value;
    }

    output2Char() {
        let resVal;
        const val = this.text.substring(0, 2);

        if (val == 'AB') {
            resVal = 'OK';
        } else {
            resVal = 'NO';
        }

        this.currentResult = `判定結果：${resVal}`;
    }
}