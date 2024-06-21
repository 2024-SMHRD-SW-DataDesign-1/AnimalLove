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
        <button class="m_btn">Reset</button>
    </div>


	<!-- 푸터 -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>


<script>
	//헤더에 매칭 강조
	let login = document.getElementById("h_mat");
	login.style = "border-bottom : 2px solid #3c40c6; border-radius: 2px; color : #3c40c6;";
	

	
	// 추천된 카드의 정보를 받아와서 담을 변수
	let opponentInfo = null;
	
	// 화면이 시작될때 필요한 사진정보들을 구함
	$( document ).ready(function() {	
/* 		$.ajax({
			url:"animalte",// 요청경로
			type : "post",
			dataType : "json",// 서버에서 반환받는 데이터 형식
			success : function (data) {
				// data가 넘오는 타입확인해야됨 promise로 넘어오면 변경되야됨
				opponentInfo = data;
			},
			error :function(){
				alert("통신실패");
			}
		
		}) 
		
		if(data == 0)
		{
			return;
		}
	*/	
			
		let container = document.getElementById("p_c_container");
		container.innerHTML = "";
		// 밑 변수들 재관이형님 수정시에 지우세요!!!! 테스트용변수
		let name = "상현1";
		let age = "상현2";
		let breed = "상현3";
		opponentInfo = [
		{
			name : "이름1",
			age : "나이1",
			breed : "품종1",
			gender : "성별1",
			weight : "몸무게1",
			intro : "소개글111111111111111111111111111111111111111",
			img1 : "resources/img/img_pro1.jpg",
			img2 : "resources/img/img_pro2.jpg",
			img3 : "",
			
			
		},
		{
			name : "이름2",
			age : "나이2",
			breed : "품종2",
			gender : "성별2",
			weight : "몸무게2",
			intro : "소개글22222222222222222222222222222222222222",
			img1 : "resources/img/img_pro1.jpg",
			img2 : "resources/img/img_pro2.jpg",
			img3 : "resources/img/img_pro3.jpg",
		}
		]
			
		for(let i = 0; i< opponentInfo.length; i++)
		{
			// 프로필 카드 등록하는 함수 각자리에 맞는 변수를 설정해야됨
			// 이미지 경로도 수정해야됨!!!!
			let tag = 
		        '<div class="p_card">' +
		        	'<div class="p_like">' +
		        		'<i class="fa-regular fa-heart fa-2xl"></i>' +
		        	'</div>' +
		        	'<img src="resources/img/img_pro1.jpg" alt="" class="p_img">' +
		        	'<div class="p_body">' +
		        	'<h1 class="t_name">'+ name +'</h1>' +
		        	'<p class="t_age">' + age + '살</p>' +
		        	'<p class="t_text">' + breed + '</p>' +
		        	'</div>' + 
		        	'<button class="m_p_btn" onclick="showModal('+ i +')">Pick Me</button>' +
		     	'</div>';
		     	
			container.innerHTML += tag;     
		}
	
	
	
	
	

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

	                  
	                  bigname.innerText = opponentInfo[idx].name;
	                  biggender.innerText = opponentInfo[idx].gender;
	                  bigage.innerText = opponentInfo[idx].age;
	                  bigbreed.innerText = opponentInfo[idx].breed;
	                  bigweight.innerText = opponentInfo[idx].weight;
	                  bigintro.innerText = opponentInfo[idx].intro;
						
	                  let bigswiper = document.getElementById("bigswiper");
	                  bigswiper = "";


	  					
					
	                  
	          		  let swiper1 = document.getElementById("bigSlide");
						console.log(swiper1)	          		
	                  swiper1.innerHTML = ""; 
		          	  if(opponentInfo[idx].img1 != "")
		        	  {
		          		  setImgs(swiper1, opponentInfo[idx].img1); 	
		        	  }
		        		
		        	  if(opponentInfo[idx].img2 != "")
		        	  {
		        		  setImgs(swiper1, opponentInfo[idx].img2);	
		        	  }
		        		
		        	  if(opponentInfo[idx].img3 != "")
		        	  {
		        		  setImgs(swiper1, opponentInfo[idx].img3);	
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
	              }		
	            });
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
				'<img src="'+ str +'" class="big_img" style="width :800px; height : 500px; ">' +
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
	
	
	function toSendHeart()
	{
		
	}
	
</script>


</body>






</html>