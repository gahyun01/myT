document.addEventListener('DOMContentLoaded', function () {
    // DOM 요소들 선택
    const cards = document.querySelectorAll('.card');  // 베스트 탑 10 카드 요소
    const pinfos = document.querySelectorAll('.pinfo');  // 카드 요소
    const closeBtns = document.querySelectorAll('.close-btn');  // 닫기 버튼
    const pbclicks = document.querySelectorAll('.pbclick');  // 게시물 팝업
    const totalCards = $('.card').length;  // 총 카드 개수
    let currentStartIndex = 0;  // 현재 표시되는 첫 번째 카드 인덱스

    // 카드 슬라이드 기능 업데이트
    function updateCardVisibility() {
        $('.card').each(function (index) {
            $(this).toggle(index >= currentStartIndex && index < currentStartIndex + 5);  // 5개씩 카드 보이게
        });
    }

    // 초기 카드 표시 업데이트
    updateCardVisibility();

    // 'sab2' 버튼 클릭 시 1칸 앞으로 이동
    $('.cardback .sab2').hover(
        () => $(this).css({ 'opacity': '1' }),
        () => $(this).css({ 'opacity': '0.5' })
    );

    // 'sab2' 클릭 이벤트: 1칸 앞으로 이동
    $('.cardback .sab2').click(function () {
        currentStartIndex = (currentStartIndex + 1) % totalCards;
        updateCardVisibility();
    });

    // 'sab1' 버튼 클릭 시 1칸 뒤로 이동
    $('.cardback .sab1').hover(
        () => $(this).css({ 'opacity': '1' }),
        () => $(this).css({ 'opacity': '0.5' })
    );

    // 'sab1' 클릭 이벤트: 1칸 뒤로 이동
    $('.cardback .sab1').click(function () {
        currentStartIndex = (currentStartIndex - 1 + totalCards) % totalCards;
        updateCardVisibility();
    });

    // 자동 슬라이드 (3초마다 sab2 클릭)
    setInterval(function () {
        currentStartIndex = (currentStartIndex + 1) % totalCards;
        updateCardVisibility();
    }, 3000);

    // 카드 클릭 시 게시물 열기/닫기
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

    // 카드 클릭 시 게시물 팝업 열기
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

    // 카드 클릭 시 게시물 열기/닫기
    function toggleDiary(pbclick, open = true) {
        if (!pbclick) return;
        pbclick.style.display = open ? 'flex' : 'none';
        if (open) {
            currentImageIndex = 0;
            showImage(currentCardIndex, currentImageIndex); // 현재 이미지를 보여주는 함수
            resetComments(); // 댓글을 초기화하는 함수
        } else {
            hideAllImages(); // 모든 이미지를 숨기는 함수
        }
    }

    // .pinfo 클릭 시 게시물 팝업 열기
    pinfos.forEach((pinfo, index) => {
        pinfo.addEventListener('click', function () {
            const pbclick = pinfo.nextElementSibling; // 바로 다음에 있는 .pbclick 요소 찾기
            if (pbclick?.classList.contains('pbclick')) {
                currentCardIndex = index; // 현재 카드의 인덱스 업데이트
                toggleDiary(pbclick, true); // 다이어리 열기
            }
        });
    });

    // 닫기 버튼 클릭 시 게시물 닫기
    closeBtns.forEach(btn => {
        btn.addEventListener('click', function (e) {
            e.stopPropagation(); // 클릭 이벤트가 부모 요소로 전파되지 않도록 차단
            const pbclick = btn.closest('.pbclick'); // 해당 닫기 버튼의 부모 .pbclick 요소 찾기
            toggleDiary(pbclick, false); // 다이어리 닫기
        });
    });

    // .pbclick 내부 클릭 시 닫히지 않게 처리
    pbclicks.forEach(pbclick => {
        pbclick.addEventListener('click', (e) => e.stopPropagation());
    });

    // 이미지 슬라이드 관련 설정
    const images = document.getElementById('carousel-inner').getAttribute('data-images').split(', ');  // 이미지 목록
    let currentIndex = 0;
    const carouselInner = document.getElementById('carousel-inner');
    const prevBtn = document.getElementById('prev-btn');
    const nextBtn = document.getElementById('next-btn');

    // 이미지들 추가하기 (클론 없이)
    function createCarouselItems() {
        images.forEach((image, index) => {
            const imgElement = document.createElement('img');
            imgElement.src = image;
            imgElement.classList.add('carousel-item');  // 클래스 추가
            carouselInner.appendChild(imgElement);
        });

        // 첫 번째 이미지를 마지막에 클론으로 추가하여 무한 루프처럼 보이게 함
        const firstImageClone = carouselInner.firstElementChild.cloneNode(true);
        carouselInner.appendChild(firstImageClone);
    }

    // 슬라이드 이동
    function updateCarousel() {
        const imageWidth = 448;  // 각 이미지의 너비
        carouselInner.style.transition = 'transform 0.5s ease-in-out';
        carouselInner.style.transform = `translateX(${-imageWidth * currentIndex}px)`;
    }

    // 이전/다음 버튼 클릭 시 이미지 이동
    prevBtn.addEventListener('click', () => {
        if (currentIndex === 0) {
            currentIndex = images.length - 1;
            updateCarousel();
            setTimeout(() => {
                carouselInner.style.transition = 'none';
                carouselInner.style.transform = `translateX(${-imageWidth * currentIndex}px)`;
            }, 500);
        } else {
            currentIndex--;
            updateCarousel();
        }
    });

    nextBtn.addEventListener('click', () => {
        if (currentIndex === images.length) {
            currentIndex = 0;
            setTimeout(() => {
                carouselInner.style.transition = 'none';
                carouselInner.style.transform = `translateX(0)`;
            }, 500);
            setTimeout(() => {
                carouselInner.style.transition = 'transform 0.5s ease-in-out';
            }, 600);
        } else {
            currentIndex++;
            updateCarousel();
        }
    });

    // 초기화 함수 호출
    createCarouselItems();
    updateCarousel();




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

        if (totalPages > 10 && currentPage > 1) {
            paginationHtml += `<a href="#" data-page="1" class="double-left">&lt;&lt;</a>`;
        }

        if (currentPage > 1) {
            paginationHtml += `<a href="#" data-page="${currentPage - 1}" class="left">&lt;</a>`;
        } else {
            paginationHtml += `<a href="#" class="left disabled">&lt;</a>`;
        }

        for (let i = 1; i <= totalPages; i++) {
            paginationHtml += `<a href="#" data-page="${i}" class="${i === currentPage ? 'active page-number' : 'page-number'}">${i}</a>`;
        }

        if (currentPage < totalPages) {
            paginationHtml += `<a href="#" data-page="${currentPage + 1}" class="right">&gt;</a>`;
        } else {
            paginationHtml += `<a href="#" class="right disabled">&gt;</a>`;
        }

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
  