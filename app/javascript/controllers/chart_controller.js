import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["chart"]

  connect() {
    const chart = this.chartTarget

    // Couleurs définies : Restant (Gris clair ou Primaire sombre), Complété (Secondaire/Rose)
    const colors = ['#cbd5e1', '#EC0EED'];

    const data = [{
      values: [parseInt(chart.dataset.remaining), parseInt(chart.dataset.complete)],
      labels: ["Restant", "Complété"],
      type: "pie",
      marker: {
        colors: colors
      },
      hole: .4, // Transforme en Donut chart, plus moderne
      textinfo: "label+percent",
      textposition: "inside",
      automargin: true
    }];

    const layout = {
      autosize: true, // Important pour le responsive
      height: 350,    // Hauteur de base suggérée
      margin: { l: 20, r: 20, t: 20, b: 20 }, // Marges réduites
      paper_bgcolor: "rgba(0,0,0,0)", // Fond transparent pour fondre dans la div blanche
      showlegend: true,
      legend: {
        orientation: "h", // Légende horizontale en bas
        x: 0.5,
        xanchor: "center",
        y: -0.1
      }
    };

    const config = {
      responsive: true,
      displayModeBar: false // Cache la barre d'outils Plotly moche au survol
    };

    Plotly.newPlot('chart', data, layout, config);
  }
}
