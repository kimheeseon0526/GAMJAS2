
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
  <div id = "map-wrapper" style="display: flex; justify-content: space-between; align-items: flex-start; gap: 24px; margin-top: 32px; margin-bottom: 64px; padding: 0 5%;">
    <div id="map" style="flex: 1; min-width: 600px; height: 600px; border-radius: 10px; box-shadow: 0 2px 8px rgba(0,0,0,0.1);"></div>
    <div id="mission-box" style="flex: 0.8; min-width: 280px; height: 600px; background: #f8f8f8; border-radius: 10px; box-shadow: 0 2px 6px rgba(0,0,0,0.08); padding: 20px;">
      <h3 style="margin-bottom: 12px;">미션 리스트</h3>
      <div id="mission-content">역을 선택하면 미션이 표시됩니다.</div>
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

    function clearMap() {
      markers.forEach(marker => marker.setMap(null));
      markers = [];

      if (polylines) {
        polylines.forEach(pl => pl.setMap(null));
        polylines = [];
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
            markerContent.innerHTML = `<i class='fa-solid fa-train-subway' style='font-size:14px; color:${station.lineColor}; cursor:pointer;'></i>`;
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
            });

            markers.push(customOverlay);
        });
        //단선 일반 라인 그리기
        const polyline = new kakao.maps.Polyline({
          map: map,
          path: lineCoords,
          strokeWeight: 4,
          strokeColor: data[0].lineColor,
          strokeOpacity: 0.9,
          strokeStyle: 'solid'
        });

        polylines.push(polyline);

      //2호선 내부 순환(외선은 null처리)
        if (data[0].ROUTE === "2호선") {
          const first = data[0]; //시청
          const last = data[data.length - 1];  //충정로 마지막 인덱스

          const firstLatLng = new kakao.maps.LatLng(parseFloat(first.LAT), parseFloat(first.LOT));
          const lastLatLng = new kakao.maps.LatLng(parseFloat(last.LAT), parseFloat(last.LOT));

          const closingLine = new kakao.maps.Polyline({
            map: map,
            path: [lastLatLng, firstLatLng],
            strokeWeight: 4,
            strokeColor: last.lineColor,
            strokeOpacity: 0.9,
            strokeStyle: 'solid'
          });
            polylines.push(closingLine);
        }

    }

    //5호선 전용 함수
    function renderStationsY(hanamLine, machunLine) {
        [hanamLine, machunLine].forEach(branch => {
            const lineCoords = [];

            branch.forEach(station => {
                const lat = parseFloat(station.LAT);
                const lng = parseFloat(station.LOT);
                const latlng = new kakao.maps.LatLng(lat, lng);
                lineCoords.push(latlng);

                const markerContent = document.createElement('div');
                markerContent.innerHTML = `<i class='fa-solid fa-train-subway' style='font-size:14px; color:${station.lineColor}; cursor:pointer;'></i>`;
                markerContent.style.position = 'relative';
                markerContent.style.transform = 'translate(-50%, -50%)';
                markerContent.style.display = 'inline-block';

                const customOverlay = new kakao.maps.CustomOverlay({
                    position: latlng,
                    content: markerContent,
                    map: map
                });

                const infowindow = new kakao.maps.InfoWindow({
                    content : `<div style="padding:3px 6px; font-size:12px; text-align:center;">${station.BLDN_NM}</div>`,
                    removable : true
                });

                markerContent.addEventListener('click', () => {
                  if(openInfoWindow) openInfoWindow.close();
                    infowindow.setPosition(latlng);
                    infowindow.open(map);
                    openInfoWindow = infowindow;
                })
                markers.push(customOverlay);
            })
            const polyline = new kakao.maps.Polyline({
                map: map,
                path: lineCoords,
                strokeWeight: 4,
                strokeColor: branch[0].lineColor,
                strokeOpacity: 0.9,
                strokeStyle: 'solid'
            });

            polylines.push(polyline);
        })

    }

    // 버튼 이벤트 등록 + fetch 호출
    document.querySelectorAll(".line-item button").forEach(btn => {
      btn.addEventListener("click", () => {
        const line = btn.value;	//각 호선
        fetch(`${cp}/lineinfo?lineName=\${line}`)
          .then(resp => resp.json())	//json으로 변환
          .then(data => {
            console.log(data)
            const hanamLine = data.hanamLine;
            const machunLine = data.machunLine;
            clearMap();
            console.log("하남 : ", data.hanamLine)
            console.log("마천 : ", data.hanamLine)

            if(data.hanamLine && data.machunLine) {
              renderStationsY(data.hanamLine, data.machunLine);
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


