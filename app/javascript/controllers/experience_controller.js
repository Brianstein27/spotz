import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="experience"
export default class extends Controller {
  static targets = ["edit", "review", "delete", "share", "options"];
  connect() { }

  toggleUser() {
    this.editTarget.classList.toggle("hidden");
    this.deleteTarget.classList.toggle("hidden");
    this.shareTarget.classList.toggle("hidden");
  }

  toggleVisitor() {
    this.reviewTarget.classList.toggle("hidden");
  }
}
