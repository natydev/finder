import "core-js/stable";
import "regenerator-runtime/runtime";
import 'bootstrap/dist/js/bootstrap';
import { library, dom } from '@fortawesome/fontawesome-svg-core'
import { fas } from '@fortawesome/free-solid-svg-icons'

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("bootstrap/dist/js/bootstrap")



// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
import './src/application.scss'
import '@fortawesome/fontawesome-free/js/all'
// import '@fortawesome/fontawesome-free/js/all'
// 
// import $ from 'jquery'
// 
// $(document).ready(function () {
//   // insert here some init
// })
