import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle"
export default class extends Controller {
  static targets = ["tags"]

  toggle() {
    this.tagsTarget.classList.toggle("hidden")
  }

  connect() {
    console.log(this.tagsTarget)

  }
}
