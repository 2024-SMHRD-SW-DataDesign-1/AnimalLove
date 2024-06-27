<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Footer here</title>


<style>

@media screen and (max-width:640px) {
	footer {
		flex-direction: column;
	}
}


/* 푸터 전체 속성 */
* {
	font-family: 'pretendard';
}

footer {
	width: 100%;
	color: #333333;
	background: #e9e9e9;
	padding-top: 30px;
	padding-bottom: 20px;
}

.f_container {
	max-width: 1000px;
	margin: auto;
	padding-bottom: 10px;
	display: flex;
	align-items: center;
}


/* 타이틀 문구 */
.f_left h2 {
	margin: 0;
}

.f_left p {
	margin: 0;
	font-size: 12px;
}


/* sns 표기 */
.f_left .f_sns {
	margin-top: 30px;
}

.f_sns img {
	filter: opacity(0.5) drop-shadow(0 0 0 white);
	height: 24px;
	margin-right: 20px;
}


/* 오른쪽 리스트 */
.f_right {
	flex: 3;
	padding-left: 50px;
	display: flex;
	align-items: center;
	justify-content: center;
}

.f_list {
	flex: 1;
	margin-left: 100px;
}

.f_list h3 {
	padding-left: 5px;
	padding-right: 5px;
	margin: 0;
	padding-bottom: 10px;
	border-bottom: 1px solid #666666;
}

.f_list ul {
	list-style: none;
	padding: 0;
}

.f_list ul li {
	font-size: 14px;
	padding: 6px 6px;
	color: #666666;
	padding: 6px 6px;
}

.f_list ul li:hover {
	background: #b2b2b2;
}


/* 저작권 표기 */
footer .f_copy_right {
	text-align: center;
}

footer .f_copy_right p {
	font-size: 12px;
	margin: 0;
}


</style>
</head>
<body>

	<footer>
		<div class="f_container">
			<div class="f_left">
				<h2>ANIMAL X ANITING</h2>
				<p>http://localhost:8089/aniting/</p>

				<div class="f_sns">
					<img src="resources/img/icon_footer_facebook.png"> <img
						src="resources/img/icon_footer_git.png"> <img
						src="resources/img/icon_footer_twitter.png"> <img
						src="resources/img/icon_footer_youtube.png">
				</div>
			</div>

			<div class="f_right">

				<div class="f_list">
					<h3>ABOUT</h3>
					<ul>
						<li>이용약관</li>
						<li>개인정보처리방침</li>
						<li>고객센터</li>
					</ul>
				</div>

			</div>

		</div>
		<div class="f_copy_right">
			<p>ⓒ aniting Corp.</p>
		</div>

	</footer>


</body>
</html>