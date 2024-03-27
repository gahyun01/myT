$(document).ready(function() {
    // 글쓰기 버튼
    $('form .qna .tplus .btn').click(function() {
        if($('#hidden_id').val() == "") {
            alert('로그인이 필요합니다.');
            return;
        }
        else{
            $('form .qna').css('display', 'none');
            $('form .qna-write').css('display', 'block');
        }
    });

  // 페이지네이션을 위한 변수 선언
    var itemsPerPage = 10; // 한 페이지당 보여질 항목 수
    var $bulletins = $('.qnapage .bulletin'); // 모든 bulletin 요소 선택
    var totalItems = $bulletins.length; // 전체 항목 수
    var totalPages = Math.ceil(totalItems / itemsPerPage); // 전체 페이지 수
    var currentPage = 1; // 현재 페이지 번호

    // 페이지 번호를 표시할 요소 선택
    var $pagination = $('.paging .pagination');

    // 페이지 번호 생성 및 초기화
    function generatePagination() {
        $pagination.empty(); // 기존 페이지 번호 삭제

        // 페이지 번호 버튼 생성
        for (var i = 1; i <= totalPages; i++) {
            var $pageBtn = $('<a href="#" class="page-number">' + i + '</a>');
            $pagination.append($pageBtn);
        }

        // 현재 페이지에 active 클래스 추가
        $pagination.find('.page-number').eq(currentPage - 1).addClass('active');
    }

    // 페이지네이션 이벤트 핸들러
    $pagination.on('click', 'a.page-number', function(e) {
        e.preventDefault();
        currentPage = parseInt($(this).text()); // 클릭한 페이지로 현재 페이지 번호 업데이트
        showPage(); // 해당 페이지 항목 표시
        updatePagination(); // 페이지네이션 업데이트
    });

    // 현재 페이지에 해당하는 항목 표시
    function showPage() {
        var startIndex = (currentPage - 1) * itemsPerPage; // 현재 페이지의 시작 인덱스
        var endIndex = startIndex + itemsPerPage; // 현재 페이지의 끝 인덱스

        // 모든 bulletin 요소 숨기기
        $bulletins.hide();

        // 현재 페이지에 해당하는 bulletin 요소만 표시
        $bulletins.slice(startIndex, endIndex).show();
    }

    // 페이지네이션 업데이트
    function updatePagination() {
        $pagination.find('.page-number').removeClass('active');
        $pagination.find('.page-number').eq(currentPage - 1).addClass('active');
    }

    // 초기 페이지네이션 생성 및 첫 페이지 항목 표시
    generatePagination();
    showPage();
});
