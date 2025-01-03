// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

import "trix"
import "@rails/actiontext"


document.addEventListener("turbo:load", () => {
  const searchInput = document.getElementById("query");
  const csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute('content');

  if (searchInput) {
    searchInput.addEventListener("input", (event) => {
      const query = event.target.value;

      if (query.length > 2) {
        fetch(`/products/search?query=${query}`, {
          headers: {
            Accept: "text/vnd.turbo-stream.html",
            "X-CSRF-Token": csrfToken,
          },
        })
          .then((response) => {
            if (!response.ok) {
              throw new Error("Network response was not ok");
            }
            return response.text();
          })
          .then((html) => {
            document.getElementById("search_results").innerHTML = html;
          })
          .catch((error) => {
            console.error("Error fetching search results:", error);
          });
      } else {
        // Clear search results when input is empty
        document.getElementById("search_results").innerHTML = "";
      }
    });
  }
});


