<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
 <%@ include file="common/head.jsp" %>

</head>
<body>
  <!-- 헤더 -->
  <%@ include file="common/nav.jsp" %>

<!-- 메인 콘텐츠 시작 -->

<!-- 검색 + 슬라이드 병합 섹션 (위치 반전) -->
<section class="main-showcase" style="background-color:#eaf3ee; padding:60px 0;">
  <div class="container">
    <div class="row align-items-center">

      <!-- 왼쪽: 텍스트 + 검색창 -->
      <div class="col-md-5 text-center mb-4 mb-md-0">
        <div style="font-size:2rem; font-weight:700; line-height:1.4; margin-bottom: 20px;">
          <span style="color:#198754;">G</span>et <span style="color:#198754;">A</span> 
          <span style="color:#198754;">M</span>emorable <br>
          <span style="color:#198754;">J</span>ourney <span style="color:#198754;">A</span>round <span style="color:#198754;">S</span>eoul
        </div>
        <div class="search-bar d-flex justify-content-center">
          <input type="text" class="form-control" placeholder="여행지를 검색해보세요..."
                 style="max-width:300px; border-radius:6px 0 0 6px;">
          <button class="btn btn-outline-secondary" style="border-radius:0 6px 6px 0;">검색</button>
        </div>
      </div>

      <!-- 오른쪽: 슬라이드 이미지 영역 -->
      <div class="col-md-7">
        <div id="tourCarousel" class="carousel slide" data-bs-ride="carousel">
          <div class="carousel-inner">
            <div class="carousel-item active">
              <img src="https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&id=7386a327-b589-46d3-996a-7b91647b15cd&mode=raw"
                   class="d-block w-100" alt="슬라이드1"
                   style="border-radius:10px; object-fit:cover; height:400px;">
            </div>
            <div class="carousel-item">
              <img src="https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&id=dbcf217c-d89a-4e48-9d1a-48a549862569&mode=raw"
                   class="d-block w-100" alt="슬라이드2"
                   style="border-radius:10px; object-fit:cover; height:400px;">
            </div>
            <div class="carousel-item">
              <img src="https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&id=8927e35e-423c-4af2-9615-a8c2798cca13&mode=raw"
                   class="d-block w-100" alt="슬라이드3"
                   style="border-radius:10px; object-fit:cover; height:400px;">
            </div>
          </div>
          <button class="carousel-control-prev" type="button" data-bs-target="#tourCarousel" data-bs-slide="prev">
            <span class="carousel-control-prev-icon"></span>
          </button>
          <button class="carousel-control-next" type="button" data-bs-target="#tourCarousel" data-bs-slide="next">
            <span class="carousel-control-next-icon"></span>
          </button>
        </div>
      </div>

    </div>
  </div>
</section>

<!-- 메인 콘텐츠 끝 -->

<!-- 공지사항 및 이벤트 박스 스타일 -->
<section class="notice-banner py-5" style="background-color:#f9f9f9; border-top:1px solid #e0e0e0; border-bottom:1px solid #e0e0e0;">
  <div class="container">
    <div class="row g-4">
      <div class="col-md-3">
        <div class="p-4 bg-white border rounded-3 shadow-sm h-100">
          <a href="${cp}/board/view?bno=319&cno=3" style="text-decoration: none; color: black"><h5 class="mb-3 fw-bold">📢 공지사항</h5></a>
          <p class="mb-5 small text-secondary">감자마당 여름 이벤트 오픈! 지금 참여하고 감자티켓 받자 🥔</p>
        </div>
      </div>
      <div class="col-md-3">
        <div class="p-4 bg-white border rounded-3 shadow-sm h-100">
          <a href="${cp}/board/view?bno=314&cno=3" style="text-decoration: none; color: black"><h5 class="mb-3 fw-bold">📢 공지사항</h5></a>
          <p class="mb-0 small text-secondary">서울 인기 관광지 투표 이벤트 진행 중! 참여하면 선물이 팡팡!</p>
        </div>
      </div>
      <div class="col-md-3">
        <div class="p-4 bg-white border rounded-3 shadow-sm h-100">
          <a href="${cp}/board/view?bno=317&cno=3" style="text-decoration: none; color: black"><h5 class="mb-3 fw-bold">📢 공지사항</h5></a>
          <p class="mb-0 small text-secondary">뜨거운 여름날 이대로 보내기는 아쉽다! 추가 이벤트 오픈~</p>
        </div>
      </div>
      <div class="col-md-3">
        <div class="p-4 bg-white border rounded-3 shadow-sm h-100">
          <h5 class="mb-3 fw-bold">🎊 당첨자 발표 안내</h5>
          <p class="mb-0 small text-secondary">지난 달 응모권 추첨자 발표!</p>
        </div>
      </div>
      <div class="col-md-3">
        <div class="p-4 bg-white border rounded-3 shadow-sm h-100">
          <h6 class="mb-3 fw-bold"> 오늘 여기 어떠세요? 추천 관광지!🌉</h6>
          <p class="mb-0 small text-secondary">밤 야경 보러 한강가자~</p>
        </div>
      </div>
      <div class="col-md-3">
        <div class="p-4 bg-white border rounded-3 shadow-sm h-100">
          <h6 class="mb-3 fw-bold">오늘 여기 어떠세요? 추천 체험!🎈</h6>
          <p class="mb-0 small text-secondary">두근두근 공방 체험!</p>
        </div>
      </div>
      <div class="col-md-3">
        <div class="p-4 bg-white border rounded-3 shadow-sm h-100">
          <h6 class="mb-3 fw-bold">오늘 여기 어떠세요? 추천 먹거리!🍴</h6>
          <p class="mb-0 small text-secondary">먹거리 즐기러 전통시장 gogo~</p>
        </div>
      </div>
      <div class="col-md-3">
        <div class="p-4 bg-white border rounded-3 shadow-sm h-100">
          <h6 class="mb-3 fw-bold">오늘 여기 어떠세요? 추천 액티비티!🎠</h6>
          <p class="mb-0 small text-secondary">꿈과 환상이 가득한 어드벤쳐로~</p>
        </div>
      </div>
    </div>
  </div>

</section>
<%@ include file="common/footer.jsp" %>
</body>
</html>
