<%@page import="domain.Station"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import = "java.util.List" %>
<%@ page import="domain.Station" %>
<!DOCTYPE html>
<%
 List<Station> stationList = (List<Station>) request.getAttribute("stationList");
%>

<html>
  <head>
    <script
      async
	  defer
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAvN6H-9eMfk0Xj3KFUeoH3dlklagm02f0&callback=initMap"
    ></script>
  
    <meta charset="utf-8" />
    <title>Google Map 기본 예제</title>
    <style>
      #map {
        height: 500px;
        width: 100%;
      }
    </style>
  </head>
  <body>
    <h2>GAMJAS 여행 플랫폼 지도 예제</h2>
    <div id="map"></div>

    <script>
    const stationData = [
      <% for (Station s : stationList) { %>
        { name: "<%=s.getId() %>", lat: <%=s.getLat() %>, lng: <%=s.getLng() %> },
      <% } %>
    ];

    function initMap() {
      const map = new google.maps.Map(document.getElementById("map"), {
        zoom: 12,
        center: { lat: 37.5665, lng: 126.9780 }
      });

      stationData.forEach(station => {
        new google.maps.Marker({
          position: { lat: station.lat, lng: station.lng },
          map: map,
          title: station.name
        });
      });
    }

    window.onload = initMap;
  </script>
  </body>
</html>