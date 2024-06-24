<%@page import="com.smhrd.myapp.model.MavenMember"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Matching Profile here</title>
<script src="https://kit.fontawesome.com/b145cfedc2.js" crossorigin="anonymous"></script>

<style>
       
        /* 타이틀 폰트 */
        @font-face {
        font-family: 'Cafe24Meongi-W-v1.0';
        src:
            url('https://fastly.jsdelivr.net/gh/projectnoonnu/2405-3@1.1/Cafe24Meongi-W-v1.0.woff2')
            format('woff2');
        font-weight: normal;
        font-style: normal;
        }

        /* 프로필 카드 폰트 */
        @font-face {
        font-family: 'BMJUA';
        src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/BMJUA.woff') format('woff');
        font-weight: normal;
        font-style: normal;
        }

        .p_container{
            text-align: center;
            
            
            
        }


        /* 프로필 */
        #p_title{
            font-family: 'Cafe24Meongi-W-v1.0';
            color: #333333;
            font-size: 50px;
            margin: 20px;
            margin-bottom: 10px;
        }

        /* 프로필 카드 박스 */
        #p_c_container{
            text-align: center;
            display: flex;
            justify-content: space-evenly;
        }

        .p_card{
            background: #ffffff;
            border-radius: 6px;
            display: inline-block;
            height: 470px;
            width: 370px;
            margin-top: 60px;
            box-shadow: 0 12px 13px rgba(0, 0, 0, 0.16), 0 12px 13px rgba(0, 0, 0, 0.16);
            font-family: 'BMJUA';
        }

        /* 이미지, 하트 아이콘 */
        .p_like{
            text-align: end;
            margin-right: 24px;
            margin-top: 24px;
            color: #444444;
        }

        .p_img{
            border-radius: 100%;
            width: 220px;
            height: 220px;
        }

    
        /*이름,나이,품종*/
        .t_name{
            font-family: 'BMJUA';
            color: #1b1b1b;
            letter-spacing: 3px;
            margin-bottom: 8px;
            margin-top: 10px;
        }

        .t_age{
            color: #a1a1a1;
            font-size: 16px;
            margin-top: 0;
            margin-bottom: 4px;
        }

        .t_text{
            font-size: 16px;
            margin-left: 65px;
            margin-right: 65px;
            color: #a1a1a1;
        }

        .m_p_btn{
            outline: none;
            background: #ff3f34;
            margin-top: 10px;
            border: none;
            height: 40px;
            width: 35%;
            color: #fff;
            font-size: 18px;
            border-radius: 30px;
            font-family: 'BMJUA';
        }

        .m_p_btn:hover{
            color: #ff3f34;
            background: #e2e1e0;
            transition: all 300ms linear;
            cursor: pointer;
        }

        .m_btn{
            height: 40px;
            width: 320px;
            font-size: 18px;
            font-family: 'BMJUA';
            background: #fff;
            color: #ff3f34;
            margin-top: 5em;
            border: 0;
            border-radius: 30px;
            outline: none;
            outline-style: solid;
            outline-width: 2px;
        }

        .m_btn:hover{
            color: #fff;
            background: #ff3f34;
            transition: all 200ms linear;
            cursor: pointer;
        }
        

	</style>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<link href="https://cdn.jsdelivr.net/npm/@sweetalert2/theme-dark@4/dark.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.js"></script>
	<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
	<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
	<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>

</head>
<body>

	<!-- 헤더 -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

	
	<div class="p_container">
        <h2 id="p_title">Profile</h2>
            <div id="p_c_container">
            </div>
        <button class="m_btn" onclick="resetFunction()">Reset</button>
        <p id="clock"><span id="time"></span></p>
    </div>


	<!-- 푸터 -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>


