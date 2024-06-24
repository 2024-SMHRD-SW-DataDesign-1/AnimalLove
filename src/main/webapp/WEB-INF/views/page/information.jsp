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
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=45ed770bdfa1cc4cd6cc25dc8ff866b7&libraries=services,clusterer,drawing"></script>
<style type="text/css">


	
	#info_inner{
		height : 80vh;
		display :flex;
		justify-content: center;
		align-items: center;
	}
	#inner_map{
		width: 700px;
		height : 600px;
		
	}
	
	.i_menu {
		margin-bottom: 8px;
		margin-left: 30px;
	}
	
	.i_btn {
		margin-left: 5px;
		width: 68px;
		height: 28px;
		color: #fff;
		border: 0;
		border-radius: 8px;
		background-color: #3c40c6;
		letter-spacing: 0.1em;
	}
	
	.i_text {
		width: 250px;
		height: 36px;
		font-size: 15px;
		border: 0;
		border-radius: 15px;
		outline: none;
		padding-left: 10px;
		background-color: rgb(233, 233, 233);
	}
	
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	
	<div id=info_inner>
		<div>
			<p class="i_menu">주소</p>
			<p class="i_menu">
				<input type="text" class="i_text" name="u_address" id="i_address"
					onchange="moveMap()" required readonly > 
				<input type="button" value="찾기" class="i_btn" id="openModal">
			</p>
	
			<div id=inner_map>
				<div id="map2" style="width:100%;height:100%;"></div>
				
			</div>
		</div>
	</div>
	<script type="text/javascript" src="resources/js/kakao.js"></script>

	<script type="text/javascript">
	
	    var mapContainer = document.getElementById('map2'); // 지도를 표시할 div 
	    var mapOption = {
	            center: new kakao.maps.LatLng(35.165872, 129.068418), // 지도의 중심좌표
	            level: 8 // 지도의 확대 레벨
	        };  
	
	
	    // 지도를 생성합니다    
	    var map1 = new kakao.maps.Map(mapContainer, mapOption); 		 	
	    
		//map1.setLevel(7);
		setMap(map1);
	</script>
	<script type="text/javascript" src="resources/js/ajaxInfo.js"></script>
	<script type="text/javascript" src="resources/js/addresCalc.js"></script>
	<script type="text/javascript">
		
		$(document).ready(function(){
			loadList().then((result)=> {
				 WtoWGS84(result, MarkerView).then(async (result)=>{
					await getData(result);
					
				})	
			});

		})

		function getData(result){
			array = result;
		}
	</script>
	<script>
		function SendData(e)
		{
			if(e.keyCode ==13)
			{
				search();
			}
		}
	</script>


	<script>
	
		let diction = { test : 10};
		
	    document.getElementById('openModal').addEventListener('click', function () {
            fetch('resources/html/kakao.html')
                .then(response => response.text())
                .then(data => {
                    Swal.fire({
                        title: '주소 찾기',
                        html: data,
                        showCloseButton: true,
                        showCancelButton: true,
                        focusConfirm: false,
                        confirmButtonText: '확인',
                        cancelButtonText: '취소',
                        width : 1000,
                        
                        didOpen: () => {

                            // 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
                            

                            var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
                                mapOption = {
                                    center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
                                    level: 3 // 지도의 확대 레벨
                                };  


                            // 지도를 생성합니다    
                            var map = new kakao.maps.Map(mapContainer, mapOption); 

                            setMap(map);
                        },
                    })
                    .then((result) => {
                    	
                        if(result.isConfirmed)
                        {
                        	let input = document.getElementById("i_address");
                        	let value = document.getElementById("mapValue");
                        	
                            input.value = value.value;
							moveMap(value.value);
                        }
                    })
                })
                .catch(error => {
                    console.error('Error fetching the HTML file:', error);
                });
        });

		function moveMap(str)
		{
			// string to wgs84
		    let info = StoWGS84(str, map1);
		   
		    let moveLatLon = new kakao.maps.LatLng(33, 126.574942);
		    // 지도 중심을 부드럽게 이동시킵니다
		    // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
		    map1.panTo(moveLatLon); 

		}
    </script>
</body>
<script>

	//헤더에 위치 강조
	let login = document.getElementById("h_laca");
	login.style = "border-bottom : 2px solid #3c40c6; border-radius: 2px; color : #3c40c6;";

</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</html>