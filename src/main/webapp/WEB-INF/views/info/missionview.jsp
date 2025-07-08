<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix= "fmt"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../common/head.jsp" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/dayjs/1.11.13/dayjs.min.js" integrity="sha512-FwNWaxyfy2XlEINoSnZh1JQ5TRRtGow0D6XcmAWmYCRgvqOUTnzCxPc9uF35u5ZEpirk1uhlPVA19tflhvnW1g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/dayjs/1.11.13/locale/ko.min.js" integrity="sha512-ycjm4Ytoo3TvmzHEuGNgNJYSFHgsw/TkiPrGvXXkR6KARyzuEpwDbIfrvdf6DwXm+b1Y+fx6mo25tBr1Icg7Fw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/dayjs/1.11.13/plugin/relativeTime.min.js" integrity="sha512-MVzDPmm7QZ8PhEiqJXKz/zw2HJuv61waxb8XXuZMMs9b+an3LoqOqhOEt5Nq3LY1e4Ipbbd/e+AWgERdHlVgaA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</head>
<body>
<%@ include file="../common/header.jsp" %>
<%@ include file="../common/nav.jsp" %>
<div class="container p-0">
		<main>
		<div class="container my-3">
			  <!-- 탭 메뉴 -->
		  <form>
		  <ul class="nav nav-tabs mb-2 justify-content-center gap-5" id="infoTabs" role="tablist">
		    <li class="nav-item" role="presentation">
		      <a href="${cp}/info/recommendlist?recomContenttype=ATTRACTION" class="nav-link px-4 ${recommend.recomContenttype == 'ATTRACTION' ? 'active' : ''} " id="attraction-tab" type="button" role="tab">관광</a>
		    </li>
		    <li class="nav-item" role="presentation">
		      <a href="${cp}/info/recommendlist?recomContenttype=RESTAURANT"  class="nav-link px-4 ${recommend.recomContenttype == 'RESTAURANT' ? 'active' : ''} " id="restaurant-tab" type="button" role="tab">먹거리</a>
		    </li>
		    <li class="nav-item" role="presentation">
		      <a href="${cp}/info/recommendlist?recomContenttype=FESTIVAL" class="nav-link px-4 ${recommend.recomContenttype == 'FESTIVAL' ? 'active' : ''} " id="festival-tab" type="button" role="tab">체험</a>
		    </li>
		  </ul>
		  </form>
		  </div>
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

        <div class="small p-0 py-2">
       		<%-- <c:forEach items="${cate}" var="c">
		        <c:if test="${c.cno == cri.cno}">
		         <span class="px-2 border-end border-1"> ${c.cname} </span>
		        </c:if>
		      </c:forEach> --%>
		 
		            <span class="px-2">${mission.title}</span>
		    
            <%-- <div class="float-end small">
                <span class="text-muted"><i class="fa-solid fa-eye"></i>${board.cnt}</span>
                <span class="text-muted"><i class="fa-solid fa-comment-dots"></i> ${board.replyCnt}</span>
            </div> --%>
        </div>
        <div class="p-0 py-2 bg-light small border-top border-2 border-muted">
            <span class="px-2">작성자 : 관리자</span>
            <a href="${cp}/info/recommendlist" class="text-muted small">mission.html</a>
            <span class="float-end text-muted small me-3">${mission.regdatetime}</span>
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
		
		<div class="container my-4">
		  <div class="p-3 bg-light border rounded shadow-sm">
		    <p class="mb-0 fw-semibold text-secondary">${mission.summary}</p>
		  </div>
		</div>
		
		<div class="container my-4">
		  <div class="p-3 bg-light border rounded shadow-sm">
		    <p class="mb-0 fw-semibold text-secondary">${mission.content}</p>
		  </div>
		</div>
		
	    <div class="p-0 py-5 ps-1 small border-bottom border-1 border-muted"></div>
		<div class="mt-4">
		    <a href="${cp}/info/recommendlist?recomContenttype=${recommend.recomContenttype}&${cri.qsRecom}" class="btn btn-outline-secondary btn-sm">
		        <i class="fa-solid fa-list-ul"></i> 목록
		    </a>
		    <a href="${cp}/info/modify?recomNo=${recommend.recomNo}&${cri.qsRecom}" class="btn btn-outline-secondary btn-sm">
		        <i class="fa-solid fa-pen-to-square"></i> 수정
		    </a>
		    <a href="${cp}/info/remove?recomNo=${recommend.recomNo}&recomContenttype=${recommend.recomContenttype}&${cri.qsRecom}" class="btn btn-danger btn-sm" onclick="return confirm('삭제하시겠습니까?')">
		        <i class="fa-solid fa-trash-can"></i> 삭제
		    </a>
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
						<div class="my-2 bg-primary" style="height: 150px; background-size: cover; background-image:url('${cp}/display?uuid=t_${a.uuid}&path=${a.path}')">
							<%-- <i class="fa-solid fa-circle-xmark float-end text-danger m-2"></i> --%>
						</div>
					</div>
					</c:if>
					</c:forEach>
				</div>
			</div>
        </c:if>
			<div class="p-0 py-5 ps-1 small border-bottom border-1 border-muted"></div>
     </main>
  </div>
  
  <!--Modal 전체 -->
  <%-- <c:if test="${board.cViewType == 'FREE' or board.cViewType == 'REVIEW'}"> --%>
	 <%--  <div class="modal fade" id="reviewModal">
	  <div class="modal-dialog">
	    <div class="modal-content">
	
	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h4 class="modal-title">댓글 작성</h4>
	        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
	      </div>
	
	      <!-- Modal body -->
	      <div class="modal-body">
	        <form action="/action_page.php">
	            <div class="mb-3 mt-3">
	                <label for="content" class="form-label text-primary"><i class="fa-solid fa-comment"></i> 댓글 내용</label>
	                <textarea class="form-control resize-none" id="content" placeholder="Enter content" name="content" rows="5"></textarea>
	            </div>
	            <div class="mb-3">
	                <label for="writing" class="form-label text-primary"><i class="fa-solid fa-user"></i> 작성자</label>
	                <input type="text" class="form-control" id="writer" placeholder="Enter writer" name="writer" value="${member.id}" disabled="disabled">
	            </div>
	        </form>
	      </div>
	
	      <!-- Modal footer -->
	      <div class="modal-footer">
		   	<button type="button" class="btn btn-sm btn-write-submit" style="background-color: #4a5c48; color: white;">작성</button>
			<button type="button" class="btn btn-sm btn-write-submit" style="background-color: #6c7a68; color: white;">수정</button>
			<button type="button" class="btn btn-sm" style="background-color: #a94442; color: white;" data-bs-dismiss="modal">닫기</button>
		  </div>
	    </div>
	  </div>
	</div> --%>
	<%-- </c:if> --%>
	
	
