
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

</style>

<script type="application/json" id="station-json">${stationDetailList}</script>

<body>

  <!-- 노선 버튼 영역 -->
  <div class="line-selectors">
  	<div class="line-wrap" style="display: flex; gap: 12px; flex-wrap: wrap;">
  <div class="line-item">
    <button style="background-color: #0052A4;" value="1호선">1</button><span>1호선</span></div>
  <div class="line-item">
    <button style="background-color: #00A84D;" value="2호선">2</button><span>2호선</span></div>
  <div class="line-item">
    <button style="background-color: #EF7C1C;" value="3호선">3</button><span>3호선</span></div>
  <div class="line-item">
    <button style="background-color: #00A4E3;" value="4호선">4</button><span>4호선</span></div>
  <div class="line-item">
    <button style="background-color: #996CAC;" value="5호선">5</button><span>5호선</span></div>
  <div class="line-item">
    <button style="background-color: #CD7C2F;" value="6호선">6</button><span>6호선</span></div>
  <div class="line-item">
    <button style="background-color: #747F00;" value="7호선">7</button><span>7호선</span></div>
  <div class="line-item">
    <button style="background-color: #E6186C;" value="8호선">8</button><span>8호선</span></div>
  <div class="line-item">
    <button style="background-color: #BDB092;" value="9호선">9</button><span>9호선</span></div>
</div>
  </div>
  
 
  <div class="map-container" style="display: flex;">
  <c:set var="stationList" value="${stationDetailList}" />
  <%@ include file="../map/kakaomap.jsp" %>
  <div id="nearby-info" style="margin: 30px; padding: 10px;"></div>
  </div>
  
<!--   <script>
    // 버튼 클릭 시 loadLine 함수 호출
    document.querySelectorAll(".line-item button").forEach(btn => {
      btn.addEventListener("click", () => {
        if (typeof loadLine === 'function') {
          loadLine(btn.value); // 전역 함수 호출
        } else {
          console.error("loadLine 함수가 정의되지 않았습니다!");
        }
      });
    });
  </script> -->

  



<%@ include file="../common/footer.jsp" %> 
</body>
</html>