<script>
	//헤더에 매칭 강조
	let login = document.getElementById("h_mat");
	login.style = "border-bottom : 2px solid #3c40c6; border-radius: 2px; color : #3c40c6;";
	
	// 빈 하트
	let nullHeart = "fa-2xl fa-regular fa-heart heartIcon";
	// 꽉찬 하트
	let pullHeart = "fa-2xl fa-solid fa-heart heartIcon";
	
	// 추천된 카드의 정보를 받아와서 담을 변수
	let opponentInfo = null;
	let a_u_id = null;
	
	let timeDiff; // 남은 시간을 저장할 변수
	
	// 화면이 시작될때 필요한 사진정보들을 구함
	$( document ).ready(function() {	
 		$.ajax({
			url:"opponentinfo",// 요청경로
			type : "post",
			dataType : "json",// 서버에서 반환받는 데이터 형식
			success : function (data) {
				// data가 넘오는 타입확인해야됨 promise로 넘어오면 변경되야됨
				opponentInfo = data;
				
				// 비동기라서 아래 넣으면 데이터 불러오기 전에 for문 돔
				// 여기 넣어야 데이터 다 불러온 후 동작함
				
				for(let i = 0; i< opponentInfo.length; i++)
				{
					// 프로필 카드 등록하는 함수 각자리에 맞는 변수를 설정해야됨
					// 이미지 경로도 수정해야됨!!!!
					let tag = 
				        '<div class="p_card">' +
				        	'<div class="p_like">' +
				        		'<i id="matHeart' + i + '"class="fa-2xl fa-regular fa-heart heartIcon"></i>' +
				        	'</div>' +
				        	'<img src="data:image/jpg;base64,'+ opponentInfo[i].a_path1 +'" alt="" class="p_img">' +
				        	'<div class="p_body">' +
				        	'<h1 class="t_name">'+ opponentInfo[i].a_name +'</h1>' +
				        	'<p class="t_age">' + opponentInfo[i].a_age + '살</p>' +
				        	'<p class="t_text">' + opponentInfo[i].a_breed + '</p>' +
				        	'</div>' + 
				        	'<button class="m_p_btn" onclick="showModal('+ i +')">Pick Me</button>' +
				     	'</div>';
				     	
					container.innerHTML += tag;
					
					$.ajax({
	          			url: "likelistinquiry",
	          			type: "post",
	          			data: { lk_recid : opponentInfo[i].a_u_id },
	          			success: function(response) {
          					let heartIcons = document.querySelectorAll(".heartIcon");
          					console.log("리스트 개수 : " + heartIcons.length)
                       		let heartIcon = heartIcons[i];
	          				if(response=="1"){
	          					// 좋아요 활성화
                        		heartIcon.className = pullHeart;
	          				}  
	          			},
	          			error: function() {
	          				console.log("좋아요목록 조회 오류");
	          			}
					});
				}
				
				$.ajax({
			        url: "mtimeload",
			        type: "POST",
			        success: function(response) {
			            // 성공적으로 u_mtime 값을 받아왔을 때 처리
			            let u_mtime = new Date(response); // Timestamp 값을 JavaScript Date 객체로 변환
			            
			            setInterval(function() {
			                displayDateTime(u_mtime);
			            }, 1000);
			        },
			        error: function(xhr, status, error) {
			            // 에러 발생 시 처리
			            console.error("mtimeloda 오류:", status, error);
			        }
			    });
				
				
				
			},
			error :function(){
				alert("통신실패");
			}
		
		})
		
		
		
 	//setInterval(displayDateTime, 1000);
			
	let container = document.getElementById("p_c_container");
	container.innerHTML = "";

	});
</script>