<%@ include file="../common/footer.jsp" %>
	<script>
	
	$.ajaxSetup({
		contentType : 'application/json',
		dataType : 'json'
	})
	
		dayjs.extend(window.dayjs_plugin_relativeTime);
		dayjs.locale('ko');
		const dayForm = 'YYYY-MM-DD HH:mm:ss';
		dayjs('2025-06-20 15:40:44', dayForm).fromNow()
		
        $(function(){
        	const bno = '${board.bno}'
            const url = '${cp}' + '/reply/';
            const modal = new bootstrap.Modal($("#reviewModal").get(0), {})
            
            console.log("bno 값 체크:", '${board.bno}');
            //makeReplyLi(reply) > str
            
            function makeReplyLi(r){
            		return `
                     <li class="list-group-item ps-5 profile-img" data-rno="\${r.rno}">                             
                         <p class="small text-secondary">
                             <span class="me-3">\${r.id}</span>
                             <span class="mx-3">\${dayjs(r.regdate, dayForm).fromNow()}</span>                                   
                         </p>
                         <p class="small ws-pre-line">
                             \${r.content}</p>
                             <button class="btn btn-danger btn-sm float-end btn-remove-submit">
                             <i class="fa-solid fa-trash-can"></i> 삭제
                             </button>
                             <button class="btn btn-outline-secondary btn-sm float-end mx-3 btn-modify-form">수정</button>
                	</li>
                     `;
           }
            
            
            function list(bno, lastRno){
            	lastRno = lastRno ?  ('/' + lastRno) : '';
            	let reqUrl = url + 'list/' + bno + lastRno;
                $.ajax({
                    url: reqUrl,
                    success : function(data) {
                        if(!data || data.length === 0) {
                        	if($(".reviews li").length === 0) {// 처음부터 댓글이 없는 상태                        		
                        		$(".reviews").html('<li class ="list-group-item text-center text-muted">댓글이 없습니다</li>')
                        	}
                        	else{ //댓글은 원래 존재하지만, 더 가져올 것이 없는 경우
                        		$(".btn-reply-more").prop("disabled", true).text("추가 댓글이 없습니다.")
                        	}
                        	
                        	return;
                        }
                        $(".btn-reply-more").removeClass("d-none");
                        let str = '';
                        for(let r of data) {
                            console.log(r); 
                            str+= makeReplyLi(r);
                        }
                        $(".reviews").append(str); //얘는 현재 교체이다. 
                    }
                });
            }
            list(bno);

            // myModal.show();

            //글쓰기 폼 활성화 btn-write-form
            $(".btn-write-form").click(function(){
                console.log("글쓰기 폼");
                $("#reviewModal form").get(0).reset(); // 그전에 작성했던 내용을 reset으로 처리해버림
                modal.show();
                $("#reviewModal .modal-footer button").show().eq(1).hide(); //수정버튼만 숨기기
            });
            //글쓰기 버튼 이벤트 btn-write-submit
            $(".btn-write-submit").click(function(){
                const result = confirm("등록하시겠습니까?");
                if(!result) return;
                
                const content = $("#content").val().trim();
                const id = $("#writer").val().trim();
                
                const obj = {content, id, bno};
                console.log(obj);
                console.log("글쓰기 전송");
                $.ajax({
                    url ,
                    method : 'POST',
                    data : JSON.stringify(obj),
                    success : function(data) {
                        if(data.result) {
                            modal.hide();
                            //작성된 댓글
                            if(data.reply) { // not null. not undefined 
                            	data.reply.regdate = dayjs().format(dayForm);
                            	const strLi = makeReplyLi(data.reply); 
                            	$(".reviews").prepend(strLi);
                            }
                        }
                    }
                })
            });
            //글수정 폼 활성화 btn-modify-form
            $(".reviews").on("click", ".btn-modify-form", function(){
                console.log("글수정 폼");
                // console.log($(this).closest("li").data("rno"));
                const rno = $(this).closest("li").data("rno");
                $.getJSON(url + rno, function(data){
                    $("#reviewModal .modal-footer button").show().eq(0).hide();
                    $("#content").val(data.content);
                    $("#writer").val(data.id);
                    $("#reviewModal").data("rno", rno); // 이 친구의 역할은?
                    console.log(data);
                    modal.show();
                })
            })
            //글수정 버튼 이벤트 btn-modify-submit
            $(".btn-modify-submit").click(function(){
                const result = confirm("수정하시겠습니까?");
                if(!result) return;
                const rno = $("#reviewModal").data("rno");
                console.log(rno);

                const content = $("#content").val().trim();
                const id = $("#writer").val().trim();
                const obj = {content, id, rno};

                console.log("글수정 전송");
                $.ajax({
                    url : url + rno,
                    method : 'PUT' ,
                    data: JSON.stringify(obj),
                    success : function(data) {
                        if(data.result) { //data.result는 T/F스타일, 유튜브 댓글도 이런 스타일
                            modal.hide();
                            // get을 재호출 
                            $.getJSON(url + rno, function(data){
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
            $(".reviews").on("click", ".btn-remove-submit", function(){

                // return false; // false 기본 이벤트 제거 및 전파도 방지

                const result = confirm("삭제 하시겠습니까?")
                if(!result) return;
                const $li = $(this).closest("li")
                const rno = $li.data("rno");
                console.log("글삭제 전송");

                $.ajax({
                    url : url + rno,
                    method : 'DELETE' ,
                    success : function(data) {
                        if(data.result) { //data.result는 T/F스타일, 유튜브 댓글도 이런 스타일
                            $li.remove();
                        }
                    }
                })
                
            })
            
            //댓글 더보기 버튼 이벤트
            $(".btn-reply-more").click(function(){
            	//현재 댓글 목록중 마지막 댓글의 댓글 번호를 가져와 
            	// list(bno, lastRno)
/*             	const lastRno = $("li:last-of-type").value; */
            	const lastRno = $(".reviews li:last").data("rno");
            	console.log(lastRno)
            	list(bno, lastRno);
            });
        });
        
    </script>
</body>
</html>