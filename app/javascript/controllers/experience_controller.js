import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="experience"
export default class extends Controller {
  static targets = ["edit", "delete", "options"]
  connect() {
  }

  toggle() {
    this.editTarget.classList.toggle("hidden")
    this.deleteTarget.classList.toggle("hidden")
  }
}
