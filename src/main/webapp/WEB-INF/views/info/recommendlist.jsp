<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
 <%@ include file="../common/head.jsp" %>
   <style>
    .search-container {
      position: relative;
      height: 38px;
    }
    .search-center {
      position: absolute;
      left: 50%;
      transform: translateX(-50%);
      display: flex;
      width: 376px;
      align-items: center;
    }
    .search-button {
      white-space: nowrap;
      padding: 0.25rem 0.6rem;
      line-height: 1.2;
  </style>
</head>
<body class="bg-light">
 <%@ include file="../common/nav.jsp" %>
  <div class="container my-3">
	  <!-- 탭 메뉴 -->
	  <ul class="nav nav-tabs mb-2 justify-content-center gap-5" id="infoTabs" role="tablist">
	    <li class="nav-item" role="presentation">
	      <button class="nav-link active px-4" id="place-tab" data-bs-toggle="tab" data-bs-target="#place" type="button" role="tab">관광</button>
	    </li>
	    <li class="nav-item" role="presentation">
	      <button class="nav-link px-4" id="food-tab" data-bs-toggle="tab" data-bs-target="#food" type="button" role="tab">체험</button>
	    </li>
	    <li class="nav-item" role="presentation">
	      <button class="nav-link px-4" id="experience-tab" data-bs-toggle="tab" data-bs-target="#experience" type="button" role="tab">먹거리</button>
	    </li>
	  </ul>
  </div>

<div class="container py-2">

  <!-- 🔍 검색바 + 📝 글쓰기 버튼 -->
  <div class="d-flex justify-content-between align-items-center mb-4 search-container">

    <!-- 글쓰기 버튼 오른쪽 고정 -->
    <div class="ms-auto">
      <a href="#" class="btn btn-primary btn-sm"><i class="fa-solid fa-pen-fancy"></i> 글쓰기</a>
    </div>

    <!-- 검색바 중앙 고정 -->
    <div class="search-center">
      <select class="form-select form-select-sm me-2" style="width: 70px;">
        <option selected>1</option>
        <option>2</option>
        <option>3</option>
      </select>
      <input type="text" class="form-control form-control-sm me-2" placeholder="검색어 입력">
      <a href="#" class="btn btn-outline-secondary btn-sm search-button">검색</a>
    </div>
  </div>

  <!-- 카드 목록 -->
  <div class="row row-cols-1 row-cols-md-3 g-4">
    <div class="col">
      <div class="card h-100">
        <img src="https://placehold.co/400x200" class="card-img-top" alt="장소 이미지">
        <div class="card-body">
          <h5 class="card-title">잠실한강공원</h5>
          <p class="card-text">도심 속 시민들의 휴식 공간</p>
        </div>
      </div>
    </div>
    <div class="col">
      <div class="card h-100">
        <img src="https://placehold.co/400x200" class="card-img-top" alt="장소 이미지">
        <div class="card-body">
          <h5 class="card-title">서울숲</h5>
          <p class="card-text">자연과 함께하는 힐링 공간</p>
        </div>
      </div>
    </div>
    <div class="col">
      <div class="card h-100">
        <img src="https://placehold.co/400x200" class="card-img-top" alt="장소 이미지">
        <div class="card-body">
          <h5 class="card-title">북촌한옥마을</h5>
          <p class="card-text">전통과 현대가 만나는 골목길</p>
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
<script>

</script>
 <%@ include file="../common/footer.jsp" %>
</body>
</html>
