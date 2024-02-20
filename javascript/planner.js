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
  const cardsContainer = $('.cardpage');
  const cards = cardsContainer.find('.card');
  const totalCards = cards.length;
  let currentIndex = 0;

  function showCards() {
    cardsContainer.empty();
    for (let i = 0; i < 5; i++) {
      const index = (currentIndex + i) % totalCards;
      cardsContainer.append(cards.eq(index).clone());
    }
  }

  $('.cardback .sab1').click(function () {
    currentIndex = (currentIndex - 1 + totalCards) % totalCards;
    showCards();
  });

  $('.cardback .sab2').click(function () {
    currentIndex = (currentIndex + 1) % totalCards;
    showCards();
  });

  showCards();



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