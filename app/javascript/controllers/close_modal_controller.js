import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="close-modal"
export default class extends Controller {
  connect() {
    console.log("modal connected")
    const allIssues = document.querySelectorAll("#issue")
    allIssues.forEach(issue => {
      issue.addEventListener("click", event => {
        const close = document.querySelector(`#close${issue.dataset.ageSection}`);
        close.click();
      })
    });
  }
}
