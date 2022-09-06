import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="edit-book"
export default class extends Controller {
  static targets = ["form", "card", "infos"]
  connect() {
    console.log(this.formTarget.action);
  }

  displayForm() {
    this.infosTarget.classList.add("d-none");
    this.formTarget.classList.remove("d-none");
  }

  update(event) {
    event.preventDefault();
    const url = this.formTarget.action;
    const options = {
      method: "PATCH",
      headers: {"Accept": "text/plain"},
      body: new FormData(this.formTarget)
    }
    fetch(url, options)
    .then(response => response.text())
    .then((data) => {
      this.cardTarget.outerHTML = data;
    })
  }
}
