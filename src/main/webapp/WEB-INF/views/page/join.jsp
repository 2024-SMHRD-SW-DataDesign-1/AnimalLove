<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=45ed770bdfa1cc4cd6cc25dc8ff866b7&libraries=services,clusterer,drawing"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>


<title>Join here</title>


<style>


* {
	margin: 0px;
	padding: 0px;
	font-family: 'pretendard';
}

/*타이틀 폰트*/
@font-face {
	font-family: 'Cafe24Meongi-W-v1.0';
	src:
		url('https://fastly.jsdelivr.net/gh/projectnoonnu/2405-3@1.1/Cafe24Meongi-W-v1.0.woff2')
		format('woff2');
	font-weight: normal;
	font-style: normal;
}


/* 회원가입 타이틀 */
.j_container {
	max-width: 800px;
	margin: 0 auto;
	box-sizing: border-box;
	flex-direction: column;
	display: flex;
	justify-content: space-around;
	align-items: center;
	margin-bottom: 100px;
}

#j_title {
	font-family: 'Cafe24Meongi-W-v1.0';
	color: #333333;
	font-size: 50px;
	padding-top: 10px;
	text-align: center;
}


/* 중복확인 버튼 */
.j_btn {
	margin-left: 5px;
	width: 68px;
	height: 28px;
	color: #fff;
	border: 0;
	border-radius: 8px;
	background-color: #3c40c6;
	letter-spacing: 0.1em;
}

.j_btn:active {
	margin-left: 5px;
	width: 68px;
	height: 28px;
	color: #3c40c6;
	border: 0;
	border-radius: 8px;
	outline: none;
	outline-style: solid;
	outline-width: 1px;
	background-color: #fff;
	letter-spacing: 0.1em;
}

/* 본문 */
.j_menu {
	margin-bottom: 8px;
	margin-left: 50px;
}

.j_text {
	width: 250px;
	height: 36px;
	font-size: 15px;
	border: 0;
	border-radius: 15px;
	outline: none;
	padding-left: 10px;
	background-color: rgb(233, 233, 233);
}

/* 가입완료 버튼 */
.j_import_btn {
	width: 262px;
	height: 36px;
	font-size: 15px;
	color: #fff;
	border: 0;
	border-radius: 17px;
	background-color: #3c40c6;
	margin-top: 10px;
	margin-left: 50px;
}

.j_import_btn:active {
	width: 262px;
	height: 36px;
	font-size: 15px;
	color: #3c40c6;
	border: 0;
	border-radius: 17px;
	outline: none;
	outline-style: solid;
	outline-width: 1px;
	background-color: #fff;
}


</style>

</head>
<body>


<!-- 헤더 -->
<jsp:include page="/WEB-INF/views/common/header.jsp" />

	<div class="j_container">
		<form action="member/join" method="POST">

			<h2 id="j_title">Sign in</h2>
			<br>

			<p class="j_menu">아이디</p>
			<p class="j_menu">
				<input type="text" class="j_text" name="u_id" id="u_id"
					maxlength="8" oninput="idCheck()" required>
				<button class="j_btn" type="button" id="idChk" onclick="fn_idChk();"
					value="N">중복확인</button>
				<br> <span id="idCheck"></span>
			</p>


			<p class="j_menu">비밀번호</p>
			<p class="j_menu">
				<input type="password" class="j_text" name="u_pw" maxlength="20"
					minlength="6" id="pw1" oninput="pwCheck()" required>
			</p>


			<p class="j_menu">비밀번호 확인</p>
			<p class="j_menu">
				<input type="password" class="j_text" name="u_pwcheck"
					maxlength="20" minlength="6" id="pw2" oninput="pwCheck()" required><br>
				<span id="pwCheck"> </span>
			</p>

			<p class="j_menu">이름</p>
			<p class="j_menu">
				<input type="text" class="j_text" name="u_name" required>
			</p>

			<p class="j_menu">닉네임</p>
			<p class="j_menu">
				<input type="text" class="j_text" name="u_nickname" id="u_nickname"
					maxlength="6" required>
				<button class="j_btn" type="button" id="nickChk"
					onclick="fn_nickChk();" value="N">중복확인</button>
			</p>


			<p class="j_menu">이메일</p>
			<p class="j_menu">
				<input type="email" id="u_email" class="j_text"
					placeholder="animal@aniting.com" name="u_email" required>
				<button class="j_btn" id="emailChk"
					onclick="fn_emailChk();" value="N">중복확인</button>
			</p>


			<p class="j_menu">주소</p>
			<p class="j_menu">
				<input type="text" class="j_text" name="u_address" id="u_address"
					required> <input type="button" value="찾기" class="j_btn"
					id="openModal">
			</p>


			<p class="j_menu">상세주소</p>
			<p class="j_menu">
				<input type="text" class="j_text" name="u_address" required>
			</p>

			<input type="submit" value="회원가입 완료" class="j_import_btn">

		</form>
	</div>


