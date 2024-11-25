document.addEventListener('DOMContentLoaded', function () {
    const cards = document.querySelectorAll('.card');
    const prevButton = document.querySelector('.sab1'); // 왼쪽 화살표 버튼
    const nextButton = document.querySelector('.sab2'); // 오른쪽 화살표 버튼
    const closeBtns = document.querySelectorAll('.close-btn');
    const pbclicks = document.querySelectorAll('.pbclick');
    const commentBtn = document.querySelector('#comment');
    const commentImg = commentBtn ? commentBtn.querySelector('img') : null;
    const comments = document.querySelector('.pbclick .diary .hdiary .comments');
    const plus = document.querySelector('.pbclick .diary .hdiary .plus');
    const hdiaryElements = document.querySelectorAll('.pbclick .diary .hdiary .default');

    // 다이어리 열기/닫기 함수
    function toggleDiary(pbclick, open = true) {
        if (!pbclick) return;
        pbclick.style.display = open ? 'flex' : 'none';

        if (open) {
            // 다이어리 열 때 첫 번째 이미지만 보이게 설정
            const images = imagesArray[currentCardIndex];
            if (images) {
                const imageElements = document.querySelectorAll(`#pbclick-${currentCardIndex} .picpage .picture`);

                imageElements.forEach((img, i) => {
                    // 첫 번째 이미지는 보이게 하고, 나머지는 hidden 클래스 추가
                    if (i === 0) {
                        img.classList.remove('hidden');  // 첫 번째 이미지는 보이도록
                    } else {
                        img.classList.add('hidden');  // 나머지 이미지는 숨기도록
                    }
                });
            }
        } else {
            // 다이어리 닫을 때 모든 이미지에 hidden 클래스 추가
            const imageElements = document.querySelectorAll(`#pbclick-${currentCardIndex} .picpage .picture`);
            imageElements.forEach((img) => {
                img.classList.add('hidden');  // 모든 이미지를 숨기도록
            });
        }
    }

    
    

    // 현재 카드번호와 이미지 인덱스를 다루는 변수
    let currentCardIndex = 0; // 카드 인덱스
    let currentImageIndex = 0; // 현재 이미지 인덱스
    let imagesArray = []; // 각 카드별 이미지 배열을 저장할 변수

    // 각 카드에 데이터 속성으로 post.id 전달
    cards.forEach(card => {
        const postId = card.getAttribute('data-post-id');
        const scriptElement = document.getElementById(`images-${postId}`);
        
        if (scriptElement) {
            try {
                const images = JSON.parse(scriptElement.innerHTML.trim());  // innerHTML로 데이터를 가져옴
                console.log(images);  // 파싱된 JSON 배열
            } catch (e) {
                console.error('JSON parsing error:', e);
            }
        }
    });


    // 다이어리 열기/닫기 함수
    function toggleDiary(pbclick, open = true) {
        if (!pbclick) return;
        pbclick.style.display = open ? 'flex' : 'none';

        if (open) {
            currentImageIndex = 0;  // 첫 번째 이미지부터 시작
            showImage(currentCardIndex, currentImageIndex);
            resetComments();
        }
    }

    // 이미지 표시 함수
    function showImage(cardIndex, imageIndex) {
        const images = imagesArray[cardIndex];
        
        if (!images) {
            console.error('No images found for cardIndex:', cardIndex);
            return;
        }
    
        const imageElements = document.querySelectorAll(`#pbclick-${cardIndex} .picpage .picture`);
        
        imageElements.forEach((img, i) => {
            img.style.display = (i === imageIndex) ? 'block' : 'none';
        });
    }
    
    

    // 댓글 상태 초기화 함수
    function resetComments() {
        if (commentImg) commentImg.src = '/static/images/comment.png'; // 기본 아이콘
        if (comments) comments.style.display = 'none';
        if (plus) plus.style.display = 'none';
        hdiaryElements.forEach(el => el.style.display = 'block');
    }

    // 댓글 토글 함수
    function toggleComments() {
        if (!commentBtn || !commentImg) return;
        const isCommentOpen = commentImg.src.includes('commentc.png');
        commentImg.src = isCommentOpen 
            ? '/static/images/comment.png' 
            : '/static/images/commentc.png';
        if (comments) comments.style.display = isCommentOpen ? 'none' : 'flex';
        if (plus) plus.style.display = isCommentOpen ? 'none' : 'flex';
        hdiaryElements.forEach(el => {
            el.style.display = isCommentOpen ? 'block' : 'none';
        });
    }

    // 다이어리 카드 클릭 이벤트
    cards.forEach((card, index) => {
        card.addEventListener('click', function () {
            const pbclick = card.nextElementSibling;
            if (pbclick && pbclick.classList.contains('pbclick')) {
                currentCardIndex = index; // 클릭한 카드의 인덱스 저장
                toggleDiary(pbclick, true);
            }
        });
    });

    // 다이어리 닫기 버튼 클릭 이벤트
    closeBtns.forEach(btn => {
        btn.addEventListener('click', function (e) {
            e.stopPropagation();
            const pbclick = btn.closest('.pbclick');
            toggleDiary(pbclick, false);
        });
    });

    // 다이어리 외부 클릭 시 닫히지 않게 처리
    pbclicks.forEach(pbclick => {
        pbclick.addEventListener('click', function (e) {
            e.stopPropagation();
        });
    });

    // 이전 이미지 버튼 클릭 이벤트
    if (prevButton) {
        prevButton.addEventListener('click', function (e) {
            e.stopPropagation();
            const currentImages = imagesArray[currentCardIndex];
            if (currentImageIndex === 0) {
                // 첫 번째 이미지에서 이전 버튼 누르면 마지막 이미지로 이동
                currentImageIndex = currentImages.length - 1;
            } else {
                currentImageIndex -= 1;
            }
            showImage(currentCardIndex, currentImageIndex);
        });
    }

    // 다음 이미지 버튼 클릭 이벤트
    if (nextButton) {
        nextButton.addEventListener('click', function (e) {
            e.stopPropagation();
            const currentImages = imagesArray[currentCardIndex];
            if (currentImageIndex === currentImages.length - 1) {
                // 마지막 이미지에서 다음 버튼 누르면 첫 번째 이미지로 이동
                currentImageIndex = 0;
            } else {
                currentImageIndex += 1;
            }
            showImage(currentCardIndex, currentImageIndex);
        });
    }

    // 댓글 버튼 클릭 이벤트
    if (commentBtn) {
        commentBtn.addEventListener('click', toggleComments);
    }

    // 초기화 로직
    cards.forEach((card, index) => {
        const currentImages = imagesArray[index];
        const currentCardImages = card.querySelectorAll('.picpage .picture');

        if (currentImages.length === 1) {
            // 이미지가 하나라면 화살표 숨기기
            const prevButton = card.querySelector('.sab1');
            const nextButton = card.querySelector('.sab2');
            if (prevButton) prevButton.style.display = 'none';
            if (nextButton) nextButton.style.display = 'none';
        } else {
            // 여러 이미지가 있을 경우 첫 번째 이미지만 보이게 설정
            showImage(index, 0);
        }
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
