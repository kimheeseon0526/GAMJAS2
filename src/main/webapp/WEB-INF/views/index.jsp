<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>GAMJAS - 인덱스</title>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.7/js/bootstrap.min.js" integrity="sha512-zKeerWHHuP3ar7kX2WKBSENzb+GJytFSBL6HrR2nPSR1kOX1qjm+oHooQtbDpDBSITgyl7QXZApvDfDWvKjkUw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  <link rel="stylesheet" href="css/style.css">

  <!-- Bootstrap 5 -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

  <style>
    body {
      margin: 0;
      font-family: 'Noto Sans KR', sans-serif;
    }

    /* ====================== 헤더 ====================== */
    nav.gamjas-navbar {
      border-bottom: 1px solid #e0e0e0;
      background: #fff;
      padding: 10px 40px;
      position: relative;
      z-index: 100;
    }

    .main-header {
      display: flex;
      align-items: center;
      justify-content: space-between;
    }

    .main-menu-area {
      position: relative;
    }

    .main-menu {
      display: flex;
      justify-content: center;
      gap: 50px;
      list-style: none;
      margin: 0;
      padding: 0;
    }

    .main-menu > li > a {
      text-decoration: none;
      color: #000;
      font-weight: bold;
      padding: 10px 15px;
      transition: color 0.2s ease;
    }

    .main-menu > li > a:hover {
      color: #007bff;
    }

    /* ====================== 서브메뉴 ====================== */
    .mega-submenu {
      display: none;
      position: absolute;
      top: 155%;
      left: -70PX;
      width: 140%;
      background: #fff;
      border-top: 1px solid #ddd;
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.05);
      padding: 50px 80px;
      z-index: 99;
      justify-content: space-between;
    }

    .submenu-col {
      width: 50%;
    }

    .submenu-col strong {
      font-weight: bold;
      display: block;
      margin-bottom: 10px;
    }

    .submenu-col a {
      display: block;
      text-decoration: none;
      color: #000;
      margin-bottom: 8px;
      font-size: 0.95rem;
    }

    .submenu-col a:hover {
      color: #007bff;
    }

    .custom-language-dropdown {
        left: -5% !important;
        transform: translateX(-50%);
    }

    /* ====================== Hover Trigger ====================== */
    .main-menu-area:hover .mega-submenu {
      display: flex;
      animation: slideDown 0.3s ease-out;
    }

    @keyframes slideDown {
      from {
        opacity: 0;
        transform: translateY(-10px);
      }
      to {
        opacity: 1;
        transform: translateY(0);
      }
    }

    /* ====================== 오른쪽 로그인/언어 ====================== */
    .right-menu a {
      margin-left: 20px;
      text-decoration: none;
      color: #000;
      font-size: 0.95rem;
    }

    .language-dropdown .dropdown-toggle {
      font-size: 0.9rem;
    }

  </style>
