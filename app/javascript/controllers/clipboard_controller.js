import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="clipboard"
export default class extends Controller {
  static targets = ["source", "button"]

  copy() {
    navigator.clipboard.writeText(this.sourceText)
    this.buttonTarget.textContent = "Copied!"
    this.buttonTarget.classList.add("disabled")
  }

  get sourceText() {
    return this.sourceTarget.innerText
  }
}