<script type="text/javascript">
	// 모달창 띄우기
	function showModal(idx)
	{
		
	    fetch('resources/html/bigprofile.html')
	        .then(response => response.text())
	        .then(data => {
	    		Swal.fire({
	  			  width : 1000,
	  			  html : data,
	  			  padding: "3em",
	  			  color: "#000",
	  			  background: "#fff",
	  			  backdrop: `
	  			    rgba(0,0,123,0.4)
	  			    url(resources/img/cutecat.gif)
	  			    left top
	  			    no-repeat
	  			  `,
	              didOpen: () => {
	                  // 텍스트 태그
	                  let bigname = document.getElementById("big_name");
	                  let biggender = document.getElementById("big_gender");
	                  let bigage = document.getElementById("big_age");
	                  let bigbreed = document.getElementById("big_breed");
	                  let bigweight= document.getElementById("big_weight");
	                  let bigintro = document.getElementById("big_intro");
	                  
	                  // 이미지 태그
	                  let bigimg = document.getElementById("big_img");	                  

	                  
	                  bigname.innerText = opponentInfo[idx].a_name;
	                  biggender.innerText = opponentInfo[idx].a_gender;
	                  bigage.innerText = opponentInfo[idx].a_age + "살";
	                  bigbreed.innerText = opponentInfo[idx].a_breed;
	                  bigweight.innerText = opponentInfo[idx].a_weight + "kg";
	                  bigintro.innerText = opponentInfo[idx].a_intro;
						
	                  let bigswiper = document.getElementById("bigswiper");
	                  bigswiper = "";

	                  let heart = document.getElementById("heartIcon");
	                  
	                  $.ajax({
	          			url: "likelistinquiry",
	          			type: "post",
	          			data: { lk_recid : opponentInfo[idx].a_u_id },
	          			success: function(response) {
	          				if(response=="1"){
	          					// 좋아요 활성화
	          					heart.className = pullHeart;
	          				}else{       	  				  
	          					// 좋아요 활성화
	          					heart.className = nullHeart;
	          				}   
	          			},
	          			error: function() {
	          				console.log("좋아요목록 조회 오류");
	          			}
	          		});
	  				
					a_u_id = opponentInfo[idx].a_u_id
	                  
	          		  let swiper1 = document.getElementById("bigSlide");
						console.log(swiper1)	          		
	                  swiper1.innerHTML = ""; 
		          	  if(opponentInfo[idx].img1 != "")
		        	  {
		          		  setImgs(swiper1, opponentInfo[idx].a_path1); 	
		        	  }
		        		
		        	  if(opponentInfo[idx].img2 != "")
		        	  {
		        		  setImgs(swiper1, opponentInfo[idx].a_path2);	
		        	  }
		        		
		        	  if(opponentInfo[idx].img3 != "")
		        	  {
		        		  setImgs(swiper1, opponentInfo[idx].a_path3);	
		        	  }
	                  
/* 		        	  bigswiper += '<div class="swiper-button-next"></div>';
		        	  bigswiper += '<div class="swiper-button-prev"></div>';
		        	  bigswiper += '<div class="swiper-pagination"></div>'; 
		        	  */
			

		        		const swiper2 = new Swiper('.swiper', {
		        			// Optional parameters
		        			loop : true,
		        			slidesPerView : 1,
		        			// If we need pagination
		        			pagination : {
		        				el : '.swiper-pagination',
		        			},

		        			// Navigation arrows
		        			navigation : {
		        				nextEl : '.swiper-button-next',
		        				prevEl : '.swiper-button-prev',
		        			}

		        		});
		        	  
		        		// 채팅 요청 버튼 이벤트 핸들러 추가
		                document.getElementById("chatRequestBtn").addEventListener("click", function() {
		                	chatRequest(opponentInfo[idx].a_u_id);
		                });
		        	  
		        	  
	              },
	              showCancelButton: true,
	              cancelButtonText: "닫기",
	              confirmButtonText: "채팅요청",
	              showLoaderOnConfirm: true,
	              preConfirm: async (login) => {
	            	    try {
	            	    	chatRequest(opponentInfo[idx].a_u_id);
							
							return false;
	    
	            	    } catch (error) {
	            	    	
	            	    }
	            	  }
	            }).then((result) => {
	            	
	            })
	        })
	        .catch(error => {
	            console.error('Error fetching the HTML file:', error);
	        });
	    
	
	}
	
	// 이미지 추가하는 함수
	function setImgs(tag,str)
	{
		let img =
			'<div class="swiper-slide">' +
				'<img src="data:image/jpg;base64,'+ str +'" class="big_img" style="width :800px; height : 500px; ">' +
			'</div>';

		tag.innerHTML += img;
	}
