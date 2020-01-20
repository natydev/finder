import "core-js/stable";
import "regenerator-runtime/runtime";
import 'bootstrap/dist/js/bootstrap';
import 'chosen-js';
import 'bootstrap4c-chosen/dist/css/component-chosen';
import 'cocoon-js';
import { library, dom } from '@fortawesome/fontawesome-svg-core';
import { fas } from '@fortawesome/free-solid-svg-icons';
import 'jquery/dist/jquery.slim'
import 'popper.js/dist/esm/popper'

require("@rails/ujs").start();
require("turbolinks").start();
require("@rails/activestorage").start();
require("bootstrap/dist/js/bootstrap");



// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name;, true)
import '../styles/application.scss';
import '@fortawesome/fontawesome-free/js/all';
// import '@fortawesome/fontawesome-free/js/all'
// 
// import $ from 'jquery'
// 
$(document).on("turbolinks:load", function () {


  $('.form-control-chosen').chosen();
  $('[data-toggle="tooltip"]').tooltip();

  var $fieldQuantity = $('#field_quantity');
  var $fieldFreeRatio = $('#field_free_ratio');
  var $fieldTags = $('#field_tags');

  // box form:
  var $freeRatio = $('#box_free_ratio');
  $freeRatio.css('--val', $freeRatio.val());
  $freeRatio.on('change', function() {
    $(this).css('--val', $(this).val());
  });

  if ($('#box_typology_cl').is(":checked")) {
    $fieldQuantity.hide();
    $fieldTags.hide();
  }
  if ($('#box_typology_st').is(":checked")) {
    $fieldFreeRatio.hide();
  }
  $('#box_typology_cl').on('click', function() {
    $fieldQuantity.hide();
    $fieldTags.hide();
    $fieldFreeRatio.show();
  });
  $('#box_typology_st').on('click', function() {
    $fieldQuantity.show();
    $fieldTags.show();
    $fieldFreeRatio.hide();
  });
})
