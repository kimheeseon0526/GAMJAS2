<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>카카오 지도</title>

  <script type="text/javascript"
          src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=fcbe78d42e0a62f59f710bfb95704713&autoload=false">
  </script>
</head>
<body>
  
  <div id="map" style="width:500px; height:400px;"></div>
  <script>
    kakao.maps.load(function () {
      var container = document.getElementById('map');
      var options = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 서울시청
        level: 3
      };
      var map = new kakao.maps.Map(container, options);
    });
  </script>
</body>
</html>
