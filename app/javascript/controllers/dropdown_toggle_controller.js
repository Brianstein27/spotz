import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="dropdown-toggle"
export default class extends Controller {

  static targets = ["dropdown"]
  connect() {
    this.boundHandleOutsideClick = this.handleOutsideClick.bind(this);
    document.addEventListener("click", this.boundHandleOutsideClick);
  }

  disconnect() {
    // Clean up the event listener when the controller is disconnected
    document.removeEventListener("click", this.boundHandleOutsideClick);
  }

  handleOutsideClick(event) {
    if (
      this.dropdownTarget.classList.contains("hidden") || // If already hidden, do nothing
      this.element.contains(event.target) // If the click is inside the dropdown or button, do nothing
    ) {
      return;
    }

    // Hide the dropdown by adding the `hidden` class
    this.dropdownTarget.classList.add("hidden");
  }

  toggle() {
    this.dropdownTarget.classList.toggle("hidden");
  }

}
