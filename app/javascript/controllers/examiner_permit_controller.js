import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="examiner-permit"
export default class extends Controller {
  static targets = ["toggle"]

  connect() {
    console.log("examiner-permit connected")
    this.toggleTargets.forEach(toggle => {
      toggle.addEventListener("change", this.update.bind(this))
    })
  }

  async update(event) {
    console.log("start update");
    const checkbox = event.target
    const column = checkbox.dataset.column
    const value = checkbox.checked
    const id = checkbox.dataset.id

    try {
      const response = await fetch(`/custom_examiners/${id}`, {
        method: "PATCH",
        headers: {
          "Content-Type": "application/json",
          "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').content
        },
        body: JSON.stringify({
          examiner: { [column]: value }
        })
      })

      if (!response.ok) throw new Error("Erreur lors de la mise à jour")
      console.log(`${column} mis à jour -> ${value}`)
    } catch (error) {
      console.error(error)
      alert("Une erreur est survenue.")
    }
  }
}
