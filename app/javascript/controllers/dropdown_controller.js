import { Controller } from "stimulus";

export default class extends Controller {
  static targets = [ 'button', 'menu' ]

  toggle() {
    this.menuTarget.classList.toggle('hidden');
    this.buttonTarget.setAttribute(
        'aria-expanded',
        this.buttonTarget.getAttribute('aria-expanded') === 'true' ? 'false' : 'true'
    );
  }
}
