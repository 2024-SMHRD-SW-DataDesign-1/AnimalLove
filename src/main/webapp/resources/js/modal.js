/**
 * 
 */
 
 document.getElementById('openModal').addEventListener('click', function () {
    fetch('kakao.html')
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