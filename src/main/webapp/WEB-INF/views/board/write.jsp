<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="../common/head.jsp" %>
</head>
<body>
<%@ include file="../common/header.jsp" %>
<%@ include file="../common/nav.jsp" %>

<div class="container my-5" style="max-width: 768px;">
    <main>
        <form method="post" id="writeForm" action="write">

            <!-- 제목 -->
            <div class="mb-3">
                <label for="title" class="form-label fw-semibold">제목</label>
                <input type="text" class="form-control" id="title" name="title" placeholder="제목을 입력하세요" required>
            </div>

            <%--비밀글 체크박스--%>
            <c:if test="${cri.cno == 4}">
                <div class="form-check form-check-inline mb-0">
                    <input class="form-check-input" type="checkbox" id="isSecret" name="isSecret" value="1">
                    <label class="form-check-label" for="isSecret">비밀글로 등록</label>
                </div>
            </c:if>
            <!-- 내용 -->
            <div class="mb-3">
                <label for="editor1" class="form-label fw-semibold"></label>
                <textarea id="editor1" name="content" rows="10" class="form-control" placeholder="내용을 입력하세요"
                          required></textarea>
            </div>

            <!-- 첨부파일 -->
            <div class="mb-4">
                <label class="form-label fw-semibold d-inline-block me-3">
                    <i class="fa-solid fa-paperclip me-1 text-secondary"></i> 첨부파일
                </label>
                <label class="btn btn-outline-success btn-sm align-text-bottom">
                    파일 선택 <input type="file" multiple class="d-none" id="f1">
                </label>
                <ul class="list-group my-2 attach-list"></ul>
                <div class="row justify-content-start attach-thumb"></div>
            </div>

            <!-- 버튼 영역 -->
            <div class="d-flex justify-content-between">
                <!-- 목록 버튼은 그대로 유지 -->
                <a href="${cp}/info/missionlist" class="btn btn-outline-secondary btn-sm">
                    <i class="fa-solid fa-list-ul"></i> 목록
                </a>

                <!-- 글쓰기 버튼 커스텀 색상 적용 -->
                <button type="submit" class="btn btn-sm" style="background-color:#6A8D73; color:#fff;">
                    <i class="fa-solid fa-pen-fancy"></i> 글쓰기
                </button>
            </div>

            <!-- hidden 필드들 -->
            <input type="hidden" name="id" value="${member.id}">
            <input type="hidden" name="cno" value="${cri.cno}">
            <input type="hidden" name="page" value="1">
            <input type="hidden" name="amount" value="${cri.amount}">
            <input type="hidden" name="encodedStr" value="">
            <c:if test="${not empty param.bno}">
                <input type="hidden" name="bno" value="${param.bno}">
            </c:if>

        </form>
    </main>
</div>

<script src="https://code.jquery.com/ui/1.14.1/jquery-ui.js"></script>
<script>

    $(function () {
        CKEDITOR.replace('editor1', {
            height: 400
        });
    });

</script>

