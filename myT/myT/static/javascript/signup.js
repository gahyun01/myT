function DropFile(dropAreaId, fileListId) {
    let dropArea = document.getElementById(dropAreaId);
    let fileList = document.getElementById(fileListId);
  
    function preventDefaults(e) {
      e.preventDefault();
      e.stopPropagation();
    }
  
    function highlight(e) {
      preventDefaults(e);
      dropArea.classList.add("highlight");
    }
  
    function unhighlight(e) {
      preventDefaults(e);
      dropArea.classList.remove("highlight");
    }
  
    function handleDrop(e) {
      unhighlight(e);
      let dt = e.dataTransfer;
      let files = dt.files;
  
      handleFiles(files);
  
      if (fileList) {
        fileList.scrollTo({ top: fileList.scrollHeight });
      }
    }
  
    function handleFiles(files) {
      files = [...files];
      files.forEach(previewFile);
    }
  
    function previewFile(file) {
      console.log(file);
      renderFile(file);
    }
  
    function renderFile(file) {
      let reader = new FileReader();
      reader.readAsDataURL(file);
      reader.onloadend = function () {
        let img = dropArea.getElementsByClassName("preview")[0];
        img.src = reader.result;
        img.style.display = "block";
      };
    }
  
    dropArea.addEventListener("dragenter", highlight, false);
    dropArea.addEventListener("dragover", highlight, false);
    dropArea.addEventListener("dragleave", unhighlight, false);
    dropArea.addEventListener("drop", handleDrop, false);
  
    return {
      handleFiles
    };
  }
  
  // 페이지가 로드된 후 DropFile 객체를 초기화
  document.addEventListener("DOMContentLoaded", function () {
    const dropFile = new DropFile("drop-file", "files");

    // onchange 이벤트에서 dropFile.handleFiles 사용
    const fileInput = document.getElementById("chooseFile");
    fileInput.addEventListener("change", function () {
        dropFile.handleFiles(fileInput.files);
    });

    // 폼 제출 전에 파일이 선택되었는지 확인
    const form = document.querySelector('form');
    form.addEventListener("submit", function(event) {
        const fileInput = document.getElementById("chooseFile");
        if (fileInput.files.length === 0) {
            alert("프로필 사진을 업로드 해주세요.");
            event.preventDefault();  // 폼 제출 막기
        }
    });
  });
  