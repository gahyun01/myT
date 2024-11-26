document.addEventListener('DOMContentLoaded', function () {
    // Elements selection
    const cards = document.querySelectorAll('.card');
    const closeBtns = document.querySelectorAll('.close-btn');
    const pbclicks = document.querySelectorAll('.pbclick');
    const totalCards = $('.card').length; // 총 카드 개수
    let currentStartIndex = 0; // 현재 표시되는 첫 번째 카드 인덱스

    // 카드 슬라이드 관련
    function updateCardVisibility() {
        $('.card').each(function (index) {
            $(this).toggle(index >= currentStartIndex && index < currentStartIndex + 5);
        });
    }

    // 처음 페이지 로드시 카드 업데이트
    updateCardVisibility();

    // 'sab2' 버튼 클릭시 1칸 앞으로 이동
    $('.cardback .sab2').hover(
        () => $(this).css({ 'opacity': '1' }),
        () => $(this).css({ 'opacity': '0.5' })
    );

    $('.cardback .sab2').click(function () {
        currentStartIndex = (currentStartIndex + 1) % totalCards;
        updateCardVisibility();
    });

    // 'sab1' 버튼 클릭시 1칸 뒤로 이동
    $('.cardback .sab1').hover(
        () => $(this).css({ 'opacity': '1' }),
        () => $(this).css({ 'opacity': '0.5' })
    );

    $('.cardback .sab1').click(function () {
        currentStartIndex = (currentStartIndex - 1 + totalCards) % totalCards;
        updateCardVisibility();
    });

    // 자동 슬라이드 (3초마다 sab2 클릭)
    setInterval(function () {
        currentStartIndex = (currentStartIndex + 1) % totalCards;
        updateCardVisibility();
    }, 3000);

    // 카드 게시물 열기/닫기
    function toggleDiary(pbclick, open = true) {
        if (!pbclick) return;
        pbclick.style.display = open ? 'flex' : 'none';
        if (open) {
            currentImageIndex = 0;
            showImage(currentCardIndex, currentImageIndex);
            resetComments();
        } else {
            hideAllImages();
        }
    }

    // 카드 클릭 시 게시물 열기
    cards.forEach((card, index) => {
        card.addEventListener('click', function () {
            const pbclick = card.nextElementSibling;
            if (pbclick?.classList.contains('pbclick')) {
                currentCardIndex = index;
                toggleDiary(pbclick, true);
            }
        });
    });

    // 닫기 버튼 클릭 시 게시물 닫기
    closeBtns.forEach(btn => {
        btn.addEventListener('click', function (e) {
            e.stopPropagation();
            const pbclick = btn.closest('.pbclick');
            toggleDiary(pbclick, false);
        });
    });

    // 외부 클릭 시 닫히지 않게 처리
    pbclicks.forEach(pbclick => {
        pbclick.addEventListener('click', (e) => e.stopPropagation());
    });

    // 이미지 슬라이드
    const images = document.getElementById('carousel-inner').getAttribute('data-images').split(', ');
    let currentIndex = 0;
    const carouselInner = document.getElementById('carousel-inner');
    const prevBtn = document.getElementById('prev-btn');
    const nextBtn = document.getElementById('next-btn');

    // 슬라이드 이동
    function updateCarousel() {
        const imageWidth = 448;
        carouselInner.style.transition = 'transform 0.5s ease-in-out';
        carouselInner.style.transform = `translateX(${-imageWidth * currentIndex}px)`;
    }

    // 이전/다음 버튼 클릭 이벤트
    prevBtn.addEventListener('click', () => {
        currentIndex = (currentIndex - 1 + images.length) % images.length;
        updateCarousel();
    });
    nextBtn.addEventListener('click', () => {
        currentIndex = (currentIndex + 1) % images.length;
        updateCarousel();
    });

    // 페이지네이션 (플래너)
    const itemsPerPage = 9;
    const items = $('.pplanner .splanner');
    const totalItems = items.length;
    const totalPages = Math.ceil(totalItems / itemsPerPage);
    let currentPage = 1;

    // 표시할 아이템 업데이트
    function showItems() {
        const startIndex = (currentPage - 1) * itemsPerPage;
        const endIndex = startIndex + itemsPerPage;
        items.hide().slice(startIndex, endIndex).show();
    }

    // 페이지네이션 버튼 생성
    function generatePagination() {
        let paginationHtml = '';

        // << 버튼 (첫 페이지가 아닐 때만)
        if (totalPages > 10 && currentPage > 1) {
            paginationHtml += `<a href="#" data-page="1" class="double-left">&lt;&lt;</a>`;
        }

        // < 버튼 (첫 페이지가 아닐 때만) - 첫 페이지일 때는 링크 비활성화
        if (currentPage > 1) {
            paginationHtml += `<a href="#" data-page="${currentPage - 1}" class="left">&lt;</a>`;
        } else {
            paginationHtml += `<a href="#" class="left disabled">&lt;</a>`; // 첫 페이지에서 비활성화 처리
        }

        // 숫자 버튼
        for (let i = 1; i <= totalPages; i++) {
            paginationHtml += `<a href="#" data-page="${i}" class="${i === currentPage ? 'active page-number' : 'page-number'}">${i}</a>`;
        }

        // > 버튼 (마지막 페이지가 아닐 때만)
        if (currentPage < totalPages) {
            paginationHtml += `<a href="#" data-page="${currentPage + 1}" class="right">&gt;</a>`;
        } else {
            paginationHtml += `<a href="#" class="right disabled">&gt;</a>`; // 마지막 페이지에서 비활성화 처리
        }

        // >> 버튼 (마지막 페이지가 아닐 때만)
        if (totalPages > 10 && currentPage < totalPages) {
            paginationHtml += `<a href="#" data-page="${totalPages}" class="double-right">&gt;&gt;</a>`;
        }

        $('.pplanner .pagination').html(paginationHtml);
    }

    // 페이지네이션 업데이트
    function updatePagination() {
        $('.pplanner .pagination a').removeClass('active');
        $('.pplanner .pagination a[data-page="' + currentPage + '"]').addClass('active');
    }

    // 페이지네이션 버튼 클릭 이벤트
    $('.pplanner .pagination').on('click', 'a.page-number', function (e) {
        e.preventDefault();
        currentPage = parseInt($(this).data('page'));
        showItems();
        updatePagination();
        scrollToTop();
    });

    // 네비게이션 버튼 클릭 이벤트 (<<, <, >, >>)
    $('.pplanner .pagination').on('click', 'a.double-left, a.left, a.right, a.double-right', function (e) {
        e.preventDefault();
        const direction = $(this).hasClass('left') ? -1 : $(this).hasClass('right') ? 1 : 0;
        currentPage = (currentPage + direction + totalPages - 1) % totalPages + 1;
        showItems();
        updatePagination();
        scrollToTop();
    });

    // 페이지 변경 시 스크롤을 최상단으로
    function scrollToTop() {
        $('html, body').animate({ scrollTop: $('.mainp').offset().top }, 'slow');
    }

    // 초기화
    showItems();
    generatePagination();
});
