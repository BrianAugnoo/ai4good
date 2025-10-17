import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search"
export default class extends Controller {
  static targets = ["input", "list"]

  connect() {
    this.inputTarget.addEventListener("keyup", () => this.filter())
  }

  filter() {
    const filter = this.inputTarget.value.toLowerCase()
    const groups = this.listTarget.querySelectorAll(".group")

    groups.forEach(group => {
      const name = group.querySelector(".h5").textContent.toLowerCase()
      const etab = group.querySelector("p").textContent.toLowerCase()

      group.style.display = name.includes(filter) || etab.includes(filter) ? "" : "none"
    })
  }
}
