document.addEventListener('DOMContentLoaded', function () {
    const cards = document.querySelectorAll('.card');
    const images = document.querySelectorAll('.picpage .picture');
    const prevButton = document.querySelector('.sab1'); // 왼쪽 화살표 버튼
    const nextButton = document.querySelector('.sab2'); // 오른쪽 화살표 버튼
    const closeBtns = document.querySelectorAll('.close-btn');
    const pbclicks = document.querySelectorAll('.pbclick');
    const commentBtn = document.querySelector('#comment');
    const commentImg = commentBtn ? commentBtn.querySelector('img') : null;
    const comments = document.querySelector('.pbclick .diary .hdiary .comments');
    const plus = document.querySelector('.pbclick .diary .hdiary .plus');
    const hdiaryElements = document.querySelectorAll('.pbclick .diary .hdiary .default');

    let currentIndex = 0; // 현재 이미지 인덱스
    let isCommentOpen = false; // 댓글 열림 상태

    // 다이어리 열기/닫기 함수
    function toggleDiary(pbclick, open = true) {
        if (!pbclick) return;
        pbclick.style.display = open ? 'flex' : 'none';
        if (open) {
            currentIndex = 0;  // 첫 번째 이미지부터 시작
            showImage(currentIndex);
            resetComments();
        }
    }

    // 이미지 표시 함수
    function showImage(index) {
        images.forEach((img, i) => {
            img.style.display = (i === index) ? 'block' : 'none'; // 현재 이미지만 보이게
        });
    }

    // 댓글 상태 초기화 함수
    function resetComments() {
        if (commentImg) commentImg.src = '/static/images/comment.png'; // 기본 아이콘
        if (comments) comments.style.display = 'none';
        if (plus) plus.style.display = 'none';
        hdiaryElements.forEach(el => el.style.display = 'block');
        isCommentOpen = false;
    }

    // 댓글 토글 함수
    function toggleComments() {
        if (!commentBtn || !commentImg) return;
        isCommentOpen = !isCommentOpen;
        commentImg.src = isCommentOpen 
            ? '/static/images/commentc.png' 
            : '/static/images/comment.png';
        if (comments) comments.style.display = isCommentOpen ? 'flex' : 'none';
        if (plus) plus.style.display = isCommentOpen ? 'flex' : 'none';
        hdiaryElements.forEach(el => {
            el.style.display = isCommentOpen ? 'none' : 'block';
        });
    }

    // 다이어리 카드 클릭 이벤트
    cards.forEach(card => {
        card.addEventListener('click', function () {
            const pbclick = card.nextElementSibling;
            if (pbclick && pbclick.classList.contains('pbclick')) {
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
            if (currentIndex > 0) {
                currentIndex -= 1; // 이전 이미지로 이동
                showImage(currentIndex);
            }
        });
    }

    // 다음 이미지 버튼 클릭 이벤트
    if (nextButton) {
        nextButton.addEventListener('click', function (e) {
            e.stopPropagation();

            // 현재 이미지가 마지막 이미지라면 더 이상 넘어가지 않도록
            const currentImagePrefix = images[currentIndex].getAttribute('data-prefix'); // 현재 이미지의 "앞에 숫자"

            // 해당 "prefix"에 해당하는 모든 이미지 중에서 마지막 이미지를 찾음
            const samePrefixImages = Array.from(images).filter(img => {
                return img.getAttribute('data-prefix') === currentImagePrefix;
            });

            // 마지막 이미지를 찾았다면, 그 이미지를 고정
            const lastImage = samePrefixImages[samePrefixImages.length - 1];

            if (images[currentIndex] === lastImage) {
                // 마지막 이미지일 경우 더 이상 오른쪽으로 넘어가지 않음
                return;
            }

            // 현재 사진이 마지막 사진이 아니라면, 다음 이미지로 이동
            if (currentIndex < images.length - 1) {
                currentIndex += 1;
                showImage(currentIndex);
            }
        });
    }

    // 댓글 버튼 클릭 이벤트
    if (commentBtn) {
        commentBtn.addEventListener('click', toggleComments);
    }

    // 초기화 로직
    if (images.length === 1) {
        images[0].style.display = 'block'; // 이미지가 하나만 있으면 항상 표시
        if (prevButton) prevButton.style.display = 'none'; // 왼쪽 버튼 숨기기
        if (nextButton) nextButton.style.display = 'none'; // 오른쪽 버튼 숨기기
    } else {
        showImage(currentIndex); // 첫 번째 이미지 표시
        if (prevButton) prevButton.style.display = 'block'; // 왼쪽 버튼 보이기
        if (nextButton) nextButton.style.display = 'block'; // 오른쪽 버튼 보이기
    }
});
