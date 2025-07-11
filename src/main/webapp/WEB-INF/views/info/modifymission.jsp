<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri= "http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../common/head.jsp" %>
<style>
.line-clamp-2 {
  display: -webkit-box;
  -webkit-line-clamp: 2;     /* 두 줄까지만 표시 */
  -webkit-box-orient: vertical;
  overflow: hidden;
  text-overflow: ellipsis;
}
.apiInfo {
	display: none;
}
</style>
</head>
<body>
<%@ include file="../common/header.jsp" %>
<%@ include file="../common/nav.jsp" %>

	
<div class="container my-5" style="max-width: 768px; margin-top: 194px;">
	
	<main>
		
		 	<div class="row row-cols-1 row-cols-md-3 g-4 ">
    
				<!-- 카드 1 -->
				<div class="col">
				<div class="card h-100 ${recommend.recomContenttype == 'ATTRACTION' ? 'border-5': ''}" data-type="ATTRACTION" >
					<img src="https://placehold.co/400x200" class="card-img-top" alt="이미지">
					<div class="card-body">
						<h5 class="card-title fs-6">관광</h5>
						<p class="card-text line-clamp-2 small">서울 내 자연, 명소, 역사 유적 등 주요 관광지 정보를 조회합니다.</p>
					</div>
				</div>
				</div>

				<!-- 카드 2 -->
				<div class="col">
				<div class="card h-100 ${recommend.recomContenttype == 'RESTAURANT' ? 'border-5': ''}" data-type="RESTAURANT">
					<img src="https://placehold.co/400x200" class="card-img-top" alt="이미지">
					<div class="card-body">
					<h5 class="card-title fs-6">먹거리</h5>
					<p class="card-text line-clamp-2 small">서울내 음식점 정보를 확인하고 선택할 수 있습니다.</p>
					</div>
				</div>
				</div>

				<!-- 카드 3 -->
				<div class="col">
				<div class="card h-100 ${recommend.recomContenttype == 'FESTIVAL' ? 'border-5': ''}" data-type="FESTIVAL">
					<img src="https://placehold.co/400x200" class="card-img-top" alt="이미지">
					<div class="card-body">
					<h5 class="card-title fs-6">체험</h5>
					<p class="card-text line-clamp-2 small">서울 내 공방, 활동, 투어 등 체험 콘텐츠 정보를 제공합니다.</p>
					</div>
				</div>
				</div>
			
			</div>

			<c:choose>
				<c:when test="${recommend.recomContenttype == 'ATTRACTION'}">						
					<div class="container my-4">
					  <div class="row">
					    <!-- 왼쪽 컬럼 -->
					    <div class="col-md-6">

					      <ul class="list-group list-group-flush">
					
					        <c:if test="${not empty attraction.cmmnTelNo}">
					          <li class="list-group-item"><span class="fw-bold">문의 및 안내</span> : ${attraction.cmmnTelNo}</li>
					        </c:if>
					
					        <c:if test="${not empty attraction.address}">
					          <li class="list-group-item"><span class="fw-bold">주소</span> : ${attraction.address}</li>
					        </c:if>
					
					        <c:if test="${not empty attraction.cmmnRstde}">
					          <li class="list-group-item"><span class="fw-bold">휴일</span> : ${attraction.cmmnRstde}</li>
					        </c:if>
					
					        <c:if test="${not empty attraction.tag}">
					          <li class="list-group-item"><span class="fw-bold">판매 품목</span> : ${attraction.tag}</li>
					        </c:if>
					
					        <c:if test="${not empty attraction.bfDesc}">
					          <li class="list-group-item"><span class="fw-bold">화장실</span> : ${attraction.bfDesc}</li>
					        </c:if>
					
					        <c:if test="${not empty attraction.subwayInfo}">
					          <li class="list-group-item"><span class="fw-bold">지하철</span> : ${attraction.subwayInfo}</li>
					        </c:if>
					
					      </ul>
					    </div>
					
					    <!-- 오른쪽 컬럼 -->
					    <div class="col-md-6">
					      <ul class="list-group list-group-flush">
					
					        <c:if test="${not empty attraction.cmmnHmpgUrl}">
					          <li class="list-group-item"><span class="fw-bold">홈페이지</span> : 
					            <a href="${attraction.cmmnHmpgUrl}" target="_blank">${attraction.cmmnHmpgUrl}</a>
					          </li>
					        </c:if>
					
					        <c:if test="${not empty attraction.cmmnUseTime}">
					          <li class="list-group-item"><span class="fw-bold">이용시간</span> : ${attraction.cmmnUseTime}</li>
					        </c:if>
					
					        <c:if test="${not empty attraction.cmmnBsnde}">
					          <li class="list-group-item"><span class="fw-bold">주차</span> : ${attraction.cmmnBsnde}</li>
					        </c:if>
					
					        <c:if test="${not empty attraction.newAddress}">
					          <li class="list-group-item"><span class="fw-bold">신주소</span> : ${attraction.newAddress}</li>
					        </c:if>
					
					        <c:if test="${not empty attraction.cmmnFax}">
					          <li class="list-group-item"><span class="fw-bold">팩스</span> : ${attraction.cmmnFax}</li>
					        </c:if>
					
					      </ul>
					    </div>
					  </div>
					</div>
				</c:when>
			<c:when test="${recommend.recomContenttype == 'RESTAURANT'}">						
				<div class="container my-4">
				  <div class="row">
				    <!-- 왼쪽 컬럼 -->
				    <div class="col-md-6">
				      <ul class="list-group list-group-flush">
				
				        <c:if test="${not empty restaurant.cmmnTelNo}">
				          <li class="list-group-item"><span class="fw-bold">문의 및 안내</span> : ${restaurant.cmmnTelNo}</li>
				        </c:if>
				
				        <c:if test="${not empty restaurant.address}">
				          <li class="list-group-item"><span class="fw-bold">주소</span> : ${restaurant.address}</li>
				        </c:if>
				
				        <c:if test="${not empty restaurant.newAddress}">
				          <li class="list-group-item"><span class="fw-bold">신주소</span> : ${restaurant.newAddress}</li>
				        </c:if>
				
				        <c:if test="${not empty restaurant.fdReprsntMenu}">
				          <li class="list-group-item"><span class="fw-bold">대표메뉴</span> : ${restaurant.fdReprsntMenu}</li>
				        </c:if>
				
				        <c:if test="${not empty restaurant.subwayInfo}">
				          <li class="list-group-item"><span class="fw-bold">지하철 정보</span> : ${restaurant.subwayInfo}</li>
				        </c:if>

				      </ul>
				    </div>
				
				    <!-- 오른쪽 컬럼 -->
				    <div class="col-md-6">
				      <ul class="list-group list-group-flush">
				        <c:if test="${not empty restaurant.cmmnHmpgUrl}">
				          <li class="list-group-item">
				            <span class="fw-bold">홈페이지</span> :
				            <a href="${restaurant.cmmnHmpgUrl}" target="_blank">${restaurant.cmmnHmpgUrl}</a>
				          </li>
				        </c:if>
				        <c:if test="${not empty restaurant.cmmnUseTime}">
				          <li class="list-group-item"><span class="fw-bold">이용시간</span> : ${restaurant.cmmnUseTime}</li>
				        </c:if>
				        <c:if test="${not empty restaurant.cmmnHmpgLang}">
				          <li class="list-group-item"><span class="fw-bold">홈페이지 언어</span> : ${restaurant.cmmnHmpgLang}</li>
				        </c:if>
				      </ul>
				    </div>
				  </div>
				</div>

			</c:when>
			<c:otherwise>
				<div class="container my-4">
					 <c:if test="${not empty festival.firstImage}">
			           <div style="max-width: 600px; margin: 0 auto;">
			            <img src="${festival.firstImage}" class="img-fluid mt-2" alt="축제 이미지">
			           	<span class="fw-bold">대표 이미지</span><br>
			           </div>
			        </c:if>
				  <div class="row">
				    <!-- 왼쪽 컬럼 -->
				    <div class="col-md-6">
				      <ul class="list-group list-group-flush">
				
				        <c:if test="${not empty festival.title}">
				          <li class="list-group-item"><span class="fw-bold">행사명</span> : ${festival.title}</li>
				        </c:if>
				
				        <c:if test="${not empty festival.tel}">
				          <li class="list-group-item"><span class="fw-bold">문의처</span> : ${festival.tel}</li>
				        </c:if>
				
				        <c:if test="${not empty festival.addr1}">
				          <li class="list-group-item"><span class="fw-bold">주소</span> : ${festival.addr1}
				            <c:if test="${not empty festival.addr2}"> ${festival.addr2}</c:if>
				          </li>
				        </c:if>
				      </ul>
				    </div>
				
				    <!-- 오른쪽 컬럼 -->
				    <div class="col-md-6">
				      <ul class="list-group list-group-flush">
				
				        <c:if test="${not empty festival.eventStartDate}">
				          <li class="list-group-item"><span class="fw-bold">시작일</span> : ${festival.eventStartDate}</li>
				        </c:if>
				
				        <c:if test="${not empty festival.eventEndDate}">
				          <li class="list-group-item"><span class="fw-bold">종료일</span> : ${festival.eventEndDate}</li>
				        </c:if>
				        <c:if test="${not empty festival.progressType}">
				          <li class="list-group-item"><span class="fw-bold">진행 형태</span> : ${festival.progressType}</li>
				        </c:if>
				        
				        <c:if test="${not empty festival.festivalType}">
				          <li class="list-group-item"><span class="fw-bold">축제 유형</span> : ${festival.festivalType}</li>
				        </c:if>
				      </ul>
				    </div>
				  </div>
				</div>
			</c:otherwise>
		</c:choose>
       
		<form method="POST" id="writeForm" action="${cp}/info/modifymission">
			<div class="mb-3">
				<label for="title" class="form-label fw-semibold" required>제목</label>
				<input type="text" class="form-control" id="title" name="title" value="${mission.title}" required>
			</div>
			<div class="mb-3">
				<label for="title" class="form-label fw-semibold">미션 개요</label>
				<select class="form-select form-select-sm me-2" style="width: 150px;" name="providedTicket" >
					<option value="1">감자티켓 1개</option>
					<option value="2">감자티켓 2개</option>
					<option value="3">감자티켓 3개</option>
					<option value="4">감자티켓 4개</option>
					<option value="5">감자티켓 5개</option>
					<option value="6">감자티켓 6개</option>
					<option value="7">감자티켓 7개</option>
					<option value="8">감자티켓 8개</option>
					<option value="9">감자티켓 9개</option>
					<option value="10">감자티켓 10개</option>
				</select>
				<textarea type="text" class="form-control" rows="5" style="resize: none" id="summary" name="summary" required>${mission.summary}</textarea>
			</div>
            <!-- 내용 -->
            <div class="mb-3">
                <label for="editor1" class="form-label fw-semibold"></label>
                <textarea id="editor1" name="content" rows="10" class="form-control" placeholder="내용을 입력하세요" required>${mission.content}</textarea>
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
                    <i class="fa-solid fa-pen-fancy"></i> 글수정
                </button>
            </div>

            <!-- hidden 필드들 -->
            <input type="hidden" name="recomContenttype" id="recomContenttype" value="${recommend.recomContenttype}">
    		<input type="hidden" name="missionNo" value="${mission.missionNo}">
            <%-- <input type="hidden" name="stationId" value="${station.id}"> --%>
            <input type="hidden" name="createdBy" value="${loginMember.memNo}">
            <input type="hidden" name="encodedStr" value="">
        </form>
    </main>
