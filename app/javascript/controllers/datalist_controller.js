import { Controller } from "stimulus";

export default class extends Controller {
    static targets = ['input', 'list', 'hidden']

    update() {
        let options = this.listTarget.querySelectorAll('option');
        let option = [].find.call(options, o => {
            return o.value === this.inputTarget.value;
        });

        if (option) {
            this.hiddenTarget.setAttribute('value', option.getAttribute('data-value'));
        }
    }

    validate() {
        let options = this.listTarget.querySelectorAll('option');
        let option = [].find.call(options, o => {
            return o.value === this.inputTarget.value;
        });

        if (!option) {
            this.inputTarget.value = '';
        }
    }
}