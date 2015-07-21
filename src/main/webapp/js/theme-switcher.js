$(function() {

	$('.gear-settings').click(function(e) {
		e.preventDefault();
		e.stopPropagation();
		$('.theme-switcher').toggleClass('show-switcher');

		$('#container').click(function() {
			if ($('.theme-switcher').hasClass('show-switcher')) {

				$('.theme-switcher').removeClass('show-switcher');

			}
		});

	});
	//
	// $('.fluid-layout').click(function(){
	// if($('body').hasClass('fixed-width')){
	// $('body').removeClass('fixed-width');
	//
	// }
	// });
	// $('.box-layout').click(function(){
	// $('body').addClass('fixed-width');
	//
	//
	// });

	$('.theme-color').click(function() {
		var stylesheet = $(this).attr('title').toLowerCase();
		$('#themes').attr('href', 'css' + '/' + '/' + stylesheet + '.css');
		localStorage.setItem("theme", "css/" + stylesheet + ".css");
	});

	if (localStorage.getItem("theme") != null)
		$("#themes").attr("href", localStorage.getItem("theme"));
	else 
		$("#themes").attr("href", localStorage.getItem("theme"));
});
