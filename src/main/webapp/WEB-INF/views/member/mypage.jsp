<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri= "http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../common/head.jsp" %>
</head>
<body>
 <%@ include file="../common/nav.jsp" %>
<%-- <%@ include file="common/nav.jsp" %> --%>

<div class="container my-5">
  <h2 class="text-center fw-bold mb-5 text-success">마이페이지</h2>
  <div class="row">
    
    <!-- 사이드 메뉴 -->
    <div class="col-md-3 mb-4">
      <div class="bg-body border rounded shadow-sm p-3">
        <ul class="nav flex-column">
          <li class="nav-item mb-2"><a class="nav-link link-dark fw-semibold" href="#">회원정보 수정</a></li>
          <li class="nav-item mb-2"><a class="nav-link link-dark" href="#">나의 Like</a></li>
          <li class="nav-item mb-2"><a class="nav-link link-dark" href="#">미션투어</a></li>
          <li class="nav-item mb-2"><a class="nav-link link-dark" href="#">나의 후기</a></li>
          <li class="nav-item mb-2"><a class="nav-link link-dark" href="#">나의 응모권</a></li>
          <li class="nav-item mb-2"><a class="nav-link link-dark" href="#">감자마당 & QnA</a></li>
        </ul>
      </div>
    </div>

    <!-- 회원정보 수정 폼 -->
    <div class="col-md-9">
      <h5 class="mb-4 fw-bold border-start border-4 ps-3 border-success">회원정보 수정</h5>
      <form method="post">
        <div class="mb-3 row">
          <label for="name" class="col-sm-2 col-form-label">이름</label>
          <div class="col-sm-10">
            <input type="text" class="form-control" id="name" name="name" value="${member.name}">
          </div>
        </div>

        <div class="mb-3 row">
          <label for="email" class="col-sm-2 col-form-label">이메일</label>
          <div class="col-sm-10">
            <div class="input-group">
              <span class="input-group-text">@</span>
              <input type="email" class="form-control" id="email" name="email" value="${member.email}" disabled>
            </div>
            <div class="form-text text-danger">이메일은 수정이 불가능합니다.</div>
          </div>
        </div>

        <div class="mb-3 row">
          <label for="userid" class="col-sm-2 col-form-label">아이디</label>
          <div class="col-sm-10">
            <input type="text" class="form-control" id="userid" name="userid" value="${member.userid}">
          </div>
        </div>

        <div class="mb-3 row">
          <label for="pw" class="col-sm-2 col-form-label">비밀번호</label>
          <div class="col-sm-10">
            <input type="password" class="form-control" id="pw" name="pw" value="${member.pw}">
          </div>
        </div>

        <div class="mb-3 row">
          <label for="nation" class="col-sm-2 col-form-label">국가</label>
          <div class="col-sm-10">
            <select class="form-select" id="nation" name="nation">
              <option disabled selected>국가를 선택하세요.</option>
              <option ${member.nation == '대한민국' ? 'selected' : ''}>대한민국</option>
              <option ${member.nation == '미국' ? 'selected' : ''}>미국</option>
              <option ${member.nation == '일본' ? 'selected' : ''}>일본</option>
              <option ${member.nation == '중국' ? 'selected' : ''}>중국</option>
              <option ${member.nation == '기타' ? 'selected' : ''}>기타</option>
            </select>
          </div>
        </div>

        <div class="text-end">
          <button type="submit" class="btn btn-success px-4">수정하기</button>
        </div>
      </form>
    </div>
  </div>
</div>

<%@ include file="../common/footer.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<%-- <%@ include file="${cp}/common/footer.jsp" %> --%>
</body>
</html>
