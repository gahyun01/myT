$(document).ready(function () {
  // myT planner Best top 10


  // 화살표 버튼 투명도 조절
  $('.cardback .sab1').mouseenter(function () {
    $('.cardback .sab1').css({ 'opacity': '1' });
  });
  $('.cardback .sab1').mouseleave(function () {
    $('.cardback .sab1').css({ 'opacity': '0.5' });
  });

  $('.cardback .sab2').mouseenter(function () {
    $('.cardback .sab2').css({ 'opacity': '1' });
  });
  $('.cardback .sab2').mouseleave(function () {
    $('.cardback .sab2').css({ 'opacity': '0.5' });
  });

  // 화살표 버튼 클릭시 카드 슬라이드
// 카드 컨테이너와 카드 요소들을 변수에 저장
const cardsContainer = $('.cardpage');
const cards = cardsContainer.find('.card');
const totalCards = cards.length; // 전체 카드의 개수
let currentIndex = 0; // 현재 보이는 카드의 인덱스
let autoSlideTimer; // 자동 슬라이드 타이머 변수

// 카드를 보여주는 함수
function showCards() {
  cardsContainer.empty(); // 컨테이너 초기화
  for (let i = 0; i < 5; i++) {
    const index = (currentIndex + i) % totalCards;
    cardsContainer.append(cards.eq(index).clone()); // 5개의 카드만 보이도록 복사하여 추가
  }
}

// 다음 카드로 이동하는 함수
function nextCard() {
  currentIndex = (currentIndex + 1) % totalCards;
  showCards();
}

// 이전 카드로 이동하는 함수
function prevCard() {
  currentIndex = (currentIndex - 1 + totalCards) % totalCards;
  showCards();
}

// 화살표 클릭 시 이전 카드로 이동
$('.cardback .sab1').click(function () {
  stopAutoSlide(); // 화살표 클릭 시 자동 슬라이드 멈춤
  prevCard();
  startAutoSlide(); // 일정 시간 후 다시 자동 슬라이드 시작
});

// 화살표 클릭 시 다음 카드로 이동
$('.cardback .sab2').click(function () {
  stopAutoSlide();
  nextCard();
  startAutoSlide();
});

// 자동으로 슬라이드되는 함수
function autoSlide() {
  nextCard();
  autoSlideTimer = setTimeout(autoSlide, 2000); // 3초마다 자동 슬라이드
}

// 최초 로딩 시 한 번은 자동으로 슬라이드 시작
function startAutoSlide() {
  autoSlideTimer = setTimeout(autoSlide, 2000);
}

// 자동 슬라이드를 멈추는 함수
function stopAutoSlide() {
  clearTimeout(autoSlideTimer);
}

// 최초 한 번은 자동으로 슬라이드 시작
showCards();
startAutoSlide();




  // myT planner Best top 10카드 게시물

  // 클릭 이벤트를 추가할 각 카드 선택
  $('.card').click(function () {
    // 현재 클릭한 카드의 순번 가져오기
    const cardIndex = $(this).index();

    // body 요소에 스크롤 비활성화 클래스 추가
    $('body').addClass('no-scroll');

    // 모든 .pbclick와 .diary 감추기
    $('.pbclick, .diary').hide();

    // 해당 순번에 맞는 .diary 선택
    const diaryToShow = $('.diary').eq(cardIndex);

    // .diary를 보여주기
    diaryToShow.show();

    // .pbclick를 보여주기
    $('.pbclick').show();

      // pbclick와 diary를 고정된 위치에 유지
      $('.pbclick, .diary').css({
        'position': 'fixed',
        'top': '55.3%',
        'left': '50%',
        'transform': 'translate(-50%, -50%)',
      });
  });

  // .pbclick 닫기 버튼 클릭 이벤트
  $('.pbclick .close-btn').click(function() {
    // .pbclick와 .diary 모두 감추기
    $('.pbclick, .diary').hide();
  });


  // sab2에 hover 이벤트를 추가
  $('.pbclick .diary .hdiary .picpage .sab2').hover(
    function() {
      // hover 시작 시 picture img의 opacity를 0.5로 설정
      $('.pbclick .diary .hdiary .picpage .picture .main').css('opacity', '0.8');
      $('.pbclick .diary .hdiary .picpage .picture .profile').css('opacity', '1');
      $('.pbclick .diary .hdiary .picpage .picture .text').css('opacity', '1');
    },
    function() {
      // hover 종료 시 picture img의 opacity를 초기값으로 설정
      $('.pbclick .diary .hdiary .picpage .picture .main').css('opacity', '');
      $('.pbclick .diary .hdiary .picpage .picture .profile').css('opacity', '');
      $('.pbclick .diary .hdiary .picpage .picture .text').css('opacity', '');
    }
  );

  $(document).ready(function() {
    // 초기에는 .main 이미지 중 첫 번째 이미지만 표시
    $('.pbclick .diary .hdiary .picpage .picture .main').hide();
    $('.pbclick .diary .hdiary .picpage .picture .main:first').show();
  
    // 현재 보이는 이미지의 인덱스
    var currentImageIndex = 0;
  
    // 카드를 클릭했을 때
    $('.card').click(function() {
      // 현재 클릭한 카드의 순번 가져오기
      const cardIndex = $(this).index();
  
      // body 요소에 스크롤 비활성화 클래스 추가
      $('body').addClass('no-scroll');
  
      // 모든 .pbclick와 .diary 감추기
      $('.pbclick, .diary').hide();
  
      // 해당 순번에 맞는 .diary 선택
      const diaryToShow = $('.diary').eq(cardIndex);
  
      // .diary를 보여주기
      diaryToShow.show();
  
      // .pbclick를 보여주기
      $('.pbclick').show();
  
      // pbclick와 diary를 고정된 위치에 유지
      $('.pbclick, .diary').css({
        'position': 'fixed',
        'top': '55.3%',
        'left': '50%',
        'transform': 'translate(-50%, -50%)',
      });
    });
  
    // 왼쪽 화살표 클릭 이벤트
    $('.pbclick .diary .hdiary .picpage .sab1').click(function() {
      showPreviousImage();
    });
  
    // 오른쪽 화살표 클릭 이벤트
    $('.pbclick .diary .hdiary .picpage .sab2').click(function() {
      showNextImage();
    });
  
    // 다음 이미지로 이동하는 함수
    function showNextImage() {
      // 이미지 배열 가져오기
      var images = $('.pbclick .diary .hdiary .picpage .picture .main');
  
      // 현재 이미지 숨김
      images.hide();
  
      // 다음 이미지 인덱스 계산
      currentImageIndex = (currentImageIndex + 1) % images.length;
  
      // 다음 이미지 표시
      images.eq(currentImageIndex).show();
    }
  
    // 이전 이미지로 이동하는 함수
    function showPreviousImage() {
      // 이미지 배열 가져오기
      var images = $('.pbclick .diary .hdiary .picpage .picture .main');
  
      // 현재 이미지 숨김
      images.hide();
  
      // 이전 이미지 인덱스 계산
      currentImageIndex = (currentImageIndex - 1 + images.length) % images.length;
  
      // 이전 이미지 표시
      images.eq(currentImageIndex).show();
    }
  });

  var hState = 'false';
  $('body .pbclick .diary .hdiary .cicon #heart').click(function(){
    if(hState === 'false'){
      $(this).find('img').attr('src', 'img/heartc.png');
      hState = 'true';
    }
    else{
      $(this).find('img').attr('src', 'img/heart.png');
      hState = 'false';
    }
  });

  var sstate = 'false';
  $('body .pbclick .diary .hdiary .cicon #bookmark').click(function(){
    if(sstate === 'false'){
      $(this).find('img').attr('src', 'img/bookmarkc.png');
      sstate = 'true';
    }
    else{
      $(this).find('img').attr('src', 'img/bookmark.png');
      sstate = 'false';
    }
  });

  // 댓글 버튼 클릭 시 댓글창 보이기
  // 댓글 버튼 클릭 시 실행되는 함수
  $('body .pbclick .diary .hdiary .cicon #comment').click(function() {
    // #comment 속에 있는 img 태그의 속성 중 src 값을 가져옴
    var commentImg = $(this).find('img');

    // body .pbclick .diary .hdiary .nation, .title, .picpage 선택
    var hdiaryElements = $('.pbclick .diary .hdiary .default');

    // #comment의 이미지 경로가 'img/comment.png'인 경우
    if (commentImg.attr('src') === 'img/comment.png') {
      // #comment의 이미지를 'img/commentc.png'로 변경
      commentImg.attr('src', 'img/commentc.png');
      
      // body .pbclick .diary .hdiary .nation, .title, .picpage를 slideUp(애니메이션 효과 포함)로 숨김
      hdiaryElements.slideUp('slow', function() {
        // slideUp이 완료된 후에 실행되는 콜백 함수
        $('body .pbclick .diary .hdiary .comments').css('display', 'flex');
        $('body .pbclick .diary .hdiary .plus').css('display', 'flex');
      });
    } else {
      // #comment의 이미지를 'img/comment.png'로 변경
      commentImg.attr('src', 'img/comment.png');

      // body .pbclick .diary .hdiary .nation, .title, .picpage를 slideDown(애니메이션 효과 포함)으로 보임
      $('body .pbclick .diary .hdiary .comments').css('display', 'none');
      $('body .pbclick .diary .hdiary .plus').css('display', 'none');
      hdiaryElements.slideDown('slow');
    }
  });

  // .combox에 입력이 발생할 때 이벤트를 감지
  $('.combox').on('input', function() {
    // 입력된 텍스트 가져오기
    var commentText = $(this).val();

    // 이미지 엘리먼트 선택
    var uploadImg = $('.pbclick .diary .hdiary .plus .pluscom img');

    // 입력된 텍스트가 비어있지 않으면
    if (commentText.trim() !== '') {
      // 이미지를 "img/upload.png"로 변경
      uploadImg.attr('src', 'img/upload.png');
    } else {
      // 입력된 텍스트가 비어있으면 이미지를 초기 상태로 변경 (예: "img/default.png")
      uploadImg.attr('src', 'img/gif.png');
    }
  });

  // 게시물 오른쪽
    // 화살표 버튼 투명도 조절
    $('body .pbclick .diary .tsab1').mouseenter(function () {
      $('body .pbclick .diary .tsab1').css({ 'opacity': '1' });
    });
    $('body .pbclick .diary .tsab1').mouseleave(function () {
      $('body .pbclick .diary .tsab1').css({ 'opacity': '0.5' });
    });
  
    $('body .pbclick .diary .tsab2').mouseenter(function () {
      $('body .pbclick .diary .tsab2').css({ 'opacity': '1' });
    });
    $('body .pbclick .diary .tsab2').mouseleave(function () {
      $('body .pbclick .diary .tsab2').css({ 'opacity': '0.5' });
    });







  // 메인 페이지
  // 플래너 페이지네이션 ( 페이징 )
  const itemsPerPage = 9;
  const items = $('.pplanner .splanner');
  const totalItems = items.length;
  const totalPages = Math.ceil(totalItems / itemsPerPage);
  let currentPage = 1;
  
  function showItems() {
    const startIndex = (currentPage - 1) * itemsPerPage;
    const endIndex = startIndex + itemsPerPage;
  
    items.hide().slice(startIndex, endIndex).show();
  }
  
  function generatePagination() {
    let paginationHtml = '';
  
    // << 버튼
    if (totalPages > 10 && currentPage > 1) {
      paginationHtml += `<a href="#" data-page="1" class="double-left">&lt;&lt;</a>`;
    }
  
    // < 버튼
    if (currentPage > 1) {
      paginationHtml += `<a href="#" data-page="${currentPage - 1}" class="left">&lt;</a>`;
    } else {
      // 첫 번째 페이지일 때 < 누르면 마지막 페이지로 이동
      paginationHtml += `<a href="#" data-page="${totalPages}" class="left">&lt;</a>`;
    }
  
    // 숫자 버튼
    for (let i = 1; i <= totalPages; i++) {
      paginationHtml += `<a href="#" data-page="${i}" class="${i === currentPage ? 'active page-number' : 'page-number'}">${i}</a>`;
    }
  
    // > 버튼
    if (currentPage < totalPages) {
      paginationHtml += `<a href="#" data-page="${currentPage + 1}" class="right">&gt;</a>`;
    } else {
      // 마지막 페이지일 때 > 누르면 첫 번째 페이지로 이동
      paginationHtml += `<a href="#" data-page="1" class="right">&gt;</a>`;
    }
  
    // >> 버튼
    if (totalPages > 10 && currentPage < totalPages) {
      paginationHtml += `<a href="#" data-page="${totalPages}" class="double-right">&gt;&gt;</a>`;
    }
  
    $('.pplanner .pagination').html(paginationHtml);
  }
  
  function updatePagination() {
    $('.pplanner .pagination a').removeClass('active');
    $('.pplanner .pagination a[data-page="' + currentPage + '"]').addClass('active');
  }
  
  // 페이지 숫자를 나타내는 버튼 클릭 시
  $('.pplanner .pagination').on('click', 'a.page-number', function (e) {
    e.preventDefault();
    currentPage = parseInt($(this).data('page'));
    showItems();
    updatePagination();
    scrollToTop(); // 페이지 이동 후 상단으로 스크롤
  });
  
  // << 버튼 클릭 시
  $('.pplanner .pagination').on('click', 'a.double-left', function (e) {
    e.preventDefault();
    currentPage = 1;
    showItems();
    updatePagination();
    scrollToTop();
  });
  
  // < 버튼 클릭 시
  $('.pplanner .pagination').on('click', 'a.left', function (e) {
    e.preventDefault();
    if (currentPage > 1) {
      currentPage--;
    } else {
      currentPage = totalPages;
    }
    showItems();
    updatePagination();
    scrollToTop();
  });
  
  // > 버튼 클릭 시
  $('.pplanner .pagination').on('click', 'a.right', function (e) {
    e.preventDefault();
    if (currentPage < totalPages) {
      currentPage++;
    } else {
      currentPage = 1;
    }
    showItems();
    updatePagination();
    scrollToTop();
  });
  
  // >> 버튼 클릭 시
  $('.pplanner .pagination').on('click', 'a.double-right', function (e) {
    e.preventDefault();
    currentPage = totalPages;
    showItems();
    updatePagination();
    scrollToTop();
  });
  
  function scrollToTop() {
    $('html, body').animate({ scrollTop: $('.mainp').offset().top }, 'slow');
  }
  
  showItems();
  generatePagination();
  
});
  

  // 카드 반짝임 효과
  // $('.cardpage').on('mouseenter', '.card', function () {
  //   $(this).addClass('card-highlight');
  // }).on('mouseleave', '.card', function () {
  //   $(this).removeClass('card-highlight');
  // });