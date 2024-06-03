import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle"
export default class extends Controller {
  static targets = [ "visits", "experiences", "reviews", "visitsHeader", "experiencesHeader", "reviewsHeader" ];
  connect() {
    console.log("connected");
    this.hideAll()
    this.uncolorAll()
  }

  showVisits() {
    this.hideAll()
    this.uncolorAll()
    this.visitsTarget.classList.remove("hidden")
    this.visitsHeaderTarget.classList.add("text-teal-400")
  }

  showExperiences() {
    this.hideAll()
    this.uncolorAll()
    this.experiencesTarget.classList.remove("hidden")
    this.experiencesHeaderTarget.classList.add("text-teal-400")
  }

  showReviews() {
    this.hideAll()
    this.uncolorAll()
    this.reviewsTarget.classList.remove("hidden")
    this.reviewsHeaderTarget.classList.add("text-teal-400")
  }

  hideAll() {
    this.visitsTarget.classList.add("hidden")
    this.experiencesTarget.classList.add("hidden")
    this.reviewsTarget.classList.add("hidden")
  }

  uncolorAll() {
    this.visitsHeaderTarget.classList.remove("text-teal-400")
    this.reviewsHeaderTarget.classList.remove("text-teal-400")
    this.experiencesHeaderTarget.classList.remove("text-teal-400")
  }
};
