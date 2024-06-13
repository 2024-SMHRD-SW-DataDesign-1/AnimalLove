<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
* {
	padding: 0;
	margin: 0;
	/* border: 1px solid black; */
}

.container {
	width: 700px;
	margin: 0 auto;
	box-sizing: border-box;
	height: 100vh;
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

header>p {
	font-size: 1.5rem;
	font-weight: 700;
}

header>p>a {
	color: black;
	text-decoration: none;
}

header>ul {
	display: flex;
}

header>ul>li {
	list-style-type: none;
	margin-left: 1.5rem;
	padding-bottom: 5px;
}

header>ul>li>a {
	color: black;
	text-decoration: none;
	font-size: 1.2rem;
	font-weight: 800;
	padding-bottom: 5px;
}

header>ul>li:first-child>a {
	border-bottom: 3px solid black;
}

header>ul>li>a:hover {
	border-bottom: 3px solid gray;
}

header>ul>li>a>img {
	margin: auto;
}

#login {
	border: none;
}

footer {
	margin-bottom: 2rem;
	font-size: 0.8rem;
}
</style>
</head>
<body>

	<div class="container">
		<header>
			<p>
				<a href="#">애니팅</a>
			</p>
			<ul>
				<li><a href="#">매칭</a></li>
				<li><a href="#">위치</a></li>
				<li><a href="#">마이페이지</a></li>

			</ul>
			<ul id="login">
				<li><a href="#" id="login">로그인 <img src="/icon_angle.png"
						width="24px"></a></li>

			</ul>

		</header>
	</div>



</body>
</html>