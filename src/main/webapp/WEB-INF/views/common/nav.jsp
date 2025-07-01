<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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