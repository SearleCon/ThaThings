// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require_tree .
$(document).ready(function() {
    $('#myCarousel').carousel({ interval: 2000 })
//  $("a").tooltip(); // this will trigger a tooltip on all <a> elements
    $("[rel=tooltip]").tooltip(); // this will trigger a tooltip on all that have rel="tooltip" elements
    $("[rel=popover]").popover('hide') // this will trigger a POPOVER on all that have rel="popover" elements
    $('.nav-tabs').button()
    $(".collapse").collapse()
    $('.typeahead').typeahead()

    $('[id="15"]').button('toggle');    // sets the toggle button with id=15 (change to the current default) on _show_types.html.erb to on

//    $('.btn-group').find('.btn').bind('click',function(event){
//        if($(this).attr('id')==='optionsRadios1'){
//            alert($(this).attr('id'));
//        } else {
//            alert($(this).attr('id'));
//        }
//    });
    $('div.btn-group button').click(function(){
        $("#type_ID").attr('value', $(this).attr('id'));
    })
});