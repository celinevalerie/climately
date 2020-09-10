import { Controller } from "stimulus";

export default class extends Controller {
  static targets = [ 'difficulty', 'exceptions', 'impact', 'duration', 'points' ];

  calculateDifficulty(event) {
    fetch('/challenges', { headers: { accept: "application/json" } })
      .then(response => response.json())
      .then((data) => {
        const challenge = data.challenges.find(challenge => challenge.id == event.target.dataset.id);
        var difficultyCalculated = challenge.default_difficulty - this.exceptionsTarget.value
        this.difficultyTarget.style.width = (difficultyCalculated * 30) +"px"
      });
  }
   calculateImpact(event) {
      fetch('/challenges', { headers: { accept: "application/json" } })
        .then(response => response.json())
        .then((data) => {
          const challenge = data.challenges.find(challenge => challenge.id == event.target.dataset.id);
          var impactCalculated = challenge.default_impact * this.durationTarget.value
          this.impactTarget.style.width = (impactCalculated * 3) +"px"
        });
  }
  calculatePoints(event) {
      fetch('/challenges', { headers: { accept: "application/json" } })
        .then(response => response.json())
        .then((data) => {
          const challenge = data.challenges.find(challenge => challenge.id == event.target.dataset.id);
          var impactCalculated = challenge.default_impact * this.durationTarget.value
          var difficultyCalculated = challenge.default_difficulty - this.exceptionsTarget.value
          var points = impactCalculated * difficultyCalculated * 10
          this.pointsTarget.innerText = `${points} points`
        });
  }
}


// @impact * 1 + @difficulty * 1 )* 10
