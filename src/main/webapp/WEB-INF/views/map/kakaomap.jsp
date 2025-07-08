<%@ page language="java" contentType="text/html; charset=UTF-8"%>
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
    background: white; border: 1px solid #333; padding: 4px 8px; border-radius: 5px;
    font-size: 10px; box-shadow: 0px 2px 6px rgba(0, 0, 0, 0.2); color: black;}
</style>


<body>
  <div id="map" style="width:70%; height:600px;"></div>


 <!-- <script type="application/json" id="station-json">${stationList}</script> -->

  <script>
  
    const rawJson = document.getElementById("station-json").textContent.trim();
    const stationData = JSON.parse(rawJson);
	console.log(stationData) 
	
    const lineName = stationData[0].lineName?.trim();
    stationData.forEach(s => s.odr = Number(s.odr));

    const mainStations = stationData.filter(s => s.odr != null && !isNaN(s.odr));
    mainStations.sort((a, b) => a.odr - b.odr);

    const centerLat = parseFloat(mainStations[0].LAT);
    const centerLng = parseFloat(mainStations[0].LOT);

    const container = document.getElementById('map');
    
    const map = new kakao.maps.Map(container, {
      center: new kakao.maps.LatLng(centerLat, centerLng),
      level: 6
    });

    const lineCoords = [];

    mainStations.forEach((station) => {
      const lat = parseFloat(station.LAT);
      const lng = parseFloat(station.LOT);
      const latlng = new kakao.maps.LatLng(lat, lng);
      lineCoords.push(latlng);

      // 마커 content 생성
      const markerContent = document.createElement('div');
      markerContent.innerHTML = `<i class='fa-solid fa-train-subway' style='font-size:14px; color:${station.lineColor}; cursor:pointer;'></i>`;
      markerContent.style.position = 'relative';
      markerContent.style.transform = 'translate(-50%, -50%)';
      markerContent.style.display = 'inline-block';

      // 커스텀 오버레이로 마커 표시
      const customOverlay = new kakao.maps.CustomOverlay({
        position: latlng,
        content: markerContent,
        map: map
      });

      // 인포윈도우 생성
      const infowindow = new kakao.maps.InfoWindow({
        content : '<div style="padding:3px 6px; font-size:12px; text-align:center;">' + station.BLDN_NM + '</div>',
        removable : true
      });

      markerContent.addEventListener('click', () => {
        infowindow.setPosition(latlng);
        infowindow.open(map);
      });
    });

    if(lineName === "2호선" && lineCoords.length > 1){
      lineCoords.push(lineCoords[0]);
    }

    new kakao.maps.Polyline({
      map: map,
      path: lineCoords,
      strokeWeight: 4,
      strokeColor: stationData[0].lineColor,
      strokeOpacity: 0.9,
      strokeStyle: 'solid'
    });

    //역 클릭시 역이름 노출
    function showStationName(name, lat, lng) {
      const latlng = new kakao.maps.LatLng(lat, lng);
      const overlayContent = `<div class="station-label"> ${station.name}</div>`;

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
 
    console.log("역 개수:", stationData.length);
    console.log("순환선역 개수:", mainStations.length);
    console.log("mainStations:", mainStations);
  </script>
  
  <script>
  /* 버튼 클릭시, fetchfh 서버에 데이터 요청  */
  document.querySelectorAll(".line-btn").forEach(btn => {
	    btn.addEventListener("click", () => {
	      fetch(`/lineinfo?line=${btn.dataset.line}`)
	        .then(res => res.json())
	        .then(data => {
	        });
	    });
  
  </script>
</body>
</html>