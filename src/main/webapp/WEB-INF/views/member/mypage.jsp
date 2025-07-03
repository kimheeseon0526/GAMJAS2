<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<body>
<!-- <%@ include file="common/nav.jsp" %> --%>
<div class="container mt-5">
    <h3 class="text-center mb-4">마이페이지</h3>

    <div class="row">
      <!-- 왼쪽 사이드 메뉴 -->
      <div class="col-md-3">
        <div class="bg-light p-3 rounded border">
          <ul class="nav flex-column">
            <li class="nav-item mb-2"><strong>- 회원정보 수정</strong></li>
            <li class="nav-item mb-2">- 나의 Like</li>
            <li class="nav-item mb-2">- 미션투어</li>
            <li class="nav-item mb-2">- 나의 후기</li>
            <li class="nav-item mb-2">- 나의 응모권</li>
            <li class="nav-item mb-2">- 감자마당 &lt; QnA</li>
          </ul>
        </div>
      </div>

      <!-- 오른쪽 회원정보 수정 영역 -->
      <div class="col-md-9">
        <h5 class="mb-4">* 회원정보 수정</h5>
        <form>
          <div class="mb-3 row">
            <label for="name" class="col-sm-2 col-form-label">이름</label>
            <div class="col-sm-10">
              <input type="text" class="form-control" id="name" value="김감자">
            </div>
          </div>

          <div class="mb-3 row">
            <label for="email" class="col-sm-2 col-form-label">이메일</label>
            <div class="col-sm-10">
              <div class="input-group">
                <span class="input-group-text">@</span>
                <input type="email" class="form-control" id="email" value="gamjas@gmail.com" disabled>
              </div>
              <div class="form-text text-danger">이메일은 수정이 불가능합니다.</div>
            </div>
          </div>

          <div class="mb-3 row">
            <label for="userid" class="col-sm-2 col-form-label">아이디</label>
            <div class="col-sm-10">
              <input type="text" class="form-control" id="userid" value="gamjas">
            </div>
          </div>

          <div class="mb-3 row">
            <label for="password" class="col-sm-2 col-form-label">비밀번호</label>
            <div class="col-sm-10">
              <input type="password" class="form-control" id="password" value="1234">
            </div>
          </div>

          <div class="mb-3 row">
            <label for="country" class="col-sm-2 col-form-label">국가</label>
            <div class="col-sm-10">
              <select class="form-select" id="country">
                <option selected disabled>국가를 선택하세요.</option>
                <option>대한민국</option>
                <option>미국</option>
                <option>일본</option>
                <option>중국</option>
                <option>기타</option>
              </select>
            </div>
          </div>

          <div class="text-end">
            <button type="submit" class="btn btn-success">수정하기</button>
          </div>
        </form>
      </div>
    </div>
  </div>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>


<!--  <%@ include file="common/footer.jsp" %> -->
</body>
</html>