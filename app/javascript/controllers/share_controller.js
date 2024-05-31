import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="share"
export default class extends Controller {
  connect() {
    console.log("hello from share");
    console.log(this.data.get("urlValue"));
  }
  async share(e) {
    e.preventDefault();
    const shareData = {
      url: this.data.get("urlValue"),
    };
    try {
      await navigator.share(shareData);
    } catch (error) {
      console.log(error);
    }
  }
}
