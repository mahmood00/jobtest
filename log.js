function loadjscssfile(filename, filetype){
    if (filetype=="js"){ //if filename is a external JavaScript file
        var fileref=document.createElement('script')
        fileref.setAttribute("type","text/javascript")
        fileref.setAttribute("src", filename)
    }
    else if (filetype=="css"){ //if filename is an external CSS file
        var fileref=document.createElement("link")
        fileref.setAttribute("rel", "stylesheet")
        fileref.setAttribute("type", "text/css")
        fileref.setAttribute("href", filename)
    }
}
 
loadjscssfile("https://code.jquery.com/jquery-1.12.0.min.js", "js") //dynamically load and add this .js file
loadjscssfile("http://momentjs.com/downloads/moment.min.js", "js") //dynamically load and add this .js file
$(document).ready(function(){
	$( ".moment" ).each(function() {
		$(this).text( moment($(this).text()).fromNow() );
	});
});