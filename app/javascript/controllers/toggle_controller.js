import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle"
export default class extends Controller {
  static targets = [ "visits", "experiences", "reviews" ];
  connect() {
    console.log("connected");
    this.hideAll()
  }

  showVisits() {
    this.hideAll()
    this.visitsTarget.classList.remove("hidden")
    console.log("visits");
  }

  showExperiences() {
    this.hideAll()
    this.experiencesTarget.classList.remove("hidden")
    console.log(this.experiencesTarget);
  }

  showReviews() {
    this.hideAll()
    this.reviewsTarget.classList.remove("hidden")
    console.log(this.reviewsTarget);
  }

  hideAll() {
    this.visitsTarget.classList.add("hidden")
    this.experiencesTarget.classList.add("hidden")
    this.reviewsTarget.classList.add("hidden")
  }
};
