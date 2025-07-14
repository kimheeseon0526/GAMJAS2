
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
  <style>
    html, body {margin: 0;padding: 0;min-height: 100vh;height: auto;overflow-y: auto;}
    #map-wrapper {min-height: 700px; /* 추가된 부분 */}
  </style>
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
  <div id = "map-wrapper" style="display: flex; justify-content: space-between; align-items: flex-start; gap: 24px; margin-top: 32px; margin-bottom: 64px; padding: 0 5%;">
    <div id="map" style="flex: 1; min-width: 600px; height: 600px; border-radius: 10px; box-shadow: 0 2px 8px rgba(0,0,0,0.1);"></div>
    <div id="mission-box" style="flex: 0.8; min-width: 280px; height: 600px; background: #f8f8f8; border-radius: 10px; box-shadow: 0 2px 6px rgba(0,0,0,0.08); padding: 20px;">
      <h3 style="margin-bottom: 12px;">추천 리스트</h3>
      <div id="recomm-content">마커를 클릭하면 정보가 표시됩니다.</div>
    </div>
  </div>
  

  <script>

    let openInfoWindow = null;  //인포 윈도우 초기화
  	const map = new kakao.maps.Map(document.getElementById("map"), {
      center: new kakao.maps.LatLng(37.5665, 126.9780), // 임의의 중심 좌표
      level: 6
    });

    let markers = []; //마커
    let polylines = [];  //폴리라인
    let placeOverlays = []	//place 마커

    function clearMap() {
      markers.forEach(marker => marker.setMap(null));
      markers = [];

      if (polylines) {
        polylines.forEach(pl => pl.setMap(null));
        polylines = [];
        
        placeOverlays.forEach(overlay => overlay.setMap(null));
        placeOverlays = [];

        if(openInfoWindow){
          openInfoWindow.close();
          openInfoWindow = null;
        }
      }
    }


    function renderStations(data) { //기본 단선
        const lineCoords = [];

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

            const infowindow = new kakao.maps.InfoWindow({
                content : `<div style="padding:3px 6px; font-size:12px; text-align:center;">\${station.BLDN_NM}</div>`,
                removable : true
            });
			
            markerContent.addEventListener('click', () => {
                if(openInfoWindow) openInfoWindow.close(); //인포윈도우 열려있으면 닫고
                infowindow.setPosition(latlng);
                infowindow.open(map);
                openInfoWindow = infowindow; //기존 인포윈도우를 openinfowindow로 저장
                
                fetchNearbyPlaces(station);	//장소 마커 표시 함수 호출
            });

            markers.push(customOverlay);
        });

      const isMainOfLoopLine = data?.[0]?.ROUTE === "2호선" && data?.length > 10; // main만 닫기 조건
      if (isMainOfLoopLine) {
        lineCoords.push(lineCoords[0]);
      }
        //단선 일반 라인 그리기
        const polyline = new kakao.maps.Polyline({
          map: map,
          path: lineCoords,
          strokeWeight: 4,
          strokeColor: data[0]?.lineColor || '#333',
          strokeOpacity: 0.9,
          strokeStyle: 'solid'
        });

        polylines.push(polyline);
        
        //타입별 아이콘 반환 태그
        function getFontAwesomeIcon(type) {
        	if(type === "restaurant") {
        		return  '<i class="fas fa-utensils" style="color:tomato; font-size:16px;"></i>';
        	}
	       	if (type === "festival") {
	       	    return '<i class="fas fa-music" style="color:orange; font-size:16px;"></i>';
	       	}
	       	if (type === "attraction") {
	       	    return '<i class="fas fa-camera" style="color:teal; font-size:16px;"></i>';
	       	}
	       	return '<i class="fas fa-map-marker-alt" style="color:gray; font-size:16px;"></i>';
       	}
        
        //주변 장소 마커 생성
        function drawPlaceMarkers(places) {
       	 // 기존 마커 제거
       	  placeOverlays.forEach(p => p.setMap(null));
       	  placeOverlays = [];

       	
        	//리스트 ui
        	const contentBox = document.getElementById("recomm-content");
        	contentBox.innerHTML = "";	//최초 한 번
    
        	
        	if(places.length === 0) {
        		contentBox.innerHTML = "<p>반경 1km 내의 추천 리스트가 없습니다</p>";
        		return;
        	}
        	
        	
  places.forEach(place => {
    const latlng = new kakao.maps.LatLng(place.lat, place.lng);

    const overlayContent = document.createElement('div');
    overlayContent.innerHTML = getFontAwesomeIcon(place.type);
    overlayContent.style.position = 'relative';
    overlayContent.style.transform = 'translate(-50%, -100%)';
    overlayContent.style.display = 'inline-block';
    overlayContent.style.cursor = 'pointer';

    const overlay = new kakao.maps.CustomOverlay({
      position: latlng,
      content: overlayContent,
      yAnchor: 1,
      map: map
    });
    placeOverlays.push(overlay);

    // 리스트 아이템
    const item = document.createElement("div");
    item.classList.add("recomm-card");
    
    item.innerHTML = `
      <h4 style="margin: 6px 0 4px;">\${place.title}</h4>
      <p style="font-size: 14px; color: #444;">\${place.addr}</p>
      <p style="font-size: 13px; color: #888;">\${place.type} • \${place.dist.toFixed(0)}m 거리</p>
    `;
    contentBox.appendChild(item);

    overlayContent.addEventListener('click', () => {
      map.panTo(latlng);
    });
  });
}

        
        //주변 장소 요청
        function fetchNearbyPlaces(station) {
        	console.log("클릭된 역 정보:", station);
        	$.ajax({
        		url : `${cp}/nearbyPlaces?stationName=\${station.BLDN_NM}`,
        		method : "GET",
        		success : function(data) {
        			drawPlaceMarkers(data);
        		},
        		error : function() {
        			alert("주변 장소 정보 못불러옴");
        		}
        	});
        }
        
        	
      //2호선 내부 순환(외선은 null처리)
        if (data[0].ROUTE === "2호선") {
          const first = data[0]; //시청
          const last = data[data.length - 1];  //충정로 마지막 인덱스

         data.forEach(segment => {
           segment.forEach(station => {
             const latlng = new kakao.maps.LatLng(parseFloat(station.LAT), parseFloat(station.LOT));
             allCoords.push(latlng);
           })
         })
          const closingLine = new kakao.maps.Polyline({
            map: map,
            path:  [allCoords[allCoords.length - 1], allCoords[0]],
            strokeWeight: 4,
            strokeColor: data[0]?.[0]?.lineColor || '#333',
            strokeOpacity: 0.9,
            strokeStyle: 'solid'
          });
            polylines.push(closingLine);
        }

    }


    // 버튼 이벤트 등록 + fetch 호출
    document.querySelectorAll(".line-item button").forEach(btn => {
      btn.addEventListener("click", () => {
        const line = btn.value;	//각 호선
        fetch(`${cp}/lineinfo?lineName=\${line}`)
          .then(resp => resp.json())	//json으로 변환
          .then(data => {
            console.log(data)
            clearMap();

            if (Array.isArray(data) && Array.isArray(data[0])) {
            	  data.forEach(segment => {
            	    renderStations(segment);
            	    // 한 구간씩 그리기
            	  });
            	} else {
            	  renderStations(data);
            	}
		      })
		      .catch(err => {
		    		  console.error("노선 정보 불러오기 실패:", err);
		          });
      			});
    		});
    // 초기 1호선 디폴트
    window.addEventListener("DOMContentLoaded", () => {
      const btn = document.querySelector("button[value='1호선']");
      console.log(btn.innerHTML);
      if (btn) btn.click();
    });

  </script>
<%@ include file="../common/footer.jsp" %> 
</body>
</html>


