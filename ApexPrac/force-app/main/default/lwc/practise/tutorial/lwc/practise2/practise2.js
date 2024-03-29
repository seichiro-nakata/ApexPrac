import { LightningElement, track } from 'lwc';

export default class Pra2 extends LightningElement {
    @track displayDiv = 0;

    showDivHandler() {
        this.displayDiv = 1;
    }
}