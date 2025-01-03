import { Controller } from "@hotwired/stimulus";
export default class extends Controller {
  static targets = ["dropdown", "price"];
  
  updatePrice(event) {
  const selectedDropdowns = document.querySelectorAll(".variation-select");
  let selectedVariationId = null;
  let totalPrice = parseFloat(document.getElementById("product-price").dataset.basePrice);

  // Iterate through all dropdowns to find the selected option
  selectedDropdowns.forEach((dropdown) => {
    const selectedOption = dropdown.options[dropdown.selectedIndex];
    if (selectedOption.value) {
      selectedVariationId = selectedOption.value; // Capture the variation ID
      const price = parseFloat(selectedOption.dataset.price);
      if (!isNaN(price)) {
        totalPrice = price; // Use the variation-specific price
      }
    }
  });

  // Update the displayed price
  const priceDisplay = document.getElementById("product-price");
priceDisplay.textContent = `$${totalPrice.toFixed(2)}`;


  // Update the Add to Cart button's formaction
  const addButton = document.querySelector("[data-target='variation.addButton']");
  if (addButton) {
    const formAction = new URL(addButton.getAttribute("formaction"), window.location.origin);
    formAction.searchParams.set("product_variation_id", selectedVariationId || ""); // Update variation ID
    addButton.setAttribute("formaction", formAction.toString());
  }
}

}

