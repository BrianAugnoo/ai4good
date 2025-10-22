import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="session"
export default class extends Controller {
  connect() {
    console.log("session connected");
    const groups = this.groups();
    groups.forEach(group => {
      group.addEventListener("click", event => {
        event.preventDefault();
        this.input().value = `${group.dataset.id}`;
        groups.forEach(group => group.querySelector("div").classList.remove("selected-group"));
        group.querySelector("div").classList.add("selected-group");
      });
    })
  }

  groups() {
    return document.querySelectorAll("#group");
  }

  input() {
    return document.querySelector("#group-input");
  }
}