</script>
<script>

	const swiper2 = new Swiper('.swiper', {
		// Optional parameters
		loop : true,
		slidesPerView : 1,
		// If we need pagination
		pagination : {
			el : '.swiper-pagination',
		},

		// Navigation arrows
		navigation : {
			nextEl : '.swiper-button-next',
			prevEl : '.swiper-button-prev',
		}

	});
	
	
	function toSendHeart(a_u_id){
		let idx = 0;
		
		for(let i = 0; i< opponentInfo.length; i++)
		{
			if(opponentInfo[i].a_u_id == a_u_id)
			{
				idx = i;
				break;
			}
		}
		
		let heart = document.getElementById("heartIcon");
		let matHeart = document.getElementById("matHeart"+idx);
		
		if(heart.className == nullHeart){
			$.ajax({
      			url: "likelistinsert",
      			type: "post",
      			data: { lk_recid : a_u_id },
      			success: function() {
      					heart.className = pullHeart;
      					matHeart.className = pullHeart;
      			},
      			error: function() {
      				console.log("좋아요목록 등록 실패");
      			}
      		});
		}else{
			$.ajax({
      			url: "liklistdelete",
      			type: "post",
      			data: { lk_recid : a_u_id },
      			success: function(response) {
      					heart.className = nullHeart;
      					matHeart.className = nullHeart;
      			},
      			error: function() {
      				console.log("좋아요목록 삭제 실패");
      			}
      		});
		}
	}
	// 채팅 요청 함수
	function chatRequest(userId) {
	    $.ajax({
			url: "member/call",
			type: "post",
			data: { c_recid : userId },
			success: function(response) {
				if(response=="1"){
					Swal.fire({
						title: '채팅 요청 완료',
						text: '채팅 요청이 성공적으로 전송되었습니다.',
						icon: 'success'
					});
				}else{
					Swal.fire({
						title: '이미 요청중입니다.',
						text: '채팅 목록을 확인해주세요',
						icon: 'error'
					});
				}
			},
			error: function() {
				Swal.fire({
					title: '오류',
					text: '채팅 요청을 전송하는 동안 오류가 발생했습니다.',
					icon: 'error'
				});
			}
		});
	}
	
	// 시간 및 날짜 표시 함수
    function displayDateTime(u_mtime) {
        let currentTimeElement = document.getElementById('time');
        
        let currentTime = new Date(); // 현재 시간 가져오기
        timeDiff = u_mtime.getTime() + 3 * 60 * 60 * 1000 - currentTime.getTime(); // 3시간 뒤까지 남은 시간 계산
        console.log(timeDiff);
        let hoursLeft = Math.floor(timeDiff / (1000 * 60 * 60));
        let minutesLeft = Math.floor((timeDiff % (1000 * 60 * 60)) / (1000 * 60));
        let secondsLeft = Math.floor((timeDiff % (1000 * 60)) / 1000);
        
        // 남은 시간을 "hh:mm:ss" 형식으로 표시
        let timeLeftFormatted = (hoursLeft < 10 ? "0" : "") + hoursLeft + ":" + (minutesLeft < 10 ? "0" : "") + minutesLeft + ":" + (secondsLeft < 10 ? "0" : "") + secondsLeft;
        if(timeDiff>=0){
        	currentTimeElement.textContent = "남은시간 : "+timeLeftFormatted;
        }else{
        	currentTimeElement.textContent = "리셋버튼 사용가능";
        }
       	
    }
    
    // 페이지 로드 시간 간격(1초)마다 시간 및 날짜 업데이트
    //setInterval(displayDateTime, 1000);
    
    // Reset 함수 정의
    function resetFunction() {
        let currentTime = new Date();
        let hours = currentTime.getHours();
        
        // 현재 시간이 3시인지 확인
        if (timeDiff < 0) {
            // Reset 동작 수행
        	document.location.href = 'matreset'
        } else {
            alert('리셋 가능한 시간이 아닙니다.');
        }
    }
    
	
</script>
	


</body>






</html>