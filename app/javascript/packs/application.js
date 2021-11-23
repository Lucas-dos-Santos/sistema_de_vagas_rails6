// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
var jQuery = require('jquery')
global.$ = global.jQuery = jQuery;
window.$ = window.jQuery = jQuery;
import "channels"
import 'bootstrap'
import '../stylesheets/application'
global.toastr = require("toastr")
import Swal from 'sweetalert2/dist/sweetalert2.js'
import 'sweetalert2/src/sweetalert2.scss'
window.Swal = Swal

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

require("trix")
require("@rails/actiontext")

$(document).on('ready turbolinks:load', function() {
  if ($('.count-text-area').length) {
    $('#current').text($('.count-text-area').val().length);
    $('.count-text-area').keyup(function() {
      var characterCount = $(this).val().length;
      $('#current').text(characterCount);
    })
  }

  $('#copy-url').on('click', function(e) {
    e.preventDefault();
    var url = $(this).attr('data-clipboard-text');
    navigator.clipboard.writeText(url);
    toastr.success('URL copiada com sucesso');
  })
})