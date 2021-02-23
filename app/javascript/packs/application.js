// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

// import Rails from '@rails/ujs';
// import Turbolinks from 'turbolinks';
// import * as ActiveStorage from '@rails/activestorage';
// import 'channels';
require('@rails/ujs').start();
require('turbolinks').start();
require('@rails/activestorage').start();
require('channels');

var jQuery = require('jquery');
global.$ = global.jQuery = jQuery;
window.$ = window.jQuery = jQuery;

require('bootstrap');
require('admin-lte');
require('../lib/flash.js');
import '@fortawesome/fontawesome-free/css/all';

Rails.start();
Turbolinks.start();
ActiveStorage.start();
