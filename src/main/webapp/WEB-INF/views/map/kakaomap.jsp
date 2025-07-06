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
<style>
  .station-label {
    background: white;
    border: 1px solid #333;
    padding: 4px 8px;
    border-radius: 5px;
    font-size: 13px;
    box-shadow: 0px 2px 6px rgba(0, 0, 0, 0.2);
    color: black;
  }
</style>
<body>
  <div id="map" style="width:100%;height:400px;"></div>

  
  <script type="application/json" id="station-json">
  ${stationList}
</script>

  <script>
	  const rawJson = document.getElementById("station-json").textContent.trim();
	  const stationData = JSON.parse(rawJson);
	  
	  const lineName = stationData[0].lineName?.trim();
	  stationData.forEach(s => s.odr = Number(s.odr));
	  
  	  const mainStations = stationData.filter(s => s.odr != null && !isNaN(s.odr));
      mainStations.sort((a, b) => a.odr - b.odr); //타입 숫자로 변환 -> 근데 이미 integer 타입인데..
    	  
      const centerLat = parseFloat(mainStations[0].LAT);
      const centerLng = parseFloat(mainStations[0].LOT);

      const container = document.getElementById('map');
      const map = new kakao.maps.Map(container, {
        center: new kakao.maps.LatLng(centerLat, centerLng),
        level: 6
      });
      
      const lineCoords = [];
     
      //지하철 마커
      mainStations.forEach((station, index) => {
    	  const lat = parseFloat(station.LAT);
    	  const lng = parseFloat(station.LOT);
    	  const latlng = new kakao.maps.LatLng(lat, lng);
    	  lineCoords.push(latlng);
    	  
    	  
      //아이콘  
      const markerElement = document.createElement('div');
	      markerElement.style.fontSize = "14px";
	      markerElement.style.color = "#33cc66";
	      markerElement.style.cursor = "pointer";
	      markerElement.innerHTML = `<i class="fa-solid fa-train-subway"></i>`;
	      //markerElement.addEventListener('click', () => showStationName(station.BLDN_NM, lat, lng));
	      markerElement.onclick = () => showStationName(station.BLDN_NM, lat, lng);

    	  
      new kakao.maps.CustomOverlay({
      position: latlng,
      content : markerElement,
      yAnchor: 1,
 	  map : map
    	});
      });
      
      if(lineName === "2호선" && lineCoords.length > 1){
    	  lineCoords.push(lineCoords[0]);
      }
      
      new kakao.maps.Polyline({
          map: map,
          path: lineCoords,
          strokeWeight: 4,
          strokeColor: '#33cc66',
          strokeOpacity: 0.9,
          strokeStyle: 'solid'
        });
      
      //역 클릭시 역이름 노출
      function showStationName(name, lat, lng) {
      const latlng = new kakao.maps.LatLng(lat, lng);
      const overlayContent = `<div class="station-label"> ${name}</div>`;
    	 
      
      const markerOverlay = new kakao.maps.CustomOverlay({
	  position : latlng,
	  content : overlayContent,
	  yAnchor: 1.8,
      zIndex: 5 
    }); 
      
      markerOverlay.setMap(map);
      setTimeout(() => markerOverlay.setMap(null), 2000);
      
      console.log("역:", name, lat, lng);
      }
      
      //순환선
      lineCoords.push(lineCoords[0]);
      
      
      console.log("역 개수:", stationData.length); // 총 50개
      console.log("순환선역 개수:", mainStations.length); //외부 선 제외 43개
      console.log("mainStations:", mainStations); //순환선 리스트
  </script>
</body>
</html>