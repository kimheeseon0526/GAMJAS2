
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="cp" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>GAMJAS - 지하철 노선도</title>
  <script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=6cc3b513c1123ed7909f8f5cf20cc721"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

  <%@ include file="../common/nav.jsp" %>
</head>

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
 <!--지도 -->
  <div id="map" style="width:50%; height:600px;"></div>
  

  <script>
  
  	//지도
  	const map = new kakao.maps.Map(document.getElementById("map"), {
      center: new kakao.maps.LatLng(37.5665, 126.9780), // 임의의 중심 좌표
      level: 6
    });

    let markers = [];
    let polyline = null;

    function clearMap() {
      markers.forEach(marker => marker.setMap(null));
      markers = [];
      if (polyline) {
        polyline.setMap(null);
        polyline = null;
      }
    }
    
    let currentInfoWindow = null;

    function renderStations(data) {
    	//console.log(data);
      const lineCoords = [];
      
      //5호선일 때 
      const mainLine = [];	//방화~ 하남검단
      const machunLine = [];	//강동~마천

      data.forEach(station => {
        const lat = parseFloat(station.LAT);
        const lng = parseFloat(station.LOT);
        const latlng = new kakao.maps.LatLng(lat, lng);
        lineCoords.push(latlng);

        const markerContent = document.createElement('div');
        markerContent.innerHTML = `<i class='fa-solid fa-train-subway' style='font-size:14px; color:\${station.lineColor}; cursor:pointer;'></i>`;
        markerContent.style.position = 'relative';
        markerContent.style.transform = 'translate(-50%, -50%)';
        markerContent.style.display = 'inline-block';

        const customOverlay = new kakao.maps.CustomOverlay({
          position: latlng,
          content: markerContent,
          map: map
        });
		
        //인포윈도우
        const infowindow = new kakao.maps.InfoWindow({
          content : `<div style="padding:3px 6px; font-size:12px; text-align:center;">\${station.BLDN_NM}</div>`,
          removable : true
        });
        
        

        markerContent.addEventListener('click', () => {
          infowindow.setPosition(latlng);
          infowindow.open(map);
        });
        markers.push(customOverlay);
      });

      if (data[0].ROUTE === "2호선" && lineCoords.length > 1) {
        lineCoords.push(lineCoords[0]);
      }
      
     /*  if(data[0].ROUTE === "5호선" && lineCoords.length > 1) {
    	  lineCoords
      }
       */
      

      polyline = new kakao.maps.Polyline({
        map: map,
        path: lineCoords,
        strokeWeight: 4,
        strokeColor: data[0].lineColor,
        strokeOpacity: 0.9,
        strokeStyle: 'solid'
      });
    }

    // 버튼 이벤트 등록 + fetch 호출
    document.querySelectorAll(".line-item button").forEach(btn => {
      btn.addEventListener("click", () => {
        const line = btn.value;	//각 호선
        fetch(`${cp}/lineinfo?lineName=\${line}`)
          .then(resp => resp.json())	//json으로 변환
          .then(data => {
            clearMap();
            renderStations(data);
          })
          .catch(err => {
            console.error("노선 정보 불러오기 실패:", err);
          });
      });
    });

    // 1호선 디폴트
    window.addEventListener("DOMContentLoaded", () => {
      const btn = document.querySelector("button[value='1호선']");
      console.log(btn.innerHTML);
      if (btn) btn.click();
    });
  </script>
  
<%@ include file="../common/footer.jsp" %> 
</body>
</html>


