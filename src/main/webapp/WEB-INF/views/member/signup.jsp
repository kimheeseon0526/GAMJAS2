<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<title>GAMJAS - 회원가입</title>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.7/js/bootstrap.min.js" integrity="sha512-zKeerWHHuP3ar7kX2WKBSENzb+GJytFSBL6HrR2nPSR1kOX1qjm+oHooQtbDpDBSITgyl7QXZApvDfDWvKjkUw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	<link rel="stylesheet" href="css/style.css">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
	
<meta charset="UTF-8">
<title>Insert title here</title>
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

<!-- 메인 콘텐츠: 회원가입 -->
<main class="join-container" style="max-width: 480px; margin: 60px auto; background: white; padding: 30px 25px; border-radius: 10px; box-shadow: 0 0 10px rgba(0,0,0,0.05);">
  <h4 class="text-center mb-4 fw-bold">회원가입</h4>
  
  <form method="post">
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
<%@ include file="../common/footer.jsp" %> 

</body>
</html>