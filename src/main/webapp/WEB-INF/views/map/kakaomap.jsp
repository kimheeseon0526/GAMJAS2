<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>

<script type="text/javascript"
       src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=6cc3b513c1123ed7909f8f5cf20cc721"></script>

<script>
  navigator.geolocation.getCurrentPosition(function(pos){
    console.log(pos);
    return function() {
      return pos;
    }
  });
  </script>
</head>
<body>
  <div id="map" style="width:100%;height:400px;"></div>
  
  <script>
      navigator.geolocation.getCurrentPosition(function(pos){
      
      var lat = pos.coords.latitude;
      var lng = pos.coords.longitude;

      var container = document.getElementById('map'),
      		options = {
		        center: new kakao.maps.LatLng(pos.coords.latitude, pos.coords.longitude), 
		        level: 3
      };
      
      var map = new kakao.maps.Map(container, options);
      
      var content = `
      <div style="font-size: 30px; color: green;">
      <i class="fa-solid fa-train-subway"></i>
      </div>
      `;

      var markerPosition  = new kakao.maps.LatLng(pos.coords.latitude, pos.coords.longitude);

      var marker = new kakao.maps.CustomOverlay({
                position: markerPosition,
                content : content,
                yAnchor: 1
            });
      CustomOverlay.setMap(map);
    });
      
      const stations = [
    	  {
    	    name: "강남역",
    	    lat: 37.4979,
    	    lng: 127.0276,
    	    line: "2호선"
    	  },
    	  {
    	    name: "서울역",
    	    lat: 37.5547,
    	    lng: 126.9706,
    	    line: "1호선"
    	  },
    	  {
    	    name: "홍대입구역",
    	    lat: 37.5572,
    	    lng: 126.9244,
    	    line: "2호선"
    	  }
    	];
  </script>
</body>
</html>