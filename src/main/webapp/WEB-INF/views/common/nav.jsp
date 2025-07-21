<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<head>
<%@ include file="../common/head.jsp" %>
</head>

<nav class="gamjas-navbar">
    <div class="main-header">
      <!-- 로고 -->
    
        <a  href="${cp}" style="width: 160px;" class="d-flex align-items-center"><img src="${cp}/img/logo.svg" alt="#" style="width: 160px; height: 28px; "></a>
     
      <!-- 중앙 메뉴 -->
      <div class="main-menu-area">
        <ul class="main-menu">
          <li><a href="${cp}/map/lineinfodetail" >여행정보</a></li>
          <li><a href="${cp}/info/missionlist">미션투어</a></li>
          <li><a href="${cp}/ticket/info" >감자티켓</a></li>
          <li><a href="${cp}/board/list" >감자마당</a></li>
          <li><a href="${cp}/board/list?cno=4" >QNA</a></li>
        </ul>

        <!-- 통합 서브메뉴 -->
        <div class="mega-submenu">
          <div class="submenu-col">
            <a href="${cp}/map/lineinfodetail">지하철 노선도</a>
            <a href="${cp}/info/recommendlist">상세 여행정보</a>
          </div>
          <div class="submenu-col">
                <a href="#">관광</a>
            <a href="#">체험</a>
            <a href="#">먹거리</a>
          </div>
          <div class="submenu-col">
            <a href="${cp}/ticket/info">소개 & 이용안내</a>
            <a href="${cp}/board/list?cno=5">당첨자 발표</a>
          </div>
         <div class="submenu-col">
			  <c:forEach items="${cate}" var="c">
			    <c:if test="${c.CViewType == 'FREE' || c.CViewType == 'REVIEW' || c.CViewType == 'NOTICE' and c.cname != '당첨자 발표'}">
			      <a href="${cp}/board/list?cno=${c.cno}" class="d-block mb-1">${c.cname}</a>
			    </c:if>
			  </c:forEach>
		</div>
		<div class="submenu-col">
		  <c:forEach items="${cate}" var="c">
		    <c:if test="${c.CViewType == 'QNA'}">
		      <a href="${cp}/board/list?cno=${c.cno}" class="d-block mb-1">${c.cname}</a>
		    </c:if>
		  </c:forEach>
		</div>
      </div>
    </div>

      <!-- 로그인 & 언어 선택 -->
      <div class="right-menu d-flex align-items-center">
      	<c:if test="${empty loginMember}">
        <a href="${cp}/member/signin">로그인</a>
        <a href="${cp}/member/signup">회원가입</a>
        </c:if>
        
        <c:if test="${not empty loginMember}">
         <a>${loginMember.name}님</a>
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
