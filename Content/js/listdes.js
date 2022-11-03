$("map[name=hmap8807]").mapoid();
function writeText(txt) {
    document.getElementById("Aarea").innerHTML = txt;
}
(function($)
{
	"use strict";
	
	
	$(window).on('load', function() {
		
		
		$('#filter-list input').on("click", function(){
			$('#filter-list input').removeClass('active');
			$(this).addClass('active');
		});
	});	
})($);
//function HienThiVung(index) {
//	$.ajax({

//		type: 'GET',
//		data: { mavung: index },
//		url: 'ListDesByArea',
//		success: function (result) {
//			$('#lisdesbyarea').html(result);
//		},
//		error: function (e) {
//			alert(e.responseText);
//		}
//	});
//}
//function HienThiDiaDanh() {
//	$.ajax({

//		type: 'GET',
//		data: { search: $('#location').val() },
//		url: 'ListDesByName',
//		success: function (result) {
//			$('#lisdesbyarea').html(result);
//		},
//		error: function (e) {
//			alert(e.responseText);
//		}
//	});
//}
function HienThiVung(index) {
	document.location.href = '/Destinations/Destination_mansory/?mavung=' + index;
}
function HienThiDiaDanh() {
	document.location.href = '/Destinations/Destination_mansory/?search=' + $('#location').val();
}

