<%@page import="domain.info.Recommend"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.google.gson.Gson" %>
<%@ page import="domain.en.RecommendContentType" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix= "fmt"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../common/head.jsp" %>
<script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=6cc3b513c1123ed7909f8f5cf20cc721""></script>
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
      
        <div class="small p-0 py-2">
		    <c:forEach items="${recommendlist}" var="r">
		    	<c:if test="${r.recomNo == recommend.recomNo}">
		            <span class="px-2">${r.title}</span>
		    	</c:if>    
		    </c:forEach>
        </div>
        <div class="p-0 py-2 bg-light small border-top border-2 border-muted">
            <span class="px-2">작성자 : 관리자</span>
            <a href="${cp}/info/recommendlist" class="text-muted small">recommend.html</a>
            <span class="float-end text-muted small me-3">${recommend.regdatetime}</span>
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
			           	<div class="fw-bold">대표 이미지</div><br>
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
		<!-- 지도 영역  -->
		<!-- 노선 버튼 영역 -->
		  <div class="line-selectors">
		  	<div class="line-wrap" style="display: flex; gap: 12px; flex-wrap: wrap;">
		  	<c:set var="printedline" value=""></c:set>
		  	<c:forEach items="${stations}" var="s">
		  		<c:if test="${not fn: contains(printedline, s.stationLine) }">
				<c:choose>
					<c:when test="${s.stationLine == '1호선'}">
					  <div class="line-item">
					    <button style="background-color: #0052A4;" value="1호선">1</button><span>1호선</span></div>
					</c:when>
					<c:when test="${s.stationLine == '2호선'}">
					  <div class="line-item">
					    <button style="background-color: #00A84D;" value="2호선">2</button><span>2호선</span></div>
					 </c:when>
					 <c:when test="${s.stationLine == '3호선'}">
					  <div class="line-item">
					    <button style="background-color: #EF7C1C;" value="3호선">3</button><span>3호선</span></div>
					 </c:when>
					 <c:when test="${s.stationLine == '4호선'}">
					  <div class="line-item">
					    <button style="background-color: #00A4E3;" value="4호선">4</button><span>4호선</span></div>
					 </c:when>
					 <c:when test="${s.stationLine == '5호선'}">
					  <div class="line-item">
					    <button style="background-color: #996CAC;" value="5호선">5</button><span>5호선</span></div>
					  </c:when>
					  <c:when test="${s.stationLine == '6호선'}">  
					  <div class="line-item">
					    <button style="background-color: #CD7C2F;" value="6호선">6</button><span>6호선</span></div>
					  </c:when> 
					  <c:when test="${s.stationLine == '7호선'}">
					  <div class="line-item">
					    <button style="background-color: #747F00;" value="7호선">7</button><span>7호선</span></div>
					  </c:when>
					  <c:when test="${s.stationLine == '8호선'}">
					  <div class="line-item">
					    <button style="background-color: #E6186C;" value="8호선">8</button><span>8호선</span></div>
					  </c:when>
					  <c:when test="${s.stationLine == '9호선'}">  
					  <div class="line-item">
					    <button style="background-color: #BDB092;" value="9호선">9</button><span>9호선</span></div>
					  </c:when>
					  <c:otherwise></c:otherwise> 
			    </c:choose>
			    <c:set var="printedline" value="${printedline},${s.stationLine}"></c:set>
			    </c:if>
		    </c:forEach>
		    <span id="printed-line" style="display:none">${printedline}</span>
		  </div>
		  </div>
		<div id="map" style="flex: 1; min-width: 600px; height: 600px; border-radius: 10px; box-shadow: 0 2px 8px rgba(0,0,0,0.1);"></div>
		
		<!-- 추가 컨텐츠 영역 -->
		<div class="container my-4">
		  <div class="p-3 bg-light border rounded shadow-sm">
		    <p class="mb-0 fw-semibold text-secondary">${recommend.apiSubcontent}</p>
		  </div>
		</div>
		
	    <div class="p-0 py-5 ps-1 small border-bottom border-1 border-muted"></div>
		<div class="mt-4">
		    <a href="${cp}/info/recommendlist?recomContenttype=${recommend.recomContenttype}&${cri.qsRecom}" class="btn btn-outline-secondary btn-sm">
		        <i class="fa-solid fa-list-ul"></i> 목록
		    </a>
		    <c:if test="${loginMember.memNo == recommend.memNo}">
			    <a href="${cp}/info/modify?recomNo=${recommend.recomNo}&${cri.qsRecom}" class="btn btn-outline-secondary btn-sm">
			        <i class="fa-solid fa-pen-to-square"></i> 수정
			    </a>
		    </c:if>
		    <c:if test="${loginMember.memNo == recommend.memNo}">
			    <a href="${cp}/info/remove?recomNo=${recommend.recomNo}&recomContenttype=${recommend.recomContenttype}&${cri.qsRecom}" class="btn btn-danger btn-sm" onclick="return confirm('삭제하시겠습니까?')">
			        <i class="fa-solid fa-trash-can"></i> 삭제
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
  
  
<%@ include file="../common/footer.jsp" %>
<script type="application/json" id="recommend-json">
	  <%= new Gson().toJson(request.getAttribute("recommend")) %>
</script>
<script type="application/json" id="station-json">
	  <%= new Gson().toJson(request.getAttribute("stations")) %>