</head>
<body>

  <!-- 헤더 -->
  <nav class="gamjas-navbar">
    <div class="main-header">
      <!-- 로고 -->
     
        <a style="width: 160px;" class="d-flex align-items-center" href="#"><img src="img/logo.svg" alt="#" style="width: 160px; height: 28px; "></a>
     

      <!-- 중앙 메뉴 -->
      <div class="main-menu-area">
        <ul class="main-menu">
          <li><a href="#">여행정보</a></li>
          <li><a href="#">미션투어</a></li>
          <li><a href="#">감자티켓</a></li>
          <li><a href="#">감자마당</a></li>
          <li><a href="#">Q&A</a></li>
        </ul>

        <!-- 통합 서브메뉴 -->
        <div class="mega-submenu">
          <div class="submenu-col">
            <strong>여행정보</strong>
            <a href="#">지하철 노선도</a>
            <a href="#">상세 여행정보</a>
          </div>
          <div class="submenu-col">
            <strong>미션투어</strong>
                <a href="#">관광</a>
            <a href="#">체험</a>
            <a href="#">먹거리</a>
          </div>
          <div class="submenu-col">
            <strong>감자티켓</strong>
            <a href="#">소개 & 이용안내</a>
            <a href="#">당첨자 발표</a>
          </div>
          <div class="submenu-col">
            <strong>감자마당</strong>
            <a href="#">자유게시판</a>
            <a href="#">생생후기</a>
            <a href="#">공지사항</a>
          </div>
          <div class="submenu-col">
            <strong>Q&A</strong>
            <a href="#">질문 게시판</a>
          </div>
        </div>
      </div>

      <!-- 로그인 & 언어 선택 -->
      <div class="right-menu d-flex align-items-center">
        <a href="#">로그인</a>
        <a href="#">회원가입</a>
        <a href="#"><i class="fa-regular fa-map text-secondary small"></i></a>
        <div class="dropdown language-dropdown ms-3">
          <a class="btn btn-sm btn-outline-secondary dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">
           <i class="fa-solid fa-globe text-secondary small me-1"></i> 한국어
          </a>
          <ul class="dropdown-menu custom-language-dropdown">
            <li><a class="dropdown-item" href="#">한국어</a></li>
            <li><a class="dropdown-item" href="#">영어</a></li>
            <li><a class="dropdown-item" href="#">중국어</a></li>
            <li><a class="dropdown-item" href="#">일본어</a></li>
          </ul>
        </div>
      </div>
    </div>
  </nav>
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
          <h5 class="mb-3 fw-bold">📢 공지사항</h5>
          <p class="mb-5 small text-secondary">감자마당 여름 이벤트 오픈! 지금 참여하고 감자티켓 받자 🥔</p>
        </div>
      </div>
      <div class="col-md-3">
        <div class="p-4 bg-white border rounded-3 shadow-sm h-100">
          <h5 class="mb-3 fw-bold">🎉 이벤트 안내</h5>
          <p class="mb-0 small text-secondary">서울 인기 관광지 투표 이벤트 진행 중! 참여하면 선물이 팡팡!</p>
        </div>
      </div>
      <div class="col-md-3">
        <div class="p-4 bg-white border rounded-3 shadow-sm h-100">
          <h5 class="mb-3 fw-bold">🎉 이벤트 안내</h5>
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

<!-- 푸터 -->
<footer style="background-color:#3d4c40; color:#ccc; font-size: 0.75rem; padding: 40px 0 20px; margin-top: auto;">
  <div class="container">
    <div class="row">
      <div class="col-md-5 mb-3">
       <h6 class="text-uppercase text-white">GAMJAS</h6>
       <p class="mb-1">Discover Seoul Through K-Culture — Where Every Stop Tells a Story</p>
       <p class="mb-1">지하철로 떠나는 K-컬처 여행, 서울의 진짜 매력을 만날 수 있는 외국인 맞춤 관광 커뮤니티</p>

      </div>
      <div class="col-md-2 mb-3">
        <h6 class="text-center text-white">바로가기</h6>
        <ul class="list-unstyled text-center">
          <li><a href="#" class="text-decoration-none text-light">여행정보</a></li>
          <li><a href="#" class="text-decoration-none text-light">미션투어</a></li>
          <li><a href="#" class="text-decoration-none text-light">감자마당</a></li>
          <li><a href="#" class="text-decoration-none text-light">Q&A</a></li>
        </ul>
      </div>
      <div class="col-md-3 mb-3">
        <h6 class="text-uppercase text-white">Contact</h6>
        <p class="mb-1"><i class="fa-regular fa-envelope"></i> Email: support@gamjas.com</p>
        <p class="mb-1"><i class="fa-solid fa-phone"></i> Tel: 02-1234-5678</p>
        <p class="mb-1"><i class="fa-solid fa-blog"></i> Blog</p>
        <p class="mb-1"><i class="fa-brands fa-instagram"></i> Instagram</p>
        <p class="mb-0"><i class="fa-solid fa-location-dot"></i> 서울특별시 강남구 감자대로 1길</p>
        <p class="mb-0"> 이용약관 | 개인정보처리정책 </p>
      </div>
    </div>
    <div class="text-align mt-0">
      <small class="text-light">&copy; 2025 GAMJAS. All rights reserved.</small>
    </div>
  </div>
</footer>
</body>
</html>
