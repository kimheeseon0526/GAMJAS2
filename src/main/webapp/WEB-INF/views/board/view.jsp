<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="../common/head.jsp" %>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/dayjs/1.11.13/dayjs.min.js"
            integrity="sha512-FwNWaxyfy2XlEINoSnZh1JQ5TRRtGow0D6XcmAWmYCRgvqOUTnzCxPc9uF35u5ZEpirk1uhlPVA19tflhvnW1g=="
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/dayjs/1.11.13/locale/ko.min.js"
            integrity="sha512-ycjm4Ytoo3TvmzHEuGNgNJYSFHgsw/TkiPrGvXXkR6KARyzuEpwDbIfrvdf6DwXm+b1Y+fx6mo25tBr1Icg7Fw=="
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/dayjs/1.11.13/plugin/relativeTime.min.js"
            integrity="sha512-MVzDPmm7QZ8PhEiqJXKz/zw2HJuv61waxb8XXuZMMs9b+an3LoqOqhOEt5Nq3LY1e4Ipbbd/e+AWgERdHlVgaA=="
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</head>
<body>
<%@ include file="../common/header.jsp" %>
<%@ include file="../common/nav.jsp" %>
<div class="container p-0">

    <main>
        <div class="small border-bottom border-3" style="border-color: #6A8D73;">
            <a href="" class="small" style="color: #4a5c48;">
		    <span style="color: #6A8D73;">
		      <c:forEach items="${cate}" var="c">
                  <c:if test="${c.cno == cri.cno}">
                      ${c.cname}
                  </c:if>
              </c:forEach>
		    </span>
                카테고리
            </a>
        </div>
${not empty board}
        <div class="small p-0 py-2">
            <c:forEach items="${cate}" var="c">
                <c:if test="${c.cno == cri.cno}">
                    <span class="px-2 border-end border-1"> ${c.cname} </span>
                </c:if>
            </c:forEach>
            <span class="px-2">${board.title}</span>
            <div class="float-end small">
                <span class="text-muted"><i class="fa-solid fa-eye"></i>${board.cnt}</span>
                <span class="text-muted"><i class="fa-solid fa-comment-dots"></i> ${board.replyCnt}</span>
            </div>
        </div>
        <div class="p-0 py-2 bg-light small border-top border-2 border-muted">
            <span class="px-2">작성자: ${board.id}</span>
            <a href="" class="text-muted small">board.html</a>
            <span class="float-end text-muted small me-3">${board.regdate}</span>
        </div>
        <c:choose>
            <c:when test="${board.isSecret == 1 && loginMember.id != board.id || loginMember.isAdmin}">
                비밀글 입니다.
            </c:when>
            <c:otherwise>
                ${board.content}
            </c:otherwise>
        </c:choose>
        <div class="p-0 py-5 ps-1 small border-bottom border-1 border-muted"></div>
        <div class="mt-4">
            <a href="list?${cri.qs2}" class="btn btn-outline-secondary btn-sm">
                <i class="fa-solid fa-list-ul"></i> 목록
            </a>

            <c:if test="${loginMember.id == board.id or loginMember.isAdmin}">
                <a href="modify?bno=${board.bno}&${cri.qs2}" class="btn btn-outline-secondary btn-sm">
                    <i class="fa-solid fa-pen-to-square"></i> 수정
                </a>
                <a href="remove?bno=${board.bno}&${cri.qs2}" class="btn btn-danger btn-sm"
                   onclick="return confirm('삭제하시겠습니까?')">
                    <i class="fa-solid fa-trash-can"></i> 삭제
                </a>
            </c:if>

            <c:if test="${not empty loginMember and board.getCViewType() == 'QNA' and loginMember.isAdmin}"> <!--나중에 회원 들어가면 and붙이고 이거 추가하기 not empty member-->
                <a href="write?${cri.qs2}&bno=${board.bno}" class="btn btn-outline-secondary btn-sm">
                    <i class="fa-solid fa-reply" style="transform:rotate(180deg);"></i> 답글
                </a>
            </c:if>
        </div>

        <c:if test="${fn:length(board.attachs) > 0}">
            <div class="d-grid my-2 attach-area">
                <div class="small my-1"><i class="fa-solid fa-paperclip"></i>첨부파일</div>
                <!-- <label class="btn btn-info">파일첨부<input type="file" multiple="" class="d-none" id="f1"></label> -->
                <ul class="list-group my-3 attach-list">
                    <c:forEach items="${board.attachs}" var="a">
                        <li class="list-group-item d-flex align-items-center justify-content-between"
                            data-uuid="${a.uuid}"
                            data-origin="${a.origin}"
                            data-image="${a.image}"
                            data-path="${a.path}"
                            data-size="${a.size}"
                            data-odr="${a.odr}">
                            <a href="${cp}/download?uuid=${a.uuid}&origin=${a.origin}&path=${a.path}">${a.origin}</a>
                            <!-- <i class="fa-solid fa-circle-xmark float-end text-danger"></i> -->
                        </li>
                    </c:forEach>
                </ul>
                <div class="row justify-content-arround w-75 mx-auto attach-thumb">
                    <c:forEach items="${board.attachs}" var="a">
                        <c:if test="${a.image}">
                            <div class="my-2 col-12 col-sm-4 col-lg-2 " data-uuid="${a.uuid}">
                                <div class="my-2 bg-primary"
                                     style="height: 150px; background-size: cover; background-image:url('https://kiylab-bucket.s3.ap-northeast-2.amazonaws.com/upload/${a.path}/t_${a.uuid}')">
                                        <%-- <i class="fa-solid fa-circle-xmark float-end text-danger m-2"></i> --%>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
            </div>
        </c:if>
        <c:if test="${board.getCViewType() == 'FREE' or board.getCViewType() == 'REVIEW'}">
            <div class="small p-0 py-2 border-top border-bottom border-1 border-muted mt-4 clearfix align-items-center d-flex">
                <div class="col text-end">
                    <c:if test="${empty loginMember}">
                        <a class="small" href="${cp}/member/signin" style="color: #4a5c48;">
                            댓글을 작성하려면 로그인이 필요합니다
                        </a>
                    </c:if>

                    <c:if test="${not empty loginMember}">
                        <button class="btn btn-sm btn-write-form" style="background-color: #4a5c48; color: white;">
                            댓글작성
                        </button>
                    </c:if>
                </div>
            </div>
        </c:if>

        <ul class="list-group list-group-flush mt-3 reviews"></ul>
        <div class="d-grid">
            <button class="btn btn-sm btn-reply-more d-none " style="background-color: #4a5c48; color: white;">댓글 더보기
            </button>
        </div>

    </main>
