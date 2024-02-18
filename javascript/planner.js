$(document).ready(function () {
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
  
    // 카드 반짝임 효과
    $('.cardpage').on('mouseenter', '.card', function () {
      $(this).addClass('card-highlight');
    }).on('mouseleave', '.card', function () {
      $(this).removeClass('card-highlight');
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
  });
  