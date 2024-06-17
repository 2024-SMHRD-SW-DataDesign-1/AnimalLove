<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=45ed770bdfa1cc4cd6cc25dc8ff866b7&libraries=services,clusterer,drawing"></script>
    <title>NICE Authentication Example</title>
    <style>

    </style>
</head>
<body>
    <input type="text" readonly id="addres">
    <button id="openModal">주소 찾기</button>
    <!-- <link rel="preload" href="kakao.js"> -->


    <script>
		function SendData(e)
		{
			if(e.keyCode ==13)
			{
				search();
			}
		}
	</script>
	<script type="text/javascript" src="resources/html/kakao.js"></script>
	
    <script>
        
        document.getElementById('openModal').addEventListener('click', function () {
            fetch('resources/js/kakao.html')
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
                            document.getElementById("addres").value = getValue();

                        }
                    })
                })
                .catch(error => {
                    console.error('Error fetching the HTML file:', error);
                });
        });

    </script>

</body>
</html>
