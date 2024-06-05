import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="experience"
export default class extends Controller {
  static targets = ["review", "delete", "share", "options"];
  connect() { }

  toggleUser() {
    this.deleteTarget.classList.toggle("hidden");
    this.shareTarget.classList.toggle("hidden");
  }

  toggleVisitor() {
    this.reviewTarget.classList.toggle("hidden");
  }
}
