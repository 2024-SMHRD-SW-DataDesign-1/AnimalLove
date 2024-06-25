<%@page import="com.smhrd.myapp.model.MavenMember"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>header here</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/b145cfedc2.js" crossorigin="anonymous"></script>

<style>
@media screen and (max-width:640px) {
	header {
		flex-direction: column;
	}
	#chatList_box {
		left: 50%;
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
	margin-left: 10px;
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
.h_category:hover {
	border-bottom: 2px solid #3c40c6;
	border-radius: 2px;
	color: #3c40c6;
}

/*아이콘 속성*/
#h_angle {
	filter: opacity(0.5) drop-shadow(0 0 0 #333333);
	width: 24px;
}

#h_out {
	filter: opacity(0.5) drop-shadow(0 0 0 #333333);
	width: 24px;
	margin-left: 5px;
}



/* 채팅알림 */
#mainnoread
{
	color:#ff3f34;;
	font-family: 'BMJUA';
	font-size: 18px;
    position: fixed;
    left: 89%;
    top: 84%;
    border-radius: 100%;
    width: 26px;
    height: 26px;
    text-align: center;
}


/*채팅*/
#chat_box {
	position: fixed;
	left: 89%;
	top: 86%;
	background-color: #3c40c6;
	width: 64px;
	height: 64px;
	border-radius: 100%;
	z-index: 100;
	color : #fff;
	text-align: center;
}

#chat_icon {
	margin-top:14px;
}

#chatList_box {
	display: none;
	position: fixed;
	left: 75%;
	top: 57%;
	border: 2px solid #3c40c6;
	border-radius: 20px;
	background-color:#fff;
	width: 320px;
	height: 320px;
	z-index: 100;
	overflow-y: auto;
}





</style>

</head>
<body>
	<div class="h_container">
		<header>
			<div class="h_title">
				<a href="/aniting"><img src="resources/img/img_header_logo.png"
					id="h_logo"></a>
				<ul>
					<li><a href="/aniting" id="h_name">애니팅</a></li>
				</ul>
			</div>
			<ul>
				<li class="h_list"><a href="matching" class="h_category" id="h_mat">매칭</a></li>
				<li class="h_list"><a href="information" class="h_category" id="h_laca">위치</a></li>
				<li class="h_list"><a href="update" class="h_category" id="h_my">마이페이지</a></li>
			</ul>

			<% MavenMember member = (MavenMember)session.getAttribute("member");%>
			<% if (member == null) {%>
			<!-- 비로그인 시 -->
			<ul>	
				<li class="h_list"><a href="login" class="h_category"
					id="h_login">로그인</a></li>
				<a href="login"><img src="resources/img/icon_header_angle.png"
					id="h_angle"></a>
			</ul>
			<%} else{%> 
			<!-- 로그인 시 -->
			<ul>
				<li class="h_list"><a href="update" class="h_category" id="h_login"><%=member.getU_nickname()%>님</a></li>
				<a href="logout"><img src="resources/img/icon_header_logout.png"
					id="h_out"></a>
			</ul>
			
			<%} %>
		</header>


	</div>
	<%if(member!=null){ %>
	<div id="chatList_box">
		<jsp:include page="/WEB-INF/views/common/chat/chatlist.jsp"></jsp:include>
	</div>
	<div id="chat_box" onclick="chatListView()">
		<i class="fa-regular fa-comment fa-2x" id="chat_icon"></i>
	</div>
	<div id="mainnoread"></div>
	

	<script type="text/javascript">
		function chatListView() {

			if ($('#chatList_box').css('display') === 'none') {
				$('#chatList_box').show();

			} else {
				$('#chatList_box').hide();

			}

		}
		
	</script>
	<%} %>
</body>
</html>