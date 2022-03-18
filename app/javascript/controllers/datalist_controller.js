import { Controller } from "stimulus";
import Choices from "choices.js";
import "choices.js/public/assets/styles/choices.css"

export default class extends Controller {
    connect() {
        this.choices = new Choices(this.element)
    }
}