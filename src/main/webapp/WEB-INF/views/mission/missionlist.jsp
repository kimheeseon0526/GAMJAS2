<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
 <%@ include file="../common/head.jsp" %>
  
</head>
<body class="bg-light">
 <%@ include file="../common/nav.jsp" %>
  <div class="container my-5">
  <!-- 탭 메뉴 -->
  <ul class="nav nav-tabs mb-4 justify-content-center gap-2" id="infoTabs" role="tablist">
    <li class="nav-item" role="presentation">
      <button class="nav-link active px-4" id="place-tab" data-bs-toggle="tab" data-bs-target="#place" type="button" role="tab">명소</button>
    </li>
    <li class="nav-item" role="presentation">
      <button class="nav-link px-4" id="food-tab" data-bs-toggle="tab" data-bs-target="#food" type="button" role="tab">음식점</button>
    </li>
    <li class="nav-item" role="presentation">
      <button class="nav-link px-4" id="experience-tab" data-bs-toggle="tab" data-bs-target="#experience" type="button" role="tab">체험</button>
    </li>
  </ul>

  <!-- 검색창 -->
  <div class="input-group mb-5 w-50 mx-auto">
    <input type="text" class="form-control" placeholder="키워드를 입력하세요...">
    <button class="btn btn-outline-secondary" type="button">검색</button>
  </div>

  <!-- 탭 내용 -->
  <div class="tab-content" id="infoTabsContent">
    <!-- 명소 -->
    <div class="tab-pane fade show active" id="place" role="tabpanel" aria-labelledby="place-tab">
      <div class="row row-cols-1 row-cols-md-3 g-4">
        <div class="col">
          <div class="card h-100 shadow-sm">
            <img src="https://placehold.co/400x200" class="card-img-top" alt="관광지 이미지">
            <div class="card-body">
              <h5 class="card-title">잠실한강공원</h5>
              <p class="card-text">도심 속 시민들의 휴식 공간</p>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- 음식점 -->
    <div class="tab-pane fade" id="food" role="tabpanel" aria-labelledby="food-tab">
      <div class="row row-cols-1 row-cols-md-3 g-4">
        <div class="col">
          <div class="card h-100 shadow-sm">
            <img src="https://via.placeholder.com/400x200" class="card-img-top" alt="음식 이미지">
            <div class="card-body">
              <h5 class="card-title">또순이네집</h5>
              <p class="card-text">된장찌개와 한우가 일품인 집</p>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- 체험 -->
    <div class="tab-pane fade" id="experience" role="tabpanel" aria-labelledby="experience-tab">
      <div class="row row-cols-1 row-cols-md-3 g-4">
        <div class="col">
          <div class="card h-100 shadow-sm">
            <img src="https://via.placeholder.com/400x200" class="card-img-top" alt="체험 이미지">
            <div class="card-body">
              <h5 class="card-title">한복 체험</h5>
              <p class="card-text">전통시장에서 한복 입고 체험해보세요</p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
  
   <!-- 페이지네이션 -->
        <div class="mt-4 d-flex justify-content-center">
          <ul class="pagination">
	          <c:if test="${pageDto.doubleLeft}">
			  	<li class="page-item"><a class="page-link" href="list?&page=1&${pageDto.cri.qs}"><i class="fa-solid fa-angles-left"></i></a></li>
			  </c:if>
			  <c:if test="${pageDto.left}">
			  	<li class="page-item"><a class="page-link" href="list?page=${pageDto.start -1}&${pageDto.cri.qs}"><i class="fa-solid fa-angle-left"></i></a></li>
			  </c:if>
			  <c:forEach begin="${pageDto.start}" end="${pageDto.end}" var="i">
			  	<li class="page-item ${pageDto.cri.page  == i ? 'active' : ''}"><a class="page-link" href="list?page=${i}&${pageDto.cri.qs}">${i}</a></li>
			  </c:forEach>
			  <c:if test="${pageDto.right}">
			  	<li class="page-item"><a class="page-link" href="list?&page=${pageDto.end + 1}&${pageDto.cri.qs}"><i class="fa-solid fa-angle-right"></i></a></li>
			  </c:if>
			  <c:if test="${pageDto.doubleRight}">
			  	<li class="page-item"><a class="page-link" href="list?&page=${pageDto.realEnd}&${pageDto.cri.qs}"><i class="fa-solid fa-angles-right"></i></a></li>
			  </c:if>
          </ul>
        </div>
      </div>
<script>

</script>
 <%@ include file="../common/footer.jsp" %>
</body>
</html>
