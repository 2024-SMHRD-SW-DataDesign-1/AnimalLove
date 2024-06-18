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


.j_container {
	max-width: 800px;
	margin: 0 auto;
	box-sizing: border-box;
	flex-direction: column;
	display: flex;
	justify-content: space-around;
	align-items: center;
	margin-bottom:100px;
}


#j_title {
	font-family: 'Cafe24Meongi-W-v1.0';
	color: #333333;
	font-size: 50px;
	padding-top: 10px;
	text-align: center;
}

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

.j_menu {
	margin-bottom: 8px;
	margin-left: 30px;
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

.j_import_btn {
	width: 262px;
	height: 36px;
	font-size: 15px;
	color: #fff;
	border: 0;
	border-radius: 17px;
	background-color: #3c40c6;
	margin-top: 10px;
	margin-left: 30px;
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
<jsp:include page="/WEB-INF/views/common/header.jsp" />
</head>
<body>

	<div class="j_container">
		<form action="member/join" method="POST">

			<h2 id="j_title">Sign in</h2>
			<br>

			<p class="j_menu">아이디</p>
			<p class="j_menu">
				<input type="text" class="j_text" name="u_id" required id="u_id"> 
				<button class="j_btn" type="button" id="idChk" onclick="fn_idChk();" value="N"> 중복확인 </button>
			</p>


			<p class="j_menu">비밀번호</p>
			<p class="j_menu">
				<input type="password" class="j_text" name="u_pw" required>
			</p>


			<p class="j_menu">비밀번호 확인</p>
			<p class="j_menu">
				<input type="password" class="j_text" name="u_pwcheck" required>
			</p>


			<p class="j_menu">이름</p>
			<p class="j_menu">
				<input type="text" class="j_text" name="u_name" required>
			</p>

			<p class="j_menu">닉네임</p>
			<p class="j_menu">
				<input type="text" class="j_text" name="u_nickname"  id="u_nickname" required> 
				<button class="j_btn" type="button" id="nickChk" onclick="fn_nickChk();" value="N"> 중복확인 </button>
			</p>


			<p class="j_menu">이메일</p>
			<p class="j_menu">
				<input type="email" id="u_email" class="j_text" placeholder="animal@aniting.com" name="u_email" required>
				<button class="j_btn" type="button" id="emailChk" onclick="fn_emailChk();" value="N"> 중복확인 </button>
			</p>


			<p class="j_menu">주소</p>
			<p class="j_menu">
				<input type="text" class="j_text" name="u_address" id="u_address"
					readonly required>
				<input type="button" value="찾기" class="j_btn" id="openModal">
			</p>


			<p class="j_menu">상세주소</p>
			<p class="j_menu">
				<input type="text" class="j_text" name="u_address" required>
			</p>

			<input type="submit" value="회원가입 완료" class="j_import_btn">

		</form>
	</div>


	<!-- 주소찾기 -->
	<script>
		function SendData(e)
		{
			if(e.keyCode ==13)
			{
				search();
			}
		}
	</script>

	<script type="text/javascript" src="resources/js/kakao.js"></script>

	<script>
        
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
                    alert("중복된 이메일입니다.");
                } else if (data == '0') {
                    $("#emailChk").attr("value", "Y");
                    alert("사용 가능한 이메일입니다.")
                }
            }

        })
    }

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
                    alert("중복된 닉네임입니다.");
                } else if (data == '0') {
                    $("#nickChk").attr("value", "Y");
                    alert("사용 가능한 닉네임입니다.")
                }
            }

        })
    }

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
                    alert("중복된 아이디입니다.");
                } else if (data == '0') {
                    $("#idChk").attr("value", "Y");
                    alert("사용 가능한 아이디입니다.")
                }
            }

        })
    }
</script>






</body>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</html>