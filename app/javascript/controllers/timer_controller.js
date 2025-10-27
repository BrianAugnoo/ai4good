import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="timer"
export default class extends Controller {
  initialize() {
    this.timer_count = 0;
    this.timer = document.querySelector(".timer");
  }

  connect() {
    console.log("timer connected", this.timer);
    setInterval(() => {
      this.timer_count++;
      const minutes = Math.floor(this.timer_count / 60);
      const seconds = this.timer_count % 60;
      const secondsDecimals = Math.floor(seconds / 10);
      const secondsUnits = seconds % 10;
      this.timer.textContent = `${minutes}:${secondsDecimals}${secondsUnits}`
    }, 1000);
  }
}
