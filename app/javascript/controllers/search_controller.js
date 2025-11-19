import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search"
export default class extends Controller {
  static targets = ["input", "list"]

  connect() {
    // Utilise "input" au lieu de "keyup" pour une meilleure réactivité (supporte le copier-coller)
    this.inputTarget.addEventListener("input", () => this.filter())
  }

  filter() {
    const filterValue = this.inputTarget.value.toLowerCase()

    // On récupère les enfants directs de la target "list" (#all-group)
    // Ce sont les balises <a> définies dans _group.html.erb
    const items = Array.from(this.listTarget.children)

    items.forEach(item => {
      // On cherche les éléments de texte À L'INTÉRIEUR de chaque item (carte)
      // Le '?' (optional chaining) évite les erreurs si un élément manque
      const name = item.querySelector(".h5")?.textContent.toLowerCase() || ""
      const etab = item.querySelector(".group p")?.textContent.toLowerCase() || ""

      // Vérification de correspondance
      const isMatch = name.includes(filterValue) || etab.includes(filterValue)

      // On cache L'ITEM ENTIER (la balise <a>), pas juste le texte
      item.style.display = isMatch ? "" : "none"
    })
  }
}
