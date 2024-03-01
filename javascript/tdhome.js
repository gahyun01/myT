
$(document).ready(function(){
// 카드 왼쪽의 이미지 슬라이더 기능
	// 초기에는 이미지 중 첫 번째 이미지만 표시
	var currentImageIndex = 0;	
	var images = $('section .cardpage .card .imgslider .sliderimgs').find('img');
	// .imgslider 내부의 모든 이미지를 선택
	
	images.hide(); // 모든 이미지 숨김
	images.eq(0).show(); // 첫 이미지만 보여줌

	// 왼쪽 화살표 클릭 이벤트
	$('section .cardpage .card .imgslider .lt').click(function() {
		showPreviousImage();
	});	  
	// 오른쪽 화살표 클릭 이벤트
	$('section .cardpage .card .imgslider .gt').click(function() {
		showNextImage();
	});
	
	// 다음 이미지로 이동
	function showNextImage() {
		images.hide(); // 모든 이미지 숨김
		currentImageIndex = (currentImageIndex + 1) % images.length;
		images.eq(currentImageIndex).show(); // 다음 이미지 표시
	}
	// 이전 이미지로 이동
	function showPreviousImage() {
		images.hide(); // 모든 이미지 숨김
		currentImageIndex = (currentImageIndex - 1 + images.length) % images.length;
		images.eq(currentImageIndex).show(); // 이전 이미지 표시
	}

	//클릭시 하트, 북마크 색채우기
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

	//공유
	$('#share').click(function(){
		$('.share').show();
	});

	$('#sclose').click(function(){
		$('.share').hide();
	});

	//댓글 추가기능
	$('.btn').click(function(){
		
		var rpltext = $('.rpltext').val();

        // 댓글 생성
        var icon = $("<img>").attr("src", "img/dprofile.png").addClass("icon");
        var username = $("<a>").attr("href", "#").text("아이디");
        var rplcont = $("<div>").text(rpltext).addClass("rplcont");
        var hearticon = $("<img>").attr("src", "img/heart.png").addClass("smallicon");

        // 내용을 쌓아서 기존 html 구조와 같이 만들어주고
        var rplblock = $("<div>").addClass("rplblock").append(username, rplcont);
		var rpl = $("<div>").addClass("rpl").append(icon, rplblock, hearticon);

        // 새로운 댓글(rpl)를 rplbox에 추가
        $(".rplbox").append(rpl);

		// rpltext를 지워주고
		$(".rpltext").val('');
	});

	//댓글에 동적 추가된 하트 색 바꾸기
	$('.rplbox').on('click', '.rpl .smallicon', function() {
		var smiconbl = $(this).data('clicked');
		if (smiconbl == "false") {
			$(this).attr('src','img/heartc.png');
			$(this).data('clicked', 'true');
		} else {
			$(this).attr('src','img/heart.png');
			$(this).data('clicked', 'false');
		}
	});

	//클릭시 댓글하트 색채우기
	var smiconbl = "false";
	$('.smallicon').click(function(){
		if(smiconbl == "false"){
			$(this).attr('src','img/heartc.png');
			smiconbl = "true";
		} else {
			$(this).attr('src','img/heart.png');
			smiconbl = "false";
		}
	});

	$(".btn").click(function(){
		if($('.rplbox').children().length > 6){
			$('.rplbox').css('overflow-y', 'scroll');
		}
	});

});