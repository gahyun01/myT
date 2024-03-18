
$(document).ready(function(){

	$('.makerpl .btn').click(function(){
		alert("Yeah");
	})

	var heartbl = "false";
	$('#heart').click(function(){
		if(heartbl == "true"){
			$('#heart').attr('src','img/heart.png');
			heartbl = "false";
		} else{
			$('#heart').attr('src','img/heartc.png');
			heartbl = "true";
		}
	});

	var bmarkbl = "false";
	$('#bmark').click(function(){
		if(bmarkbl == "true"){
			$('#bmark').attr('src','img/bookmark.png');
			bmarkbl = "false";
		} else{
			$('#bmark').attr('src','img/bookmarkc.png');
			bmarkbl = "true";
		}
	});

});