</script>
<script type="application/json" id="place-json">
		<%
			 Recommend recommend = (Recommend)request.getAttribute("recommend");
			  Gson gson = new Gson();
			  switch(recommend.getRecomContenttype()) {
			    case ATTRACTION:
			      out.print(gson.toJson(request.getAttribute("attraction")));
			      break;
			    case RESTAURANT:
			      out.print(gson.toJson(request.getAttribute("restaurant")));
			      break;
			    case FESTIVAL:
			      out.print(gson.toJson(request.getAttribute("festival")));
			      break;
			  }
		%>
</script>
<script type="application/json" id="subway-json">
	  <%= new Gson().toJson(request.getAttribute("subway")) %>
</script> 
<script>
	const lines = $("#printed-line").text().split(",").filter(line => line && /^\d/.test(line));
	console.log(lines);
	
	lines.sort(function(a, b){
		let num1 = parseInt(a);
		let num2 = parseInt(b); 
		return num1 - num2;
	})
	console.log(lines);
	
	
	
</script>
<script>
	let openInfoWindow = null;  //인포 윈도우 초기화
	
	const recommend = JSON.parse(document.getElementById("recommend-json").textContent); //recommend 객체 대한 정보
	const stations = JSON.parse(document.getElementById("station-json").textContent); // recommend 객체 한 개와 연결된 역 리스트 정보 
	const subway = JSON.parse(document.getElementById("subway-json").textContent); // 전체 역 정보
	//const place = JSON.parse(document.getElementById("place-json").textContent); // 추천 명소의 lat, lng 값을 접근하기 위한 정보
	const latlng =  new kakao.maps.LatLng(stations[0].lat, stations[0].lng); // 추천 명소 기준 lat, lng 값
	console.log(recommend);
	
  	const map = new kakao.maps.Map(document.getElementById("map"), {
      center: latlng, // 임의의 중심 좌표
      level: 5
    });
  	
  	function getFontAwesomeIcon(type) {
    	if(type === "RESTAURANT") {
    		return  `<i class="fas fa-utensils" style="color:tomato; font-size:24px; cursor:pointer;"></i>`;
    	}
       	if (type === "FESTIVAL") {
       	    return `<i class="fas fa-music" style="color:orange; font-size:24px; cursor:pointer;"></i>`;
       	}
       	if (type === "ATTRACTION") {
       	    return `<i class="fas fa-camera" style="color:teal; font-size:24px; cursor:pointer;"></i>`;
       	}
       	return '<i class="fas fa-map-marker-alt" style="color:gray; font-size:24px; cursor:pointer;"></i>';
   	}
	
  	
  	
  	const markerContent = document.createElement('div');
  	markerContent.innerHTML = getFontAwesomeIcon(recommend.recomContenttype);
  	markerContent.style.position = 'relative';
    markerContent.style.transform = 'translate(-50%, -50%)';
    markerContent.style.display = 'inline-block';
    
	const overlay = new kakao.maps.CustomOverlay({
	    content: markerContent,
	    map: map,
	    position: latlng     
	});
  	
	console.log(recommend.recomContenttype);
	
	const infowindow = new kakao.maps.InfoWindow({
		content: 
			`<div style="display:table;table-layout:fixed;width:280px;font-size:13px;text-align:center;word-wrap:break-word;word-break:break-word;white-space:normal;">
				<div style="display:table-row;">
					<p style="margin:0;font-weight:bold;">${stations[0].title}</p>
					<hr style="margin:5px 0;">
				</div>
					<div style="display:table-cell;padding:5px;">
					<p style="margin:0;">${stations[0].addr}</p>
				</div>
			</div>`,
        removable : true
    });
	
	markerContent.addEventListener('click', function() {
	    if (openInfoWindow) openInfoWindow.close(); // 이전 인포윈도우 닫기
	    infowindow.setPosition(latlng);             // 위치 지정
	    infowindow.open(map);               
	    openInfoWindow = infowindow;
	});
	
	function closeOverlay() {
	    infowindow.setMap(null);     
	}
	
	console.log(stations);
	
	
	
	stations.forEach(function(station){
		openInfoWindow = null;
		
		const realStation = subway.find(s => s.BLDN_ID === station.stationId);
		console.log("station.stationId: ", station.stationId);
		console.log("realStation 확인:", realStation);
		
		const markerPosition = new kakao.maps.LatLng(realStation.LAT, realStation.LOT);
		
		const subwayContent = document.createElement('div');
		subwayContent.innerHTML = `<i class='fa-solid fa-train-subway' style='font-size:24px; color:${realStation.lineColor}; cursor:pointer;'></i>`;
		subwayContent.style.position = 'relative';
		subwayContent.style.transform = 'translate(-50%, -50%)';
		subwayContent.style.display = 'inline-block';
		
		const infowindow = new kakao.maps.InfoWindow({
		content: 
			`<div style="width:250px; font-size:13px; background:white; border:1px solid #888; border-radius:6px; padding:10px; text-align:center;">
		      <p style="margin:0; font-weight:bold;">${realStation.BLDN_NM}</p>
		      <hr style="margin:5px 0;">
		      <p style="margin:0;">${realStation.ROUTE}</p>
		    </div>`,
		    removable : true
    	});
		console.log("BLDN_NM:", realStation.BLDN_NM);
		console.log("ROUTE:", realStation.ROUTE);
		
		const subwayMarker = new kakao.maps.CustomOverlay({
			position: markerPosition,
			content: subwayContent,
			map: map
		})
		 subwayMarker.setMap(map);
		
		
		 subwayContent.addEventListener("click", function () {
			    if (openInfoWindow) openInfoWindow.close();
			    infowindow.setPosition(markerPosition);
			    infowindow.open(map);
			    openInfoWindow = infowindow;
			  });
	})
	
</script>
</body>
</html>