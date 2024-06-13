/**
 * 
 */
 


// 주소를 좌표로 변환
function StoWGS84(list)
{
    let geocoder = new kakao.maps.services.Geocoder();
    let array = [];
    geocoder.addressSearch('제주특별자치도 제주시 첨단로 242', function(result, status) {
    
        // 정상적으로 검색이 완료됐으면 
         if (status === kakao.maps.services.Status.OK) {
    
            //var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
    
            array.push(result);
        }
        
    }); 
    return array;
}

///////////////////////////////////////////////////////////////
// WTM 좌표를 WGS84 좌표로 변환하기
// 사용예시 WtoWGS84().then(result => console.log(result));
wtmX = 160082.538257218, // 변환할 WTM X 좌표 입니다
wtmY = -4680.975749087054; // 변환할 WTM Y 좌표 입니다

let value=null;
function WtoWGS84(list) {
    return new Promise((resolve, reject) => {
        var geocoder = new kakao.maps.services.Geocoder();
        let dataList = []
		console.log(list.);
		for(let i = 0; i< list.length; i++){
			geocoder.transCoord(wtmX, wtmY, function(result, status) {
        	
        	
            if (status === kakao.maps.services.Status.OK) {
                dataList.push({list.l_latitude, list.l_longitude})
            } else {
                reject(new Error('Failed to convert coordinates'));
            }
	        }, {
	            input_coord: kakao.maps.services.Coords.WTM,
	            output_coord: kakao.maps.services.Coords.WGS84
	        });
		}
	        console.log(dataList);
        resolve(dataList);

    });
}



// 좌표 변환 결과를 받아서 처리할 콜백함수 입니다.
function transCoordCB(result, status) {
    let coords = null;
    // 정상적으로 검색이 완료됐으면 
    if (status === kakao.maps.services.Status.OK) {
        coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	    
    }
    value=result;

    return result;
}

 