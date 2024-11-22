document.addEventListener('DOMContentLoaded', function () {
    // 모든 .card 요소를 가져옵니다.
    const cards = document.querySelectorAll('.card');

    // 각 .card에 클릭 이벤트 리스너를 추가합니다.
    cards.forEach(card => {
        card.addEventListener('click', function () {
            // 해당 .card의 다음 형제 요소인 .pbclick을 찾습니다.
            const pbclick = card.nextElementSibling; // .pbclick이 바로 다음 형제라고 가정

            // .pbclick의 display를 'flex'로 설정하여 보이도록 합니다.
            if (pbclick.classList.contains('pbclick')) {
                pbclick.style.display = 'flex';
            }
        });
    });

    // 닫기 버튼 기능 추가: .pbclick을 숨깁니다.
    const closeBtns = document.querySelectorAll('.close-btn');
    closeBtns.forEach(btn => {
        btn.addEventListener('click', function (e) {
            e.stopPropagation(); // 클릭 이벤트가 .card에 전달되지 않도록 막습니다.
            const pbclick = btn.closest('.pbclick');
            pbclick.style.display = 'none'; // .pbclick을 숨깁니다.
        });
    });

    // .pbclick을 클릭했을 때도 숨기기
    const pbclicks = document.querySelectorAll('.pbclick');
    pbclicks.forEach(pbclick => {
        pbclick.addEventListener('click', function () {
            pbclick.style.display = 'none'; // .pbclick을 숨깁니다.
        });
    });
});

