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
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
var ready;

ready = function() {
	$('.competitor-button').on('click', function(){
		$('#add-competitor').modal('show'); 
	});

	$('.upcoming-rings').hide();

	$('#upcoming-tab').on('click', function(e){
		e.preventDefault();
		$(this).addClass('active');
		$(this).siblings().removeClass('active');
		$('.upcoming-rings').show();
		$('.upcoming-rings').siblings().hide();
	});

	$('#active-tab').on('click', function(e){
		e.preventDefault();
		$(this).addClass('active');
		$(this).siblings().removeClass('active');
		$('.active-rings').show();
		$('.active-rings').siblings().hide();
	});

};

$(document).ready(ready);
$(document).on('page:load', ready);