</div>

<script src="https://code.jquery.com/ui/1.14.1/jquery-ui.js"></script>
 <script>
   
      $(function() {
          CKEDITOR.replace('editor1', {
              height: 400
          });
      });
   
  </script>
  <script>
  	
	$(function() {

		<%--const placeId = $(this).children("input").val();--%>
		<%--const title = $(this).children("input").data("title");--%>
		
		<%--if ("${recommend.recomContenttype}" !== "FESTIVAL") {				--%>
	    <%--    const url = $(this).children("input").data("url");--%>
	    <%--    const address = $(this).children("input").data("address");--%>
	    <%--    const opentime = $(this).children("input").data("opentime");--%>
	    <%--    const subway = $(this).children("input").data("subway");--%>
	    <%--    --%>
	    <%--    $("#infotitle").text(title);--%>
	    <%--    $("#infourl").text(url);--%>
	    <%--    $("#infoaddress").text(address);--%>
	    <%--    $("#infoopentime").text(opentime);--%>
	    <%--    $("#infosubway").text(subway);--%>
		<%--}--%>
  		<%--else {--%>
        <%--const address = $(this).children("input").data("address1"); // addr1--%>
        <%--const startdate = $(this).children("input").data("startdate");--%>
        <%--const enddate = $(this).children("input").data("enddate");--%>

        <%--$("#infotitle").text(title);--%>
        <%--$("#infoaddress").text(address);--%>
        <%--$("#infostartdate").text(startdate);--%>
        <%--$("#infoenddate").text(enddate);--%>
    	<%--}--%>

		$( ".attach-list" ).sortable();
		//return true / false
		function validateFiles(files) {
			const MAX_COUNT = 5;
			const MAX_FILE_SIZE = 10 * 1024 * 1024 //10MB
			const MAX_TOTAL_SIZE = 50 * 1024 *1024 //50MB
			const BLOCK_EXT = ['exe', 'sh', 'jsp', 'java', 'class', 'html', 'js']

			if(files.length > MAX_COUNT) {
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

			if(!isValid) {
				alert("다음 파일확장자는 업로드가 불가합니다 [exe, sh, jsp, java, class, html, js] \n 또한 각 파일은 10MB이하 전체합계는 50MB 이하여야합니다")
			}
			return isValid;  
		}  //이것이 유효성 체크

		
	$(".attach-area").on("click", "i", function() {  
		// li가 실제로는 없기 때문에 위임을 해줘야하고, 그래서 attach-list에 주면됨. 그리고 on을 써서 실제로 이벤트주는건 i에 주는 거고, this는i를 가리킴
		const uuid = $(this).closest("[data-uuid]").data("uuid");
		$('[data-uuid="' + uuid + '"]').remove()
	});
		
		$("#f1").change(function() {

		
		
		/* $("#uploadForm").submit(function() { */
			event.preventDefault();  /* submit 막는거 */
			const formData = new FormData(); /* 일단 빈 객체로만듬 */
			
			console.log(formData);
			const files = this.files;
			for(let i = 0 ; i < files.length ; i ++) {
				formData.append("f1", files[i]); // 첨부파일은 boardWrite
			}
			// console.log(files);

			const valid = validateFiles([...files]);  //배열로 전개해서 해야함
			if(!valid) {
				return;
			}
			$.ajax({
				url : '${cp}/upload',
				method : 'POST',
				data : formData,
				processData : false, // data를 queryString으로 쓰지 않겠다
				contentType : false, // 내가 정의하지 않겠다. 내가 없으니까 거기에 있는 기본값을 가져오겠다 
				// 원래는 multipart/form-data;가 들어가야함. 이후에 나오게 될 브라우저 정보도 포함시킨다. 즉 기본 브라우저 설정을 따르는 옵션
				success : function(data) {
					console.log(data);
					// 확인용
					let str = "";
					let thumbStr = "";
					for(let a of data) {
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
							if(a.image) {  //해당 첨부파일일 이미지일때만 할거라는
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
			
		
		
			$("#writeForm").submit(function() {
			event.preventDefault();  /* submit 막는거 */
			const data = [];
			$(".attach-list li").each(function() {
				data.push({...this.dataset});
				
			});
			console.log(JSON.stringify(data));
			data.forEach((item, idx) => item.odr = idx);
			
			$("[name='encodedStr']").val(JSON.stringify(data));
			
			alert($(".form-check-input:checked").length);
			
			if($(".form-check-input:checked").length === 0) {
				alert("api를 선택하여 주세요.")
				return;
			}
			/* const type = $(".card-select").data("type"); 
			$("#writeForm").find("input[name='recomContenttype']").val(type);
			console.log($("#recomContenttype").val(type)); */
			this.submit();
		
			})
		})
	})

	</script>
<%@ include file="../common/footer.jsp" %>
</body>
</html>