<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.7/js/bootstrap.min.js" integrity="sha512-zKeerWHHuP3ar7kX2WKBSENzb+GJytFSBL6HrR2nPSR1kOX1qjm+oHooQtbDpDBSITgyl7QXZApvDfDWvKjkUw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="css/style.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

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

<!-- 메인 콘텐츠: 회원가입 -->
<main class="join-container" style="max-width: 480px; margin: 60px auto; background: white; padding: 30px 25px; border-radius: 10px; box-shadow: 0 0 10px rgba(0,0,0,0.05);">
  <h4 class="text-center mb-4 fw-bold">회원가입</h4>
  
  <form>
    <div class="mb-3">
      <label for="name" class="form-label">이름</label>
      <input type="text" class="form-control" id="name" placeholder="이름을 입력하세요">
    </div>
    
    <div class="mb-3">
      <label for="email" class="form-label"><span class="text-danger">*</span>이메일</label>
      <div class="input-group">
        <input type="email" class="form-control" id="email" placeholder="이메일을 입력하세요">
        <button class="btn" type="button" style="background-color:#afcb96;">인증코드 발송하기</button>
      </div>
    </div>

    <div class="mb-3">
      <label for="phone" class="form-label"><span class="text-danger">*</span>전화번호</label>
      <input type="text" class="form-control" id="phone" placeholder="전화번호를 입력하세요">
    </div>

    <div class="mb-3">
      <label for="username" class="form-label"><span class="text-danger">*</span>아이디</label>
      <input type="text" class="form-control" id="username" placeholder="아이디를 입력하세요">
    </div>

    <div class="mb-3">
      <label for="password" class="form-label"><span class="text-danger">*</span>비밀번호</label>
      <input type="password" class="form-control" id="password" placeholder="비밀번호를 입력하세요">
    </div>

    <div class="mb-3">
      <label for="country" class="form-label"><span class="text-danger">*</span>국가</label>
      <select class="form-select" id="country">
        <option selected disabled>국가를 선택하세요</option>
        <option>대한민국</option>
        <option>미국</option>
        <option>일본</option>
        <option>중국</option>
        <option>기타</option>
      </select>
    </div>

    <div class="d-grid">
      <button type="submit" class="btn btn-dark">가입하기</button>
    </div>
  </form>
</main>

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