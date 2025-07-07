<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.7/js/bootstrap.min.js" integrity="sha512-zKeerWHHuP3ar7kX2WKBSENzb+GJytFSBL6HrR2nPSR1kOX1qjm+oHooQtbDpDBSITgyl7QXZApvDfDWvKjkUw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="css/style.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<body>

<!-- 메인 콘텐츠: 회원가입 -->

<main class="join-container"
      style="max-width: 480px; margin: 60px auto; background: white; padding: 30px 25px; border-radius: 10px; box-shadow: 0 0 10px rgba(0,0,0,0.05);">
  <h4 class="text-center mb-4 fw-bold">회원가입</h4>
  
  <form action="signup" method="post" id="signupForm">

    <!-- 아이디 -->
    <div class="mb-3">
      <label for="id" class="form-label fw-semibold">
        <span class="text-danger">*</span> 아이디
      </label>
      <input type="text" class="form-control border border-success-subtle" id="id" name="id" placeholder="아이디를 입력하세요">
    </div>

    <!-- 비밀번호 -->
    <div class="mb-3">
      <label for="password" class="form-label fw-semibold">
        <span class="text-danger">*</span> 비밀번호
      </label>
      <input type="password" class="form-control border border-success-subtle" id="password" name="pw" placeholder="비밀번호를 입력하세요">
    </div>

    <!-- 이름 -->
    <div class="mb-3">
      <label for="name" class="form-label fw-semibold">
     <span class="text-danger">*</span> 이름</label>
      <input type="text" class="form-control border border-success-subtle" id="name" name="name" placeholder="이름을 입력하세요">
    </div>

    <!-- 이메일 -->
    <div class="mb-3">
      <label for="email" class="form-label fw-semibold">
        <span class="text-danger">*</span> 이메일
      </label>
      <div class="input-group">
        <input type="email" class="form-control border border-success-subtle" id="email" name="email" placeholder="이메일을 입력하세요">
      </div>
    </div>

    <!-- 국가 -->
    <div class="mb-4">
      <label for="nation" class="form-label fw-semibold">
        <span class="text-danger">*</span> 국가
      </label>
      <select class="form-select border border-success-subtle" id="nation" name="nation">
        <option selected disabled>국가를 선택하세요</option>
        <option>대한민국</option>
        <option>미국</option>
        <option>일본</option>
        <option>중국</option>
        <option>기타</option>
      </select>
    </div>
    
    <!-- 약관 동의 -->
    <h4>약관 동의</h4>
  <label>
    <input type="checkbox" name="terms1" id="terms1">
    (필수) 이용약관에 동의합니다
  </label><br>
  <label>
    <input type="checkbox" name="terms2" id="terms2">
    (필수) 개인정보 수집 및 이용에 동의합니다
  </label><br>


    <!-- 버튼 -->
    <div class="d-grid">
      <button type="submit" class="btn" style="background-color:#6A8D73; color:#fff;">
        가입하기
      </button>
    </div>
  </form>
</main>


<!-- 푸터 -->
<%@ include file="../common/footer.jsp" %> 

</body>
</head>
</html>