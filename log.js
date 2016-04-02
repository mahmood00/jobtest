
$(document).ready(function(){
	$( ".moment" ).each(function() {
		$(this).text( moment($(this).text()).fromNow() );
	});
});
