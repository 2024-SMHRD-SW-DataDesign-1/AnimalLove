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

<title>Insert title here</title>

<style>
* {
	margin: 0px;
	padding: 0px;
	font-family: 'pretendard';
}

.join_form {
	max-width: 800px;
	margin: 0 auto;
	box-sizing: border-box;
	flex-direction: column;
	height: 60vh;
	display: flex;
	justify-content: space-around;
	align-items: center;
}

@font-face {
	font-family: 'Cafe24Meongi-W-v1.0';
	src:
		url('https://fastly.jsdelivr.net/gh/projectnoonnu/2405-3@1.1/Cafe24Meongi-W-v1.0.woff2')
		format('woff2');
	font-weight: normal;
	font-style: normal;
}

#j_title {
	font-family: 'Cafe24Meongi-W-v1.0';
	color: #333333;
	font-size: 50px;
	padding-top: 10px;
	text-align: center;
}

.sub {
	margin-left: 5px;
	width: 68px;
	height: 28px;
	color: #fff;
	border: 0;
	border-radius: 8px;
	background-color: #3c40c6;
	letter-spacing: 0.1em;
}

.sub:active {
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

p {
	margin-bottom: 8px;
	margin-left: 30px;
}

.text {
	width: 250px;
	height: 36px;
	font-size: 15px;
	border: 0;
	border-radius: 15px;
	outline: none;
	padding-left: 10px;
	background-color: rgb(233, 233, 233);
}

.btn {
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

.btn:active {
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

	<div class="join_form">
		<form action="join" method="POST">

			<h2 id="j_title">Sign in</h2>
			<br>

			<p>아이디</p>
			<p>
				<input type="text" class="text" name="u_id" required> <input
					type="button" value="중복확인" class="sub">
			</p>


			<p>비밀번호</p>
			<p>
				<input type="password" class="text" name="u_pw">
			</p>


			<p>비밀번호 확인</p>
			<p>
				<input type="password" class="text" name="u_pw">
			</p>


			<p>이름</p>
			<p>
				<input type="text" class="text" name="u_name">
			</p>

			<p>닉네임</p>
			<p>
				<input type="text" class="text" name="u_nickname"> <input
					type="button" value="중복확인" class="sub">
			</p>


			<p>이메일</p>
			<p>
				<input type="email" class="text" placeholder="animal@aniting.com"
					name="u_email" required> <input type="button" value="중복확인"
					class="sub">
			</p>


			<p>주소</p>
			<p>
				<input type="text" class="text" name="u_address" id="u_address"
					readonly> <input type="button" value="찾기" class="sub"
					id="openModal">
			</p>


			<p>상세주소</p>
			<p>
				<input type="text" class="text" name="u_address">
			</p>

			<input type="submit" value="회원가입 완료" class="btn">

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






</body>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</html>