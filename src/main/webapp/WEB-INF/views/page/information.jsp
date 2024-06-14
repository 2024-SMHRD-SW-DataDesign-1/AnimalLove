<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=45ed770bdfa1cc4cd6cc25dc8ff866b7&libraries=services,clusterer,drawing"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<style type="text/css">

	body {
		height : 70vh;
	}
	
	#info_inner{

		height : 100%;
		display :flex;
		justify-content: center;
		align-items : center;
	}
	#inner_map{
		width: 700px;
		height : 700px;
	}
	
	
</style>
</head>
<body>
	<% %>
	<div id=info_inner>
		<div id=inner_map>
			<jsp:include page="/WEB-INF/views/common/map/map.jsp"></jsp:include>
		</div>
	</div>
	<script type="text/javascript">
	
	    var mapContainer = document.getElementById('map'); // 지도를 표시할 div 
	    var mapOption = {
	            center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
	            level: 3 // 지도의 확대 레벨
	        };  
	
	
	    // 지도를 생성합니다    
	    var map = new kakao.maps.Map(mapContainer, mapOption); 
	    let a = map.getLevel();
		 console.log(a);
		map.setLevel(7);
	</script>
	<script type="text/javascript" src="resources/js/ajaxInfo.js"></script>
	<script type="text/javascript" src="resources/js/addresCalc.js"></script>
	<script type="text/javascript">
		let array = null;
		$(document).ready(function(){
			loadList().then(result=> {
				
				WtoWGS84(result).then(result=>{
					
				})
				
				});

		})

	</script>
</body>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</html>