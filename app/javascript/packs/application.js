// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import 'bootstrap'
import '../stylesheets/application'
global.toastr = require("toastr")

Rails.start()
Turbolinks.start()
ActiveStorage.start()

global.toastr.options = {
  "closeButton": true,
  "debug": false,
  "newestOnTop": false,
  "progressBar": true,
  "positionClass": "toast-top-right",
  "preventDuplicates": true,
  "onclick": null,
  "showDuration": "300",
  "hideDuration": "1000",
  "timeOut": "3000",
  "extendedTimeOut": "1000",
  "showEasing": "swing",
  "hideEasing": "linear",
  "showMethod": "show",
  "hideMethod": "hide"
}

$(function () {
    $('#navbarSideCollapse').on('click', function () {
      $('.offcanvas-collapse').toggleClass('open')
    })
  })


require("trix")
require("@rails/actiontext")

$(document).ready(function() {
  if ($('.count-text-area').length) {
    $('#current').text($('.count-text-area').val().length);
    $('.count-text-area').keyup(function() {
      var characterCount = $(this).val().length;
      $('#current').text(characterCount);
    })
  }
})