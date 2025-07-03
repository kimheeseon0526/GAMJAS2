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

<body>
 <main class="login-container d-flex justify-content-center align-items-center" style="min-height: 80vh;">
 <div class="p-4 px-5 bg-white shadow-sm rounded-4 border" style="border-color: #6a983c; border-width: 1px;">
    <div class="text-center mb-4">
      <i class="fa-regular fa-circle-check fa-lg" style="color: #213144;"></i>
      <h5 class="fw-bold d-inline-block ms-2">로그인</h5>
    </div>


    <form method="post" action="${cp}/member/signin">

      <div class="mb-3">

        <label for="username" class="form-label">아이디</label>
        <input type="text" class="form-control" id="id" name="id" placeholder="아이디를 입력하세요" required>
      </div>
      <div class="mb-4">
        <label for="password" class="form-label">비밀번호</label>
        <input type="password" class="form-control" id="password" name="pw" placeholder="비밀번호를 입력하세요" required>

      </div>
      <div class="d-grid">
        <button type="submit" class="btn" style="background-color:#6A8D73; color:#fff;">로그인</button>
      </div>
    </form>
  </div>
</main>
</body>
</html>