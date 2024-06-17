<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<title>Document</title>

<style>

@media screen and (max-width:640px) {
	header {
		flex-direction: column;
	}
	
	#chatList_box{
		left : 50%;
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

header {
	display: flex;
	justify-content: space-between;
	width: 100%;
	align-items: center;
	padding: 1.2rem 0;
}

.h_container {
	max-width: 800px;
	margin: 0 auto;
	box-sizing: border-box;
	display: flex;
	flex-direction: column;
	justify-content: space-between;
	align-items: center;
	text-decoration: none;
}


/*애니팅, 로고 이미지*/
header .h_title {
	display: flex;
	align-items: center;
}

/*애니팅 속성*/
#h_name {
	font-size: 2rem;
	font-weight: 700;
	text-decoration: none;
	color: #333333;
	font-family: 'BMJUA';
	margin-left : 10px;
}

header>div>ul>li {
	list-style-type: none;
}


/*로고이미지 속성*/
#h_logo {
	width: 70px;
	height: 70px;
}

/*카테고리 속성*/
header>ul {
	display: flex;
}

/*매칭,위치,마이 속성*/
.h_list {
	list-style-type: none;
	margin-left: 4rem;
	padding-bottom: 10px;
	text-decoration: none;
}


/*매칭,위치,마이,로그인 속성*/
.h_category {
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
#h_angle {
	filter: opacity(0.5) drop-shadow(0 0 0 #333333);
	width: 24px;
}

#chat_icon
{
	position : fixed;
	left : 90%;
	top : 90%;
	background-color : red;
	width: 30px;
	border-radius: 20px;
	z-index : 100;
}

#chatList_box
{
	
	position : fixed;
	left : 75%;
	top : 57%;
	border : 2px solid #000000;
	width : 300px;
	height : 300px;
	z-index : 100;
	overflow-y:auto; 	
}



</style>

</head>
<body>
	<div class="h_container">
		<header>
			<div class="h_title">
				<a href="main"><img src="resources/img/img_logo.png" id="h_logo"></a>
				<ul>
					<li><a href="main" id="h_name">애니팅</a></li>
				</ul>
			</div>
			<ul>
				<li class="h_list"><a href="#" class="h_category">매칭</a></li>
				<li class="h_list"><a href="#" class="h_category">위치</a></li>
				<li class="h_list"><a href="#" class="h_category">마이페이지</a></li>

			</ul>
			<ul>
				<li class="h_list"><a href="login" class="h_category">로그인</a></li>
				<a href="login"><img src="resources/img/icon_angle.png" id="h_angle"></a>
			</ul>

		</header>


	</div>
	<div id="chatList_box">
			<jsp:include page="/WEB-INF/views/common/chat/chatlist.jsp"></jsp:include>
	</div>
	<div id="chat_icon" onclick="chatListView()">
		채팅
	</div>
	
	<script type="text/javascript">
		function chatListView()
		{
			let chatList = document.getElementById("chat_icon");
			var visibilityStyle = window.getComputedStyle(chatList).getPropertyValue('visibility');
			console.log(visibilityStyle)
			
		}
		
	</script>
</body>
</html>