</div>

<!--Modal 전체 -->
<c:if test="${board.getCViewType() == 'FREE' or board.getCViewType() == 'REVIEW'}">
    <div class="modal fade" id="reviewModal">
        <div class="modal-dialog">
            <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title" style="color: #4a5c48;">댓글 작성</h4>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>

                <!-- Modal body -->
                <div class="modal-body">
                <form method="post" id="writeForm" action="write">
                        <div class="mb-3 mt-3">
                            <label for="content" class="form-label fw-bold" style="color: #4a5c48;"><i
                                    class="fa-regular fa-comment" style="color: #4a5c48;"></i> 댓글 내용</label>
                            <textarea class="form-control resize-none" id="content" placeholder="댓글 내용을 입력하세요"
                                      name="content" rows="5"></textarea>
                        </div>
                        <!-- 첨부파일 -->
                     <%--   <div class="mb-4">
                            <label class="form-label fw-semibold d-inline-block me-3">
                                <i class="fa-solid fa-paperclip me-1 text-secondary"></i> 첨부파일
                            </label>
                            <label class="btn btn-outline-success btn-sm align-text-bottom">
                                파일 선택 <input type="file" multiple class="d-none" id="f1">
                            </label>
                            <ul class="list-group my-2 reply-attach-list"></ul>
                            <div class="row justify-content-start reply-attach-thumb"></div>
                        </div>
