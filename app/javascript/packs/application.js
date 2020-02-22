import "core-js/stable";
import "regenerator-runtime/runtime";
import 'bootstrap/dist/js/bootstrap';
import 'chosen-js';
import { library, dom } from '@fortawesome/fontawesome-svg-core';
import { fas } from '@fortawesome/free-solid-svg-icons';
import 'jquery/dist/jquery.slim'
import 'popper.js/dist/esm/popper'
import 'bootstrap4c-chosen/dist/css/component-chosen';
import 'bootstrap-colorpicker/dist/js/bootstrap-colorpicker.min';
import 'bootstrap-datepicker/dist/js/bootstrap-datepicker.min';
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
$(function () {
  $('[data-toggle="tooltip"]').tooltip();
});

$(document).on("ready turbolinks:load", function () {
  $('#tag_color, #tag_background').colorpicker({
    format: 'hex'
  });
  $('#tag_color').on('colorpickerCreate colorpickerChange', function(event) {
    $('.example-color').css('color', event.color.toString());
  });
  $('#tag_background').on('colorpickerCreate colorpickerChange', function(event) {
    $('.example-background').css('background-color', event.color.toString());
  });

  if ($(".chosen-container").length == 0) {
    $('.form-control-chosen').chosen();
  } else {
    $('.form-control-chosen').chosen("destroy");
  }

  $('#box_issued_on_metric').datepicker({
    format: "dd/mm/yyyy",
    autoclose: true,
    language: $('html').lang
  });
  

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
});
