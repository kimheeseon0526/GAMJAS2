<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>지하철 노선도</title>

<script type="text/javascript"
       src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=6cc3b513c1123ed7909f8f5cf20cc721"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

</head>
<body>
  <div id="map" style="width:100%;height:400px;"></div>

  <script>
  
  	  const stationData = JSON.parse('${stationList}'); 
  	  
  	  const mainStations = stationData.filter(s => s.odr != null && s.odr !== 'null');
      mainStations.sort((a, b) => a.odr - b.odr);
  
    	  
      const centerLat = parseFloat(mainStations[0].LAT);
      const centerLng = parseFloat(mainStations[0].LOT);

      const container = document.getElementById('map'),
      		options = {
		        center: new kakao.maps.LatLng(centerLat, centerLng), 
		        level: 6
      };
      
      const map = new kakao.maps.Map(container, options);
      

      //지하철 마커
      
      const lineCoords = [];
      
      mainStations.forEach(station => {
    	  const lat = parseFloat(station.LAT);
    	  const lng = parseFloat(station.LOT);
    	  const latlng = new kakao.maps.LatLng(lat, lng);
    	  lineCoords.push(latlng);
    	  
      //아이콘  
      const content = `
      <div style="font-size: 18px; color: #33cc66;">
      <i class="fa-solid fa-train-subway"></i>
      </div>
      `;
    	  
      const marker = new kakao.maps.CustomOverlay({
         position: latlng,
         content : content,
         yAnchor: 1,
    	 map : map
    	});
    });
      //순환선
      lineCoords.push(lineCoords[0]);
      
      //선 연결하기
      const polyline = new kakao.maps.Polyline({
    	  map : map,
    	  path : lineCoords,
    	  strokeWeight : 4,
    	  strokeColor : '#33cc66',
    	  strokeOpacity : 0.9,
    	  strokeStyle : 'solid'
    	  });

      
      console.log("🚇 역 개수:", stationData.length);
      console.log("✅ 순환선 메인 역 개수:", mainStations.length);
      console.log("📦 정렬된 mainStations:", mainStations);
  </script>
</body>
</html>