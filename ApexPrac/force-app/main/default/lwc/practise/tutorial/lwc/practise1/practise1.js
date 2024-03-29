import { LightningElement, track } from 'lwc';

export default class Prac extends LightningElement {
    // 「@track」は変数値の変化を検知し、値が変更されたら再レンダリングする
    // 無くても正常に動作する
    @track dynamicGreeting = 'World';

    greetingChangeHandler(event) {
        this.dynamicGreeting = event.target.value;
    }
}