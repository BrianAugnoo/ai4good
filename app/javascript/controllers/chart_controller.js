import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="chart"
export default class extends Controller {
  static targets = ["chart"]
  connect() {
    const chart = this.chartTarget
    const data = [{
      values: [parseInt(chart.dataset.remaining), parseInt(chart.dataset.complete)],
      labels: ["remaining group", "ratted group"],
      type: "pie"
    }];

    const layout = {
    height: 400,
    width: 500,
    paper_bgcolor: "#F1F5F9"
    };

    Plotly.newPlot('chart', data, layout);
  }
}
