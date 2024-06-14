<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>

<style>

@media screen and (max-width:640px) {
	header {
		flex-direction: column;
	}
}

@font-face {
	font-family: 'BMJUA';
	src:
		url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/BMJUA.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

* {
	padding: 0;
	margin: 0;
}

.container {
	max-width: 800px;
	margin: 0 auto;
	box-sizing: border-box;
	display: flex;
	flex-direction: column;
	justify-content: space-between;
	align-items: center;
}

header {
	display: flex;
	justify-content: space-between;
	width: 100%;
	align-items: center;
	padding: 1.2rem 0;
}

/*애니팅, 로고 이미지*/
header>div {
	display: flex;
	align-items: center;
}

/*애니팅 속성*/
#title {
	font-size: 2rem;
	font-weight: 700;
	text-decoration: none;
	color: #333333;
	font-family: 'BMJUA';
	margin-left : 10px;
}

/*로고이미지 속성*/
#logo {
	width: 70px;
	height: 70px;
}

/*카테고리 속성*/
header>ul {
	display: flex;
}

/*매칭,위치,마이 속성*/
header>ul>li {
	list-style-type: none;
	margin-left: 4rem;
	padding-bottom: 10px;
}

/*매칭,위치,마이,로그인 속성*/
header>ul>li>a {
	color: #333333;
	text-decoration: none;
	font-size: 1rem;
	font-weight: 800;
	font-family: 'pretendard';
}

/*매칭,위치,마이,로그인 hover 속성*/
header>ul>li>a:hover {
	border-bottom: 2px solid #3c40c6;
	border-radius: 2px;
	color: #3c40c6;
}

/*아이콘 속성*/
#i_angle {
	filter: opacity(0.5) drop-shadow(0 0 0 #333333);
	width: 24px;
}

</style>

</head>
<body>
	<div class="container">
		<header>
			<div>
				<a href="#"><img src="resources/img/img_logo.png" id="logo"></a>
				<p>
					<a href="#" id="title">애니팅</a>
				</p>
			</div>
			<ul>
				<li><a href="#">매칭</a></li>
				<li><a href="#">위치</a></li>
				<li><a href="#">마이페이지</a></li>

			</ul>
			<ul>
				<li><a href="#" id="login">로그인</a></li>
				<a href="#"><img src="resources/img/icon_angle.png" id="i_angle"></a>
			</ul>

		</header>


	</div>
</body>
</html>