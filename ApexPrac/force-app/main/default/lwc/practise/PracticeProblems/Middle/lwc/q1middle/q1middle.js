import { LightningElement, track } from 'lwc';
import createContact from '@salesforce/apex/q1middoleController.createContact';
import { ShowToastEvent } from 'lightning/platformShowToastEvent'; // トーストイベントのインポート

export default class Q1middle extends LightningElement {
    @track AccountName = '';
    @track LastName = '';
    @track FirstName = '';
    @track Email = '';

    textChangeHandler(event) {
        const inputBoxName = event.target.name;

        switch (inputBoxName) {
            case 'AccountName':
                this.AccountName = event.target.value;
                break;
            case 'LastName':
                this.LastName = event.target.value;
                break;
            case 'FirstName':
                this.FirstName =  event.target.value;
                break;
            case 'Email':
                this.Email = event.target.value;
                break;
        }
    }

    createContactForm() {
        const outputAccountName = this.AccountName;

        createContact({
            accountName: this.AccountName,
            lastName: this.LastName,
            firstName: this.FirstName, // 修正点
            email: this.Email
        })
            .then(() => {
                this.clearForm();
                this.showToast(`${outputAccountName}の取引先責任者の作成に成功しました。`, 'success'); // メッセージの修正
            })
            .catch((error) => {
                console.error('エラーが発生しました:', error); // エラーメッセージの修正
                this.showToast('取引先責任者の作成に失敗しました。', 'error'); // メッセージの修正
            });
    }

    clearForm() {
        this.AccountName = '';
        this.LastName = '';
        this.FirstName = '';
        this.Email = '';

        const inputFields = this.template.querySelectorAll('lightning-input'); // DOM内の入力フィールドを取得
        inputFields.forEach(field => {
            field.value = ''; // フィールドの値をクリア
        });
    }

    showToast(title, variant) {
        const event = new ShowToastEvent({
            title,
            variant,
        });
        this.dispatchEvent(event);
    }
}
