import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="status"
export default class extends Controller {
  static targets = ["toggle"]

  connect() {
    console.log("status connected")
    this.toggleTargets.forEach(toggle => {
      toggle.addEventListener("change", this.update.bind(this))
    })
  }

  async update(event) {
    const checkbox = event.target
    const column = checkbox.dataset.column
    const value = checkbox.checked
    const id = 1 // on a qu’une seule ligne Status.first

    try {
      const response = await fetch(`/statuses/${id}`, {
        method: "PATCH",
        headers: {
          "Content-Type": "application/json",
          "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').content
        },
        body: JSON.stringify({
          status: { [column]: value }
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
