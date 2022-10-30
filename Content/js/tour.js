(function($)
{
	"use strict";
	
	
	jQuery(window).on('load', function() {
		
		
		jQuery('#filter-list input').on("click", function(){
			jQuery('#filter-list input').removeClass('active');
			jQuery(this).addClass('active');
		});
	});	
})(jQuery);	

//function HienThiTour() {
//	$.ajax({
//		type: 'GET',
//		data: { place: $('#location').val(), day: $('#daynumber').val()},
//		url: 'TourByName_Day',
//		success: function (result) {
//			$('#tourbyname_day').html(result);
//		},
//		error: function (e) {
//			alert(e.responseText);
//		}
//	});
//}
function HienThiTour(value) {
	document.location.href = '/Tour/Index/?sortorder=' + value + '&place=' + $('#location').val() + '&day=' + $('#daynumber').val() + '&pricedown=' + $('#min_price').val() + '&priceup=' + $('#max_price').val();
}
function Sortby(value) {
	document.location.href = '/Tour/Index/?sortorder=' + value + '&place=' + $('#location').val() + '&day=' + $('#daynumber').val();
}
function CapnhatView(value) {
		$.ajax({
		type: 'POST',
		data: { matour: value},
		url: '/Tour/CapnhatView',
		success: function (result) {
			//alert('success');
		},
		error: function (e) {
			alert(e.responseText);
		}
	});
}
$(document).ready(function () {


	$("#min_price,#max_price").on('change', function () {



		var min_price_range = parseInt($("#min_price").val());

		var max_price_range = parseInt($("#max_price").val());

		if (min_price_range > max_price_range) {
			$('#max_price').val(min_price_range);
		}

		$("#slider-range").slider({
			values: [min_price_range, max_price_range]
		});

	});





	$(function () {
		var maxgia = parseInt($("#giacn").val())
		$("#slider-range").slider({
			range: true,
			orientation: "horizontal",
			
			min: 0,
			max: maxgia,
			values: [0, maxgia],
			step: 20,

			slide: function (event, ui) {
				if (ui.values[0] == ui.values[1]) {
					return false;
				}

				$("#min_price").val(ui.values[0]);
				$("#max_price").val(ui.values[1]);
			}
		});

		$("#min_price").val($("#slider-range").slider("values", 0));
		$("#max_price").val($("#slider-range").slider("values", 1));

	});

});