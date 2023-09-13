// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

$(document).ready(function() {
    $('#burger-button').click(function() {
      // Redirect to the categories view
      window.location.href = '<%= categories_path %>';
      // or use the transactions view
      window.location.href = '<%= transactions_path %>';
    });
  });