// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
//= require popper
//= require bootstrap-sprockets
//= require activestorage

import "@hotwired/turbo-rails"
import "controllers"

$(function () {
    $('[data-toggle="tooltip"]').tooltip()
  })