<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- <head>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
</head> -->

<nav class="gamjas-navbar">
    <div class="main-header">
      <!-- 로고 -->
    
        <a  href="${cp}" style="width: 160px;" class="d-flex align-items-center"><img src="${cp}/img/logo.svg" alt="#" style="width: 160px; height: 28px; "></a>
     
      <!-- 중앙 메뉴 -->
      <div class="main-menu-area">
        <ul class="main-menu">
          <li><a href="#" >여행정보</a></li>
          <li><a href="${cp}/info/missionlist">미션투어</a></li>
          <li><a href="#" >감자티켓</a></li>
          <li><a href="${cp}/board/list" >감자마당</a></li>
          <li><a href="#" >Q&A</a></li>
        </ul>

        <!-- 통합 서브메뉴 -->
        <div class="mega-submenu">
          <div class="submenu-col">
            <a href="#">지하철 노선도</a>
            <a href="${cp}/info/recommendlist">상세 여행정보</a>
          </div>
          <div class="submenu-col">
                <a href="#">관광</a>
            <a href="#">체험</a>
            <a href="#">먹거리</a>
          </div>
          <div class="submenu-col">
            <a href="#">소개 & 이용안내</a>
            <a href="#">당첨자 발표</a>
          </div>
          <div class="submenu-col">
            <a href="${cp}/board/list?cno=${c.cno}">자유게시판</a>
            <a href="${cp}/board/list?cno=${c.cno}">생생후기</a>
            <a href="${cp}/board/list?cno=${c.cno}">공지사항</a>
          </div>
          <div class="submenu-col">
            <a href="#">질문 게시판</a>
          </div>
        </div>
      </div>

      <!-- 로그인 & 언어 선택 -->
      <div class="right-menu d-flex align-items-center">
      	<c:if test="${empty member}">
        <a href="${cp}/member/signin">로그인</a>
        <a href="${cp}/member/signup">회원가입</a>
        </c:if>
        
        <c:if test="${not empty member}">
        <a href="${cp}/member/logout">로그아웃</a>
        <a href="${cp}/member/mypage">마이페이지</a>
        </c:if>
        

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
