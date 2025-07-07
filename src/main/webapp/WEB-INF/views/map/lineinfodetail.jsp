
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>GAMJAS - 지하철 노선도</title>
  <script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=6cc3b513c1123ed7909f8f5cf20cc721"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

  <%@ include file="../common/nav.jsp" %>
</head>
<style>
.line-wrapper { display: flex; justify-content: center; gap: 16px; margin: 20px 0; margin-top: 40px;}

  .line-item { display: flex; flex-direction: column;align-items: center;}

  .line-item button { width: 48px; height: 48px; border-radius: 50%; border: none; color: white; font-weight: bold; font-size: 16px; cursor: pointer;}

  .line-item span { margin-top: 6px; font-size: 14px; font-weight: bold;}
</style>

<script type="application/json" id="station-json">${stationDetailLsit}</script>
<body>

  <!-- 노선 버튼 영역 -->
  <div class="line-selectors">
  	<div class="line-item">
	    <button class="line-btn line-1" data-line="1" style="background-color: #0052A4;">1</button><span>1호선</span></div>
	<div class="line-item">
	    <button class="line-btn line-2" data-line="2" style="background-color: #009D3E;">2</button><span>2호선</span></div>
	<div class="line-item">
	    <button class="line-btn line-3" data-line="3" style="background-color: #EF7C1C;">3</button><span>3호선</span></div>
	<div class="line-item">
	    <button class="line-btn line-4" data-line="4" style="background-color: #00A5DE;">4</button><span>4호선</span></div>
	<div class="line-item">
	    <button class="line-btn line-5" data-line="5" style="background-color: #996CAC;">5</button><span>5호선</span></div>
	<div class="line-item">
	    <button class="line-btn line-5" data-line="6" style="background-color: #CD7C2F;">6</button><span>6호선</span></div>
	<div class="line-item">
	    <button class="line-btn line-5" data-line="7" style="background-color: #747F00;">7</button><span>7호선</span></div>
	<div class="line-item">
	    <button class="line-btn line-5" data-line="8" style="background-color: #E6186C;">8</button><span>8호선</span></div>
	<div class="line-item">
	    <button class="line-btn line-5" data-line="9" style="background-color: #BDB092;">9</button><span>9호선</span></div>
  </div>
  
 
  <div class="container" style="display: flex;">
  <img src="${cp}/img/all.jpg" alt="지하철 전체 노선도" style= "width :1000px; height: 700px;">
  </div>
  <!-- 역 주변 장소 정보 표시 영역 -->
  <div id="nearby-info" style="margin: 30px; padding: 10px;"></div>
  
  



<%@ include file="../common/footer.jsp" %> 
</body>
</html>
