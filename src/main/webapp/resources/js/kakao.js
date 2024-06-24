let infowindow = new kakao.maps.InfoWindow({zIndex:1});
let markers = [];                                  

// 현재 선택된 주소값을 curAdress에 저장
let curAdress = null;
let map = null;

function setMap(Map)
{
    map = Map;
}

function getMap()
{
	return map;
}

// 장소 검색 객체를 생성합니다
let ps = new kakao.maps.services.Places(); 

// 키워드로 장소를 검색합니다
function search()
{
    
    let value = document.getElementById("mapValue").value;
    if(value==="")
    {
        return;
    }
    //ps.keywordSearch(value, inputData); 
    ps.keywordSearch(value, placesSearchCB); 

}

// 키워드 검색 완료 시 호출되는 콜백함수 입니다
function placesSearchCB (data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {
        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        let bounds = new kakao.maps.LatLngBounds();
        let listEl = document.getElementById('placesList');
        removeMarker();
        removeAllChildNods(listEl);
        
        for (let i=0; i<data.length; i++) {
            
            displayPlaces(i, data[i]);    
            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
        }       

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
        map.setBounds(bounds);
    } 
}

// 지도에 마커를 표시하는 함수입니다
function displayMarker(place) {
   	
   	
	let imageSrc = 'resources/img/animalmarker.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
	imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
	
    imageOption = {offset: new kakao.maps.Point(27, 69)}
	let markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);	
	
	
	let marker = new kakao.maps.Marker({
		map: map,
        position: new kakao.maps.LatLng(place.y, place.x),
		image: markerImage // 마커이미지 설정 
	});   
	
    kakao.maps.event.addListener(marker, 'mouseover', function() {
	    displayInfowindow(marker, place.place_name);
	});

	kakao.maps.event.addListener(marker, 'mouseout', function() {
    	infowindow.close();
	});

	
	
    // 마커에 클릭이벤트를 등록합니다
    kakao.maps.event.addListener(marker, 'click', function() {
        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
        infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
        infowindow.open(map, marker);
    });
	return marker;

}

// 부산지역 범위내에 있는 마커인지 확인
function checkMarker(x, y)
{
	let result = false;
	if(
		y <= 35.440948 &&
        y >= 34.976658 &&
        x >= 128.654937 &&
        x <= 129.345224
        )
	{
		
		result = true;	
	}
	return result;
}
	function MarkerView(places, title)
	{
	
		if(!checkMarker(places[0].x, places[0].y))
		{
			return null;
		}
		let markerPosition  = new kakao.maps.LatLng(places[0].y, places[0].x); 

		// 마커를 생성합니다
		let imageSrc = 'resources/img/animalmarker.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
		imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
		
	    imageOption = {offset: new kakao.maps.Point(27, 69)}
		let markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);	
		
		
		let marker = new kakao.maps.Marker({
			map: map,
	        position: markerPosition,
			image: markerImage // 마커이미지 설정 
		});   
		
		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);
			
		
		
		kakao.maps.event.addListener(marker, 'mouseover', function() {
		    displayInfowindow(marker, title);
		});
		
		kakao.maps.event.addListener(marker, 'mouseout', function() {
		    infowindow.close();
		});
	}

    // 검색 결과 목록과 마커를 표출하는 함수입니다
    function displayPlaces(idx,places) {

        let listEl = document.getElementById('placesList'), 
        menuEl = document.getElementById('menu_wrap'),
        fragment = document.createDocumentFragment(), 
        bounds = new kakao.maps.LatLngBounds(), 
        listStr = '';

		
        // 마커를 생성하고 지도에 표시합니다
        let placePosition = new kakao.maps.LatLng(places.y, places.x),
            marker = displayMarker(places);
            itemEl = getListItem(idx, places); // 검색 결과 항목 Element를 생성합니다
            // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
            // LatLngBounds 객체에 좌표를 추가합니다
            bounds.extend(placePosition);

            // 마커와 검색결과 항목에 mouseover 했을때
            // 해당 장소에 인포윈도우에 장소명을 표시합니다
            // mouseout 했을 때는 인포윈도우를 닫습니다
            (function(marker, title) {

                itemEl.onmouseover =  function () {
                    displayInfowindow(marker, title);
                };

                itemEl.onmouseout =  function () {
                    infowindow.close();
                };

 
				//change_btn(event); 
            })(marker, places.place_name);

            fragment.appendChild(itemEl);
        

        // 검색결과 항목들을 검색결과 목록 Element에 추가합니다
        listEl.appendChild(fragment);
        menuEl.scrollTop = 0;

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
        map.setBounds(bounds);

        setListEvent();
    }

    function removeAllChildNods(el) {   
        while (el.hasChildNodes()) {
            el.removeChild (el.lastChild);
        }
    }

    function removeMarker() {
        for ( let i = 0; i < markers.length; i++ ) {
            markers[i].setMap(null);
        }   
        markers = [];
    }

    function addMarker(position, idx, title) {
    
        let imageSrc = 'resources/img/animalmarker.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
            imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
            imgOptions =  {
                spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
                spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
                offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
            }
        let markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions);	

        
        let marker = new kakao.maps.Marker({
    		position: position, 
    		image: markerImage // 마커이미지 설정 
		});    
    	
        marker.setMap(map); // 지도 위에 마커를 표출합니다
        markers.push(marker);  // 배열에 생성된 마커를 추가합니다
    
        return marker;
    }
    
	function change_btn(e) {
		
		let btns = document.querySelectorAll(".info");
		
		let input = document.getElementById("mapValue");
	  	btns.forEach(function (btn, i) {
	  		
		    if (e.currentTarget == btn) {
		      
		      btn.className += " select";
		      input.value = btn.children[1].innerText;
		      
		    } else {
		      btn.classList.remove("select");
		    }
	  	});
	  	
	}

    function getListItem(index, places) {
				
        let el = document.createElement('li'),
        itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                    '<div class="info" onclick="change_btn(event)">' +
                    '   <h5>' + places.place_name + '</h5>';
    
        if (places.road_address_name) {
            itemStr += '    <span>' + places.road_address_name + '</span>' +
                        '   <span class="jibun gray">' +  places.address_name  + '</span>';
        } else {
            itemStr += '    <span>' +  places.address_name  + '</span>'; 
        }
                     
          itemStr += '  <span class="tel">' + places.phone  + '</span>' +
                    '</div>';           
    
        el.innerHTML = itemStr;
        el.className = 'item';
    
        return el;
    }

    function displayInfowindow(marker, title) {
        let content = '<div style="z-index:1; width:200px; height: 50px; text-align: center; align-content:center; word-break:break-all;">' + title + '</div>';
    
        infowindow.setContent(content);
        infowindow.open(map, marker);
    }

    function setListEvent(){
        // 클릭했을때 주소값 저장
        let divList = document.querySelectorAll(".info");
        
        let idx = divList.length;
        
        if(idx <= 0)
        {
            return;   
        }

        for(let i = 0; i< idx; i++)
        {
            divList[i].addEventListener("click", function(){

                let list = divList[i].children;
                
                curAdress = list[1].innerText;
                
            })
        }
        
    }

    function getValue()
    {

        return curAdress;
    }