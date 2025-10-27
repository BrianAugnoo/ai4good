import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="send-timer"
export default class extends Controller {
  connect() {
    const timer = document.querySelector(".timer").textContent;
    const token = document.querySelector("meta[name='csrf-token']").content;
    const group_id = document.querySelector("#timer-sender").dataset.groupId;

    fetch(`/groups/${group_id}`, {
      method: "PATCH",
      headers: {
        "Content-Type": "application/json",
        "X-CSRF-Token": token
      },
      body: JSON.stringify({
        group: { timer: timer }
      })
    });
  }
}
