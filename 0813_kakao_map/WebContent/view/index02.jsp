<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Kakao 지도에 내 위치 표시하기</title>
<script type="text/javascript">
	navigator.geolocation.getCurrentPosition(function(position) {
		var lat = position.coords.latitude;
		var lng = position.coords.longitude;
		document.getElementById("lat").innerHTML = lat;
		document.getElementById("lng").innerHTML = lng;
	});
</script>
</head>
<body>
	위도 : <span id="lat"></span>, 경도 : <span id="lng"></span>
	<div id="map" style="width:500px;height:400px;"></div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b7d8630c1e0de1376ba149ff268140aa"></script>
	<script>
		var lat = document.getElementById("lat").innerHTML;
		var lng = document.getElementById("lng").innerHTML;
		var container = document.getElementById('map');
		var options = {
			center: new kakao.maps.LatLng(lat, lng),
			level: 1
		};

		var map = new kakao.maps.Map(container, options);
	</script>
</body>
</html>