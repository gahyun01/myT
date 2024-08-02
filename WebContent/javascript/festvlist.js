$(document).ready(function(){
    $(".card").on('mouseenter', '.festvcard .title', function(){
    	$(this).closest('.festvcard').css({
        	'box-shadow': '0px 0px 4px gray',
        	'border-radius': '10px',
     		'z-index': '1',
     		'transform': 'scale(1.02)'
        });
    	$(this).siblings('.detail').css({
	    	'display': '-webkit-box',
	    	'-webkit-box-orient': 'vertical',
	    	'-webkit-line-clamp': '2',
	    	'overflow': 'hidden',
	    	'color': 'gray',
	    	'z-index': '1',
    	});
    	$(this).closest('.title').css({
    		'border-radius': '10px 10px 0 0',
    	});
    }).on('mouseleave', '.festvcard .title', function(){
        $(this).closest('.festvcard').removeAttr('style');
        $('.festvcard .detail').removeAttr('style');
        $('.festvcard .title').removeAttr('style');
    });
});

