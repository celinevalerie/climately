import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ['link'];
  image() {
    this.linkTarget.src = "https://res.cloudinary.com/dpdwv3yz1/image/upload/v1598886174/no-straws_ntoptk.png"
  }

  resetimage() {
    this.linkTarget.src = "https://res.cloudinary.com/dpdwv3yz1/image/upload/v1598887082/Layer_12_nwffji.png"
  }
}