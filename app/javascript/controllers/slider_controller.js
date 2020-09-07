import { Controller } from "stimulus";

export default class extends Controller {
  static targets = [ 'difficulty' ];

  connect() {
    console.log(this.difficultyTarget);
  }
  calculateDifficulty(event) {
    fetch('/challenges', { headers: { accept: "application/json" } })
      .then(response => response.json())
      .then((data) => {
        console.log(this.difficultyTarget);
      });
  }
}
