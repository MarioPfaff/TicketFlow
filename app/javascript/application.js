// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
//= require popper
//= require bootstrap-sprockets
//= require activestorage
//= require jquery


import "@hotwired/turbo-rails"
import "controllers"
import 'bootstrap-icons/font/bootstrap-icons.css'



$(function () {
    $('[data-toggle="tooltip"]').tooltip()
  })