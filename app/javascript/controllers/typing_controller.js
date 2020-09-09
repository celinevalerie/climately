import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ['navbar'];
    
  hideNavbar() {
    this.navbarTarget.style.display = 'none'
  }
}