<script>
    $(function () {
        $(".attach-list").sortable();

        //return true / false
        function validateFiles(files) {
            const MAX_COUNT = 5;
            const MAX_FILE_SIZE = 10 * 1024 * 1024 //10MB
            const MAX_TOTAL_SIZE = 50 * 1024 * 1024 //50MB
            const BLOCK_EXT = ['exe', 'sh', 'jsp', 'java', 'class', 'html', 'js']

            if (files.length > MAX_COUNT) {
                alert('파일은 최대 5개만 업로드 가능합니다');
                return false;
            }

            let totalSize = 0; // 지역변수
            const isValid = files.every(f => {
                const ext = f.name.split(".").pop().toLowerCase(); //확장자 추출. every는 all을 뜻함
                //점을 통한 구분자 배열. pop -맨 뒤에 있는걸 자르는 (자바에서는 터지는데 vs는 안터짐)
                // 확장작 대문자도 있을 수 있으니까 소문장\로 변환해서 찾으러 가게하려고
                totalSize += f.size;
                return !BLOCK_EXT.includes(ext) && f.size <= MAX_FILE_SIZE;  // !붙여서 불포한 //단 하나라도 false가 있으면 통과x
            }) && totalSize <= MAX_TOTAL_SIZE

            if (!isValid) {
                alert("다음 파일확장자는 업로드가 불가합니다 [exe, sh, jsp, java, class, html, js] \n 또한 각 파일은 10MB이하 전체합계는 50MB 이하여야합니다")
            }
            return isValid;
        }  //이것이 유효성 체크


        $(".container").on("click", "i", function () {
            // li가 실제로는 없기 때문에 위임을 해줘야하고, 그래서 attach-list에 주면됨. 그리고 on을 써서 실제로 이벤트주는건 i에 주는 거고, this는i를 가리킴
            const uuid = $(this).closest("[data-uuid]").data("uuid");
            $('[data-uuid="' + uuid + '"]').remove()
        });

        $("#f1").change(function () {


            // $("#uploadForm").submit(function() {
            event.preventDefault();  //
            const formData = new FormData(); //

            console.log(formData);
            const files = this.files;
            for (let i = 0; i < files.length; i++) {
                formData.append("f1", files[i]); // 첨부파일은 boardWrite
            }
            // console.log(files);

            const valid = validateFiles([...files]);  //배열로 전개해서 해야함
            if (!valid) {
                return;
            }
            $.ajax({
                url: '${cp}/upload',
                method: 'POST',
                data: formData,
                processData: false, // data를 queryString으로 쓰지 않겠다
                contentType: false, // 내가 정의하지 않겠다. 내가 없으니까 거기에 있는 기본값을 가져오겠다
                // 원래는 multipart/form-data;가 들어가야함. 이후에 나오게 될 브라우저 정보도 포함시킨다. 즉 기본 브라우저 설정을 따르는 옵션
                success: function (data) {
                    console.log("서버응답: ", data);
                    // 확인용
                    let str = "";
                    let thumbStr = "";
                    for (let a of data) {
                        // $(".container").append("<p>" + data[a].origin + "x</p>");
                        str += `<li class="list-group-item d-flex align-items-center justify-content-between"
							data-uuid="\${a.uuid}"
							data-origin="\${a.origin}"
							data-image="\${a.image}"
							data-path="\${a.path}"
							data-odr="\${a.odr}"
							data-size="\${a.size}"

						>
							<a href="${cp}/download?uuid=\${a.uuid}&origin=\${a.origin}&path=\${a.path}">\${a.origin}</a>
							<i class="fa-regular fa-circle-xmark float-end text-danger"></i>
							</li>`;
                        if (a.image) {  //해당 첨부파일일 이미지일때만 할거라는
                            thumbStr += `<div class="my-2 col-sm-4 col-lg-2"
									data-uuid="\${a.uuid}"
								>
									<div class="my-2 bg-primary"  
									style="height: 150px; background-size: cover; background-image:url('${cp}/display?uuid=t_\${a.uuid}&path=\${a.path}')">
										<i class="fa-regular fa-circle-xmark float-end text-danger m-2"></i> 
									</div>
									</div>`;
                        }
                    }
                    console.log(thumbStr);
                    $(".attach-list").html(str);
                    $(".attach-thumb").html(thumbStr);


                    // 이미지인 경우와 아닌경우
                }
            })

            $("#writeForm").submit(function (event) {
                event.preventDefault();  // submit 막는거
                const data = [];
                $(".attach-list li").each(function (event) {
                    data.push({...this.dataset});

                });
                console.log(JSON.stringify(data));
                data.forEach((item, idx) => item.odr = idx);

                $("[name='encodedStr']").val(JSON.stringify(data));
                this.submit();

            })
        })
    })


</script>


<%@ include file="../common/footer.jsp" %>
</body>
</html>