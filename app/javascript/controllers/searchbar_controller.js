import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="searchbar"
export default class extends Controller {
  static targets = ["text", "input"];

  connect() {
    console.log("searchbar connected");
  }

  show() {
    this.textTarget.classList.add("hidden");
    this.inputTarget.classList.remove("hidden");
  }
}
