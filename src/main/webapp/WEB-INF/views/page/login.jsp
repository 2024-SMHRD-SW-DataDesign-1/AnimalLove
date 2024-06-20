<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login here</title>
<style>

* {
	margin: 0px;
	padding: 0px;
}

/* 타이틀 폰트 */
@font-face {
	font-family: 'Cafe24Meongi-W-v1.0';
	src:
		url('https://fastly.jsdelivr.net/gh/projectnoonnu/2405-3@1.1/Cafe24Meongi-W-v1.0.woff2')
		format('woff2');
	font-weight: normal;
	font-style: normal;
}

/* 타이틀 */
.l_container {
	max-width: 800px;
	margin: 0 auto;
	box-sizing: border-box;
	height: 60vh;
	display: flex;
	flex-direction: column;
	justify-content: space-around;
	align-items: center;
	font-family: 'pretendard';
	text-align: center;
}

#l_title {
	font-family: 'Cafe24Meongi-W-v1.0';
	color: #333333;
	font-size: 50px;
	padding-top: 10px;
}

#l_sub {
	font-size: 15px;
	padding: 14px;
}

/* ID, PW */
input[type="text"], input[type="password"] {
	width: 220px;
	height: 36px;
	font-size: 15px;
	border: 0;
	border-radius: 17px;
	outline: solid 1.5px;
	outline-color: #666666;
	padding-left: 30px;
	margin-bottom: 14px;
}

input[placeholder="ID"], input[placeholder="PW"] {
	font-family: 'pretendard';
}


/* 버튼 */
.l_btn {
	width: 100px;
	height: 36px;
	font-size: 15px;
	color: #fff;
	border: 0;
	border-radius: 17px;
	background-color: #3c40c6;
	margin-bottom: 30px;
}

.l_btn_container {
	display: flex;
	justify-content: space-around;
}

.l_btn:active {
	width: 100px;
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


/* id,pw 찾기 */
.l_search {
	text-decoration: none;
	color: #333333;
	padding: 25px;
}
</style>


</head>

<body>

<!-- 헤더 -->
<jsp:include page="/WEB-INF/views/common/header.jsp" />

	<div class="l_container">
	
		<form action="member/login" method="POST" id="l_login">
		
			<h2 id="l_title">Login</h2>
			<p id="l_sub">애니팅 서비스에 오신걸 환영합니다🥰</p>
			<br>
				<input type="text" placeholder="ID" name="u_id" required > <br>
				<input type="password" placeholder="PW" name="u_pw" required> <br>
			
			<div class="l_btn_container">
				<input type="submit" value="로그인" class="l_btn">
				<input type="button" value="회원가입" class="l_btn" onclick="location.href = 'join'">
			</div>

			<span><a href="findid" class="l_search">ID찾기</a></span>
			<span><a href="#" class="l_search">PW찾기</a></span>

		</form>

	</div>

<!-- 푸터 -->
<jsp:include page="/WEB-INF/views/common/footer.jsp" />	
    
</body>

<!-- 헤더에 로그인 강조 -->
    <script type="text/javascript">
    
		let login = document.getElementById("h_login");
        login.style = "border-bottom : 2px solid #3c40c6; border-radius: 2px; color : #3c40c6;";
       
    </script>
    
</html>