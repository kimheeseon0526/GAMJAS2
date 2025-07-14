<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="../common/head.jsp" %>
</head>
<body>
<%@ include file="../common/header.jsp" %>
<body class="bg-light">
<%@ include file="../common/nav.jsp" %>
<%-- <div class="container my-3">
     <!-- 탭 메뉴 -->
     <form>
     <ul class="nav nav-tabs mb-2 justify-content-center gap-5" id="infoTabs" role="tablist">
       <li class="nav-item" role="presentation">
         <a href="${cp}/info/recommendlist?recomContenttype=ATTRACTION" class="nav-link px-4 ${recommend.recomContenttype == 'QNA' ? 'active' : ''} " id="attraction-tab" type="button" role="tab">소개 & 이용안내</a>
       </li>
       <li class="nav-item" role="presentation">
         <a href="${cp}/info/recommendlist?recomContenttype=RESTAURANT"  class="nav-link px-4 ${recommend.recomContenttype == 'QNA' ? 'active' : ''} " id="restaurant-tab" type="button" role="tab">당첨자 발표</a>
       </li>
--%>
<div class="container my-5">
    <div class="card p-4 shadow-sm" style="font-size:0.95rem;">
        <h2 class="text-center mb-4 fw-bold text-success">🎫 감자티켓 소개 & 이용안내</h2>

        <!-- 🎟️ 개요 설명 -->
        <div class="alert alert-success">
            <strong>감자티켓</strong>은 본 플랫폼에서 제공하는 <u>K-컬처 미션, 투어 프로그램, 이벤트</u> 등에 참여함으로써 획득할 수 있는 리워드형 디지털 티켓입니다.<br/>
            티켓은 <strong>매월 열리는 경품 이벤트, 우수 참여자 보상, 스페셜 굿즈 교환</strong> 등에 사용되며,
            외국인 관광객 여러분의 적극적인 참여를 유도하기 위한 포인트 시스템입니다.
        </div>

        <!-- 🥔 감자티켓이란? -->
        <div class="mb-4">
            <h4 class="text-success">감자티켓이란?</h4>
            <p>
                감자티켓은 본 커뮤니티 플랫폼의 활동에 따라 자동으로 누적되는 디지털 응모권입니다.<br/>
                예를 들어, <strong>미션 투어 인증, 후기 게시글 작성, 추천 장소 등록</strong> 등 다양한 활동을 통해 얻을 수 있으며,<br/>
                응모 가능한 이벤트 페이지에서 <strong>보유 티켓을 사용하여 추첨 이벤트에 참여</strong>할 수 있습니다.
            </p>
            <p>
                누적된 티켓은 <strong>마이페이지 &gt; 감자티켓</strong> 메뉴에서 확인할 수 있으며,<br/>
                티켓은 매월 1일 기준으로 초기화될 수 있습니다.<br/>
                <span class="text-danger fw-bold">※ 유효기간 내에 반드시 사용해 주세요.</span>
            </p>
        </div>

        <!-- 📋 이용안내 -->
        <div class="mb-4">
            <h4 class="text-success">이용안내</h4>
            <ul class="list-group">
                <li class="list-group-item">✅ 티켓 1장 = 이벤트 1회 응모 가능</li>
                <li class="list-group-item">🎁 당첨 시 <strong>K-컬처 굿즈 또는 체험 쿠폰</strong>이 제공됩니다</li>
                <li class="list-group-item">📅 티켓은 <strong>매월 말 소멸</strong>될 수 있으며, 공지를 통해 안내됩니다</li>
                <li class="list-group-item text-danger fw-bold">🔁 응모에 사용된 티켓은 회수되지 않으며, <u>취소가 불가능</u>합니다</li>
                <li class="list-group-item">👤 마이페이지에서 <strong>보유 티켓과 당첨 여부</strong>를 확인할 수 있습니다</li>
            </ul>
        </div>

        <!-- 📢 당첨자 발표 안내 -->
        <div class="alert alert-secondary">
            🏆 <strong>당첨자 발표</strong>는 매월 마지막 주 <strong>[감자티켓 &gt; 당첨자 발표]</strong> 메뉴에서 확인하실 수 있습니다.<br/>
            당첨자는 등록된 이메일 또는 마이페이지를 통해 개별 연락을 드립니다.
        </div>

        <!-- 🔗 바로가기 버튼 -->
        <div class="text-center mt-4">
            <a href="${cp}/board/list?cno=5" class="btn btn-lg"
               style="background:#648D73; color:white; transition:0.05s"
               onpointerdown="this.style.transform='scale(.95)',setTimeout(()=>this.style.transform='scale(1)',100)">
                📢 당첨자 발표 바로가기
            </a>
        </div>
    </div>
</div>


<%@ include file="../common/footer.jsp" %>
