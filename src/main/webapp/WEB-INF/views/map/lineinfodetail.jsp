<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="cp" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>GAMJAS - 지하철 노선도</title>

  <!-- Kakao Map SDK -->
  <script src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=6cc3b513c1123ed7909f8f5cf20cc721"></script>

  <!-- FontAwesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

  <%@ include file="../common/nav.jsp" %>

  <style>
    html, body {
      margin: 0;
      padding: 0;
      min-height: 100vh;
    }
    #map-wrapper {
      min-height: 700px;
    }
  </style>
</head>

<body>

<!-- 노선 버튼 -->
<div class="line-selectors">
  <div class="line-wrap" style="display:flex; gap:12px; flex-wrap:wrap;">
    <c:forEach var="i" begin="1" end="9">
      <div class="line-item">
        <button value="${i}호선">${i}</button>
        <span>${i}호선</span>
      </div>
    </c:forEach>
  </div>
</div>

<!-- 지도 영역 -->
<div id="map-wrapper"
     style="display:flex; gap:24px; margin:32px 5% 64px;">
  <div id="map"
       style="flex:1; min-width:600px; height:600px;
              border-radius:10px; box-shadow:0 2px 8px rgba(0,0,0,0.1);">
  </div>

  <div id="mission-box"
       style="flex:0.8; min-width:280px; height:600px;
              background:#f8f8f8; border-radius:10px;
              box-shadow:0 2px 6px rgba(0,0,0,0.08); padding:20px;">
    <h3>추천 리스트</h3>
    <div id="recomm-content">마커를 클릭하면 정보가 표시됩니다.</div>
  </div>
</div>

<script>
  /* =============================
     지도 기본 설정
  ============================= */
  const map = new kakao.maps.Map(document.getElementById("map"), {
    center: new kakao.maps.LatLng(37.5665, 126.9780),
    level: 6
  });

  let markers = [];
  let polylines = [];
  let placeOverlays = [];
  let openInfoWindow = null;

  /* =============================
     지도 초기화
  ============================= */
  function clearMap() {
    markers.forEach(m => m.setMap(null));
    polylines.forEach(p => p.setMap(null));
    placeOverlays.forEach(p => p.setMap(null));

    markers = [];
    polylines = [];
    placeOverlays = [];

    if (openInfoWindow) {
      openInfoWindow.close();
      openInfoWindow = null;
    }
  }

  /* =============================
     노선 렌더링
  ============================= */
  function renderStations(data) {
    const lineCoords = [];

    data.forEach(station => {
      const latlng = new kakao.maps.LatLng(
              parseFloat(station.LAT),
              parseFloat(station.LOT)
      );
      lineCoords.push(latlng);

      const markerEl = document.createElement("div");
      markerEl.innerHTML =
              `<i class="fa-solid fa-train-subway"
          style="font-size:14px; color:${station.lineColor}; cursor:pointer;"></i>`;
      markerEl.style.transform = "translate(-50%, -50%)";

      const overlay = new kakao.maps.CustomOverlay({
        position: latlng,
        content: markerEl,
        map
      });

      const info = new kakao.maps.InfoWindow({
        content: `<div style="padding:4px;font-size:12px;">${station.BLDN_NM}</div>`
      });

      markerEl.onclick = () => {
        if (openInfoWindow) openInfoWindow.close();
        info.open(map, overlay);
        openInfoWindow = info;
        fetchNearbyPlaces(station);
      };

      markers.push(overlay);
    });

    // 2호선 순환선 닫기
    if (data[0]?.ROUTE === "2호선" && lineCoords.length > 1) {
      lineCoords.push(lineCoords[0]);
    }

    const polyline = new kakao.maps.Polyline({
      map,
      path: lineCoords,
      strokeWeight: 4,
      strokeColor: data[0]?.lineColor || "#333",
      strokeOpacity: 0.9
    });

    polylines.push(polyline);
  }

  /* =============================
     주변 장소
  ============================= */
  function getIcon(type) {
    if (type === "restaurant") return "🍴";
    if (type === "festival") return "🎵";
    if (type === "attraction") return "📷";
    return "📍";
  }

  function drawPlaceMarkers(places) {
    placeOverlays.forEach(p => p.setMap(null));
    placeOverlays = [];

    const box = document.getElementById("recomm-content");
    box.innerHTML = "";

    if (!places.length) {
      box.innerHTML = "<p>추천 장소가 없습니다.</p>";
      return;
    }

    places.forEach(p => {
      const latlng = new kakao.maps.LatLng(p.lat, p.lng);

      const el = document.createElement("div");
      el.innerText = getIcon(p.type);
      el.style.cursor = "pointer";

      const overlay = new kakao.maps.CustomOverlay({
        position: latlng,
        content: el,
        map
      });

      placeOverlays.push(overlay);

      const item = document.createElement("div");
      item.innerHTML = `<b>${p.title}</b><br>${p.addr}`;
      box.appendChild(item);

      el.onclick = () => map.panTo(latlng);
    });
  }

  function fetchNearbyPlaces(station) {
    $.get(
            `${cp}/nearbyPlaces`,
            { stationName: station.BLDN_NM },
            drawPlaceMarkers
    );
  }

  /* =============================
     버튼 이벤트
  ============================= */
  document.querySelectorAll(".line-item button").forEach(btn => {
    btn.onclick = () => {
      fetch(`${cp}/lineinfo?lineName=${btn.value}`)
              .then(r => r.json())
              .then(data => {
                clearMap();
                if (Array.isArray(data[0])) {
                  data.forEach(renderStations);
                } else {
                  renderStations(data);
                }
              });
    };
  });

  /* =============================
     초기 로딩
  ============================= */
  window.onload = () => {
    document.querySelector("button[value='1호선']")?.click();
  };
</script>

<%@ include file="../common/footer.jsp" %>
</body>
</html>
