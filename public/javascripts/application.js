jQuery(function ($) {
  function hide_flash(){
    $("#flash_message").fadeOut();
  }
  var no_flash = setTimeout(hide_flash, 4000);
});