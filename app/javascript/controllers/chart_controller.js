import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["chart"]

  connect() {
    const chart = this.chartTarget

    const colors = ['#cbd5e1', '#EC0EED'];

    const data = [{
      values: [parseInt(chart.dataset.remaining), parseInt(chart.dataset.complete)],
      labels: ["Restant", "Complété"],
      type: "pie",
      marker: {
        colors: colors
      },
      hole: .4,

      // --- MODIFICATION ICI ---
      // "label+percent" affichait le % (ex: "Complété 15%")
      // "label+value" affiche la valeur brute (ex: "Complété 3")
      // "value" affiche juste le chiffre (ex: "3")
      textinfo: "label+value",
      // ------------------------

      textposition: "inside",
      automargin: true
    }];

    const layout = {
      autosize: true,
      height: 350,
      margin: { l: 20, r: 20, t: 20, b: 20 },
      paper_bgcolor: "rgba(0,0,0,0)",
      showlegend: true,
      legend: {
        orientation: "h",
        x: 0.5,
        xanchor: "center",
        y: -0.1
      }
    };

    const config = {
      responsive: true,
      displayModeBar: false
    };

    Plotly.newPlot('chart', data, layout, config);
  }
}