--%>
                        <%--<script>
                            $("#f1").on("change", function (e) {
                                console.log("파일 선택됨:", e.target.files);
                            });
                        </script>--%>

                        <!-- 작성자 표시 -->
                        <div class="mb-3">
                            <label for="writing" class="form-label fw-bold" style="color: #4a5c48;"><i
                                    class="fa-regular fa-user" style="color: #4a5c48;"></i> 작성자</label>
                            <input type="text" class="form-control" id="writer" placeholder="Enter writer" name="writer"
                                   value="${loginMember.id}" disabled="disabled">
                        </div>
                    </form>
                </div>

                <!-- Modal footer -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-sm btn-write-submit"
                            style="background-color: #4a5c48; color: white;">작성
                    </button>
                    <button type="button" class="btn btn-sm btn-write-submit"
                            style="background-color: #6c7a68; color: white;">수정
                    </button>
                    <button type="button" class="btn btn-sm" style="background-color: #a94442; color: white;"
                            data-bs-dismiss="modal">닫기
                    </button>
                </div>
            </div>
        </div>
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
</c:if>
</form>
<%@ include file="../common/footer.jsp" %>
<script>


    $.ajaxSetup({
        contentType: 'application/json',
        dataType: 'json'
    })

    dayjs.extend(window.dayjs_plugin_relativeTime);
    dayjs.locale('ko');
    const dayForm = 'YYYY-MM-DD HH:mm:ss';
    dayjs('2025-06-20 15:40:44', dayForm).fromNow()

    $(function () {
        const bno = '${board.bno}'
        const url = '${cp}' + '/reply/';
        const modal = new bootstrap.Modal($("#reviewModal").get(0), {})

        console.log("bno 값 체크:", '${board.bno}');

        //makeReplyLi(reply) > str

        function makeReplyLi(r) {
            const loginId = '${loginMember.id}'
            const isAdmin = '${loginMember.isAdmin}' // jsp의 로그인 정보를 변수로 갖고오는 작업

            const userOrAdmin = loginId == r.id || isAdmin == '1'   // false로 나옴. 나머지도 안나온  타입이 안맞아서?
            console.log('loginId: ', loginId);
            console.log('isAdmin: ', isAdmin);
            console.log(userOrAdmin);

            let thumbHtml = '';  // 댓글 첨부파일 이미지 폼
            if(r.attachs && r.attachs.length > 0) {
                for(let a of r.attachs) {
                    if(a && a.image) {
                        thumbHtml += `
                         <div class="my-2 col-12 col-sm-4 col-lg-2" data-uuid="\${a.uuid}">
                            <div class="my-2 bg-primary"
                                style="height: 150px; background-size: cover; background-image:url('https://kiylab-bucket.s3.ap-northeast-2.amazonaws.com/upload/\${a.path}/t_\${a.uuid}')">
										<i class="fa-regular fa-circle-xmark float-end text-danger m-2"></i>
									</div>
									</div>`;

                    }
                }
            }
            // 로그인 아이디가 makeReplyLi(r)의 r.id랑 같거나 관리자가 1일때라고 조건 걸어주기
            const btnRemoveHtml = userOrAdmin ? `
						<button class="btn btn-danger btn-sm float-end btn-remove-submit">
						<i class="fa-solid fa-trash-can"></i> 삭제
						</button>
						<button class="btn btn-outline-secondary btn-sm float-end mx-3 btn-modify-form">수정</button>
					` : '';
            return `
                     <li class="list-group-item ps-5 profile-img" data-rno="\${r.rno}">                             
                         <p class="small text-secondary">
                             <span class="me-3">\${r.id}</span>
                             <span class="mx-3">\${dayjs(r.regdate, dayForm).fromNow()}</span>                                   
                         </p>
                         <p class="small ws-pre-line">\${r.content}</p>
                        <div class="row reply-attach-thumb">\${thumbHtml}</div>
						\${btnRemoveHtml}
                	</li>
                	`;
        }


        function list(bno, lastRno) {
            lastRno = lastRno ? ('/' + lastRno) : '';
            let reqUrl = url + 'list/' + bno + lastRno;
            console.log(reqUrl);
            $.ajax({
                url: reqUrl,
                success: function (data) {
                    if (!data || data.length === 0) {
                        if ($(".reviews li").length === 0) {// 처음부터 댓글이 없는 상태
                            $(".reviews").html('<li class ="list-group-item text-center text-muted">댓글이 없습니다</li>')
                        } else { //댓글은 원래 존재하지만, 더 가져올 것이 없는 경우
                            $(".btn-reply-more").prop("disabled", true).text("추가 댓글이 없습니다.")
                        }

                        return;
                    }
                    $(".btn-reply-more").removeClass("d-none");
                    let str = '';
                    for (let r of data) {
                        console.log(r);
                        str += makeReplyLi(r);
                    }
                    $(".reviews").append(str); //얘는 현재 교체이다.
                }
            });
        }

        list(bno);

        // myModal.show();

        // 댓글 버튼 숨기기


        //글쓰기 폼 활성화 btn-write-form
        $(".btn-write-form").click(function () {
            console.log("글쓰기 폼");
            $("#reviewModal form").get(0).reset(); // 그전에 작성했던 내용을 reset으로 처리해버림

            // 첨부파일 목록 초기화
            $(".reply-attach-list").empty(); // li목록 지우기
            $(".reply-attach-thumb").empty(); // 썸네일 이미지 지우기
            $("#f1").val(""); // 파일 input 초기화

            modal.show();
            $("#reviewModal .modal-footer button").show().eq(1).hide(); //수정버튼만 숨기기
        });
        //글쓰기 버튼 이벤트 btn-write-submit
        $(".btn-write-submit").click(function () {
            const result = confirm("등록하시겠습니까?");
            if (!result) return;

            const content = $("#content").val().trim();
            const id = $("#writer").val().trim();

            const attachs = [];
            $(".reply-attach-list li").each(function () {
                attachs.push({...this.dataset});
            });
            attachs.forEach((item, idx) => item.odr = idx);  // 순서정보

            $("[name='encodedStr']").val((JSON.stringify(attachs)));  //서버로 가는

            const obj = {content, id, bno, attachs};
            console.log(obj);
            console.log("글쓰기 전송");
            $.ajax({
                url,
                method: 'POST',
                data: JSON.stringify(obj),
                success: function (data) {
                    if (data.result) {
                        modal.hide();
                        //작성된 댓글
                        if (data.reply) { // not null. not undefined
                            data.reply.regdate = dayjs().format(dayForm);
                            const strLi = makeReplyLi(data.reply);
                            $(".reviews").prepend(strLi);
                        }
                        $(".reply-attach-list").empty();  //첨부 썸네일 제거
                        attachs.length = 0;  //배열 초기화
                    }
                }
            })
        });
        //글수정 폼 활성화 btn-modify-form
        $(".reviews").on("click", ".btn-modify-form", function () {
            console.log("글수정 폼");
            // console.log($(this).closest("li").data("rno"));
            const rno = $(this).closest("li").data("rno");
            $.getJSON(url + rno, function (data) {
                $("#reviewModal .modal-footer button").show().eq(0).hide();
                $("#content").val(data.content);
                $("#writer").val(data.id);
                $("#reviewModal").data("rno", rno); // 이 친구의 역할은?
                console.log(data);
                modal.show();
            })
        })
        //글수정 버튼 이벤트 btn-modify-submit
        $(".btn-modify-submit").click(function () {
            const result = confirm("수정하시겠습니까?");
            if (!result) return;
            const rno = $("#reviewModal").data("rno");
            console.log(rno);

            const content = $("#content").val().trim();
            const id = $("#writer").val().trim();
            const obj = {content, id, rno};

            console.log("글수정 전송");
            $.ajax({
                url: url + rno,
                method: 'PUT',
                data: JSON.stringify(obj),
                success: function (data) {
                    if (data.result) { //data.result는 T/F스타일, 유튜브 댓글도 이런 스타일
                        modal.hide();
                        // get을 재호출
                        $.getJSON(url + rno, function (data) {
                            console.log(data);
                            //문자열 생성
                            const strLi = makeReplyLi(data); //교체 후 댓글
                            //rno를 가지고 수정할 li 탐색
                            const $li = $(`.reviews li[data-rno ='\${rno}']`); // 교체 전 댓글
                            //console.log($li.html());
                            //replacewith로 내용 교체
                            $li.replaceWith(strLi);
                        })
                    }
                }
            })

        });
        //글삭제 버튼 이벤트 btn-remove-submit
        $(".reviews").on("click", ".btn-remove-submit", function () {

            // return false; // false 기본 이벤트 제거 및 전파도 방지

            const result = confirm("삭제 하시겠습니까?")
            if (!result) return;
            const $li = $(this).closest("li")
            const rno = $li.data("rno");
            console.log("글삭제 전송");

            $.ajax({
                url: url + rno,
                method: 'DELETE',
                success: function (data) {
                    if (data.result) { //data.result는 T/F스타일, 유튜브 댓글도 이런 스타일
                        $li.remove();
                    }
                }
            })

        })

        //댓글 더보기 버튼 이벤트
        $(".btn-reply-more").click(function () {
            //현재 댓글 목록중 마지막 댓글의 댓글 번호를 가져와
            // list(bno, lastRno)
            /*             	const lastRno = $("li:last-of-type").value; */
            const lastRno = $(".reviews li:last").data("rno");
            console.log(lastRno)
            list(bno, lastRno);
        });
    });

    $(function () {
        $(".reply-attach-list").sortable();

        function validateFiles(files) {
            const MAX_COUNT = 2;
            const MAX_FILE_SIZE = 10 * 1024 * 1024; // 10MB
            const MAX_TOTAL_SIZE = 50 * 1024 * 1024; // 50MB
            const BLOCK_EXT = ['exe', 'sh', 'jsp', 'java', 'class', 'html', 'js']

            if (files.length > MAX_COUNT) {
                alert('파일은 최대 2개만 업로드 가능합니다');
                return false;
            }

            let totalSize = 0;
            const isValid = files.every(f => {
                const ext = f.name.split(".").pop().toLowerCase(); // 확장자 추출
                totalSize += f.size;
                return !BLOCK_EXT.includes(ext) && f.size <= MAX_FILE_SIZE;
            }) && totalSize <= MAX_TOTAL_SIZE

            if (!isValid) {
                alert('다음 파일확장자는 업로드가 불가합니다. [exe, sh, jsp, java, class, html, js] \n 또한 각 파일은 10MB 이하 전체합계는 50MB이하여야 합니다. ')
            }
            return isValid;
        }

        $(".attach-area").on("click", "i", function () {
            const uuid = $(this).closest("[data-uuid]").data("uuid");
            console.log(uuid);
            $('[data-uuid="' + uuid + '"]').remove();
        });

        /*	document.querySelector("#f1").addEventListener("change", e => {
                console.log("이벤트 실행",e.target.file )
            })*/

        $('#f1').change(function (event) {

            event.preventDefault();
            const formData = new FormData();

            console.log(formData);
            const files = this.files; //현재 input type file

            const data = []; // 기존 파일목록이 들어갈 곳
            $(".attach-list li").each(function () {
                //console.log({...this.dataset});
                data.push({...this.dataset});
            });

            console.log('기존', data);
            console.log('신규', [...files]);

            const mixedFiles = [...data.map(d => {
                return {name: d.origin, size: d.size / 1}
            }), ...files];
            console.log(mixedFiles);

            for (let i = 0; i < files.length; i++) {
                formData.append("f1", files[i]);
            }

            const valid = validateFiles(mixedFiles);
            if (!valid) {
                return;
            }

            $.ajax({//비동기형식으로 교체하자
                url: '${cp}/upload',
                method: 'POST',
                data: formData,
                processData: false, //data를 queryString으로 쓰지 않겠다.
                contentType: false, //multipart/form-data; 이후에 나오게 될 브라우저 정보도 포함시킨다. 즉 기본 브라우저 설정을 따르는 옵션
                success: function (data) {
                    console.log(data);
                    let str = "";
                    let thumbStr = "";
                    for (let a of data) {// 확인용 코드
                        // $(".container").append("<p>" + data[a].origin + "x</p>");
                        str += `<li class="list-group-item d-flex align-items-center justify-content-between"
						  data-uuid="\${a.uuid}"
						  data-origin="\${a.origin}"
						  data-image="\${a.image}"
						  data-path="\${a.path}"
						  data-size="\${a.size}"
						  data-odr="\${a.odr}"
						>
							<a href="${cp}/download?uuid=\${a.uuid}&origin=\${a.origin}&path=\${a.path}">\${a.origin}</a>
							<i class="fa-solid fa-circle-xmark float-end text-danger"></i>
						</li>`;
                        if (a.image) {
                            thumbStr += `<div class="my-2 col-12 col-sm-4 col-lg-2 "
							   data-uuid="\${a.uuid}"
							>
								<div class="my-2 bg-primary"
								style="height: 150px; background-size: cover; background-image:url('${cp}/display?uuid=t_\${a.uuid}&path=\${a.path}')">
									<i class="fa-solid fa-circle-xmark float-end text-danger m-2"></i>
								</div>
								</div>`
                        }
                    }
                    $(".reply-attach-list").append(str);
                    $(".reply-attach-thumb").append(thumbStr);
                    // console.log(thumbStr);
                    // console.log(str);
                    //이미지인 경우와 아닌경우 -> 이미지 파일은 썸네일,
                }
            })
        })
        $('#replyForm').submit(function (event) {
            event.preventDefault();
            if (!confirm("수정하시겠습니까?")) {
                return;
            }
            const data = [];
            $(".reply-attach-list li").each(function () {
                //console.log({...this.dataset});
                data.push({...this.dataset});
            });
            console.log(JSON.stringify(data));
            data.forEach((item, idx) => item.odr = idx);
            $("[name='encodedStr']").val(JSON.stringify(data));
            this.submit();

        })

    })
</script>

</body>
</html>