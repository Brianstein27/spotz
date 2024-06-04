import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="item-toggle"
export default class extends Controller {
  static targets = ["item1", "item2", "item1Header", "item2Header"];
  connect() {
    console.log("connected");
    this.showItem1()
  }

  showItem1() {
    this.hideAll()
    this.uncolorAll()
    this.item1Target.classList.remove("hidden")
    this.item1HeaderTarget.classList.add("text-teal-400")
  }

  showItem2() {
    this.hideAll()
    this.uncolorAll()
    this.item2Target.classList.remove("hidden")
    this.item2HeaderTarget.classList.add("text-teal-400")
  }

  // showItem3() {
  //   this.hideAll()
  //   this.uncolorAll()
  //   this.item3Target.classList.remove("hidden")
  //   this.item3HeaderTarget.classList.add("text-teal-400")
  // }

  hideAll() {
    this.item1Target.classList.add("hidden")
    this.item2Target.classList.add("hidden")
    // this.item3Target.classList.add("hidden")
  }

  uncolorAll() {
    this.item1HeaderTarget.classList.remove("text-teal-400")
    this.item2HeaderTarget.classList.remove("text-teal-400")
    // this.item3HeaderTarget.classList.remove("text-teal-400")
  }
};
