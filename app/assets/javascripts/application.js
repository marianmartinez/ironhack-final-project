// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery/jquery-2.1.1.js
//= require modernizr/modernizr
//= require bootstrap-sprockets
//= require validate/jquery.validate.min
//= require toastr
//= require metisMenu/jquery.metisMenu
//= require pace/pace.min
//= require peity/jquery.peity.min
//= require slimscroll/jquery.slimscroll.min
//= require datapicker/bootstrap-datepicker
//= require forms
//= require skillstep

$(function() {
  var date = new Date();
  $('#wizard-datepicker .input-group.date').datepicker({
      todayBtn: "linked",
      format: "dd/mm/yyyy",
      keyboardNavigation: false,
      forceParse: false,
      calendarWeeks: true,
      autoclose: true,
      startDate: date,
      todayHighlight: true
  });
 });

 $(document).ready(function() {
  toastr.options = {
    "closeButton": true,
    "debug": false,
    "progressBar": true,
    "positionClass": "toast-top-center",
    "onclick": null,
    "showDuration": "400",
    "hideDuration": "1000",
    "timeOut": "7000",
    "extendedTimeOut": "1000",
    "showEasing": "swing",
    "hideEasing": "linear",
    "showMethod": "fadeIn",
    "hideMethod": "fadeOut"
  };
});