<!-- 푸터 -->
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>


<!-- 모달 스크립트 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<script>

		<!-- 아이디 글자수 제한 -->
		function idCheck(){
			var id1 = document.getElementById('u_id').value;
			
			if(id1.length >= 8){
				$('#idCheck').text('6~8자까지 입력해주세요.').css('color', '#ff3f34')		
			}else{
				$('#idCheck').text('')
			}
		}

		
		<!-- 비밀번호 체크 스크립트 -->
		function pwCheck(){
		    if($('#pw1').val() == $('#pw2').val()){
		        $('#pwCheck').text('비밀번호 일치').css('color', 'green')
		    }else{
		        $('#pwCheck').text('비밀번호 불일치').css('color', '#ff3f34')
		    }
		}

		
		
</script>

<script type="text/javascript" src="resources/js/kakao.js"></script>

<script>

		<!-- 주소찾기 -->
		function SendData(e)
		{
			if(e.keyCode ==13)
			{
				search();
			}
		}
		
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
                            console.log(getMap());
                        },
                    })
                    .then((result) => {
                        if(result.isConfirmed)
                        {
                            document.getElementById("u_address").value = getValue();

                        }
                    })
                })
                .catch(error => {
                    console.error('Error fetching the HTML file:', error);
                });
        });

    </script>

<script>
	
		<!-- 중복확인 -->
		// 모달 디자인 함수
		function showmodal(dic){
			Swal.fire(
				  dic
				);
		}
		
		// 아이디 중복체크	
		  function fn_idChk() {
		    	
		        $.ajax({
		            url : "member/idChk",
		            type : "POST",
		            data : {
		    			u_id : $("#u_id").val()
					},
		            success : function (data) {
		            	console.log(data)
		                if(data == '1') {
		                	showmodal({text: "중복된 닉네임입니다.",
		            			icon: "warning"   });
		                } else if (data == '0') {
		                    $("#idChk").attr("value", "Y");
		                    showmodal({text: "사용 가능합니다.",
		            			icon: "success"   });
		                }
		            }
	
		        })
		    }
		
		// 닉네임 중복체크
		  function fn_nickChk() {
		    	
		    	var sennick = {
		    			u_nickname : $("#u_nickname").val()
					};
		        $.ajax({
		            url : "member/nickChk",
		            type : "POST",
		            data : sennick,
		            success : function (data) {
		            	console.log(data.nickCheck)
		                if(data == '1') {
		                	showmodal({text: "중복된 닉네임입니다.",
		            			icon: "warning"   });
	
		                } else if (data == '0') {
		                    $("#nickChk").attr("value", "Y");
		                    showmodal({text: "사용 가능합니다.",
		            			icon: "success"   });
		                }
		            }
	
		        })
		    }	
		
		// 이메일 중복체크
	    function fn_emailChk() {
	    	
	    	var senemail = {
	    			u_email : $("#u_email").val()
				};
	    	
	        $.ajax({
	            url : "member/emailChk",
	            type : "POST",
	            data : senemail,
	            success : function (data) {
	            	console.log(data.emailCheck)
	                if(data == '1') {
	                	showmodal({text: "중복된 이메일입니다.",
	                    			icon: "warning"   });
	                	
	                } else if (data == '0') {
	                    $("#emailChk").attr("value", "Y");
	                    
	                    showmodal({text: "사용 가능합니다.",
	            			icon: "success"   });
	                } 
	            }
	
	        })
	    }
  
</script>


</html>