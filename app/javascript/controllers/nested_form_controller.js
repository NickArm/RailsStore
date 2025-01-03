import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["template", "container"];

  add(event) {
    event.preventDefault();

    const content = this.templateTarget.innerHTML.replace(
      /NEW_RECORD/g,
      new Date().getTime()
    );

    this.containerTarget.insertAdjacentHTML("beforeend", content);
  }

  remove(event) {
    event.preventDefault();

    const item = event.target.closest("[data-new-record]");
    if (item.dataset.newRecord === "true") {
      item.remove();
    } else {
      item.querySelector("input[name*='_destroy']").value = 1;
      item.style.display = "none";
    }
  }
}

