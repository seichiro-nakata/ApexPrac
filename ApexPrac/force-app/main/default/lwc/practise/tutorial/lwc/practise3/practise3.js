import { LightningElement, track } from 'lwc';

export default class Pra3 extends LightningElement {
    @track displayDiv = false;
    @track cityList = ['Tokyo', 'Beijing', 'New York', 'Moscow'];

    showDivHandler(event) {
        this.displayDiv = event.target.checked;
    }
}