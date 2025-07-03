<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<body>

<!-- 메인 콘텐츠: 회원가입 -->
<main class="join-container" style="max-width: 480px; margin: 60px auto; background: white; padding: 30px 25px; border-radius: 10px; box-shadow: 0 0 10px rgba(0,0,0,0.05);">
  <h4 class="text-center mb-4 fw-bold">회원가입</h4>
  
  <form action="signup" method="post" id="signupForm">

    <div class="mb-3">
      <label for="username" class="form-label"><span class="text-danger">*</span>아이디</label>
      <input type="text" class="form-control" id="id" name="id" placeholder="아이디를 입력하세요">
    </div>

    <div class="mb-3">
      <label for="password" class="form-label"><span class="text-danger">*</span>비밀번호
      <input type="password" class="form-control" id="password" name="pw" placeholder="비밀번호를 입력하세요">
      </label>
    </div>

    <div class="mb-3">
      <label for="name" class="form-label">이름</label>
      <input type="text" class="form-control" id="name" name="name" placeholder="이름을 입력하세요">
    </div>
    
    <div class="mb-3">
      <label for="email" class="form-label"><span class="text-danger">*</span>이메일</label>
      <div class="input-group">
        <input type="email" class="form-control" id="email" name="email" placeholder="이메일을 입력하세요">
      </div>
    </div>
    
    <div class="mb-3">
      <label for="country" class="form-label"><span class="text-danger">*</span>국가</label>
      <select class="form-select" id="nation" name="nation">
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

<!-- <script>
$("#signupForm").submit(function() {
	alert("회원가입이 완료되었습니다!")
})
</script> -->

<!-- 푸터 -->
<%@ include file="../common/footer.jsp" %> 

</body>
</head>
</html>