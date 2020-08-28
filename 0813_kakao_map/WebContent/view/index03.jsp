<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 위치 지도 생성하기2</title>

</head>
<body>

	<!-- 지도를 표시할 div 입니다 -->
	<div id="map" style="width: 50%; height: 350px;"></div>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b7d8630c1e0de1376ba149ff268140aa"></script>
	<script type="text/javascript">
		navigator.geolocation.getCurrentPosition(function(position) {
			var lat = position.coords.latitude; // 위도
			var lng = position.coords.longitude;// 경도
			geo_mat(lat, lng)
		});
	</script>
	<script>
		function geo_mat(lat, lng) {

			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			mapOption = {
				center : new kakao.maps.LatLng(lat, lng), // 지도의 중심좌표
				level : 3
			// 지도의 확대 레벨
			};

			// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
			var map = new kakao.maps.Map(mapContainer, mapOption);
			
			// 마커가 표시될 위치입니다 
			var markerPosition  = new kakao.maps.LatLng(lat, lng); 

			// 마커를 생성합니다
			var marker = new kakao.maps.Marker({
			    position: markerPosition
			});

			// 마커가 지도 위에 표시되도록 설정합니다
			marker.setMap(map);
			var iwContent = '<div style="padding:5px;">현재내위치</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
		    iwPosition = new kakao.maps.LatLng(lat, lng); //인포윈도우 표시 위치입니다
		    //iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

			// 인포윈도우를 생성하고 지도에 표시합니다
			var infowindow = new kakao.maps.InfoWindow({
		    position : iwPosition, 
		    content : iwContent,
			});		
		    
		    // 마커 위에 인포윈도우 표시, 두번째 파라미터인 marker을 넣어주지 않으면 지도 위에 표시됨
		   	infowindow.open(map,marker);
			
		}
	</script>
</body>
</html>