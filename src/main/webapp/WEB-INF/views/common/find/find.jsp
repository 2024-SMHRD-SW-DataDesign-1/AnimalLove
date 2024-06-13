<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=45ed770bdfa1cc4cd6cc25dc8ff866b7&libraries=services,clusterer,drawing">

	</script>
	<script type="text/javascript">
    // 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
    

	    var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	        mapOption = {
	            center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
	            level: 3 // 지도의 확대 레벨
	        };  
	
	
	    // 지도를 생성합니다    
	    var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	    setMap(map);	
	</script>
	<input id="mapValue" type="text" style="width:500px;" onkeypress="SendData(event)">
	
	<button id="adressSearch" onClick="search()">찾기</button>
	<div id="mapContainer">
		<div id="menu_wrap">
			<ul id="placesList"></ul>
			<div id="pagination"></div>
			
		</div>
		<c:import url="../map/map.jsp"></c:import>
	</div>
</body>
</html>