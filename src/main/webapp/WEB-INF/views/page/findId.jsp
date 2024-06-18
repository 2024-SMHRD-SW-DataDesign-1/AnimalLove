<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String message = (String) session.getAttribute("message");
    if (message != null) {
        session.removeAttribute("message"); // 메시지를 세션에서 제거하여 페이지 새로고침 시 알림이 다시 표시되지 않도록 합니다.
    }
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Find ID here</title>

<style>

* {
	margin: 0px;
	padding: 0px;
}

.id_container {
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

@font-face {
	font-family: 'Cafe24Meongi-W-v1.0';
	src:
		url('https://fastly.jsdelivr.net/gh/projectnoonnu/2405-3@1.1/Cafe24Meongi-W-v1.0.woff2')
		format('woff2');
	font-weight: normal;
	font-style: normal;
}


#id_title {
	font-family: 'Cafe24Meongi-W-v1.0';
	color: #333333;
	font-size: 50px;
	padding-top: 10px;
}


#id_sub {
	font-size: 15px;
	padding: 14px;
}

/* ID, PW */
input[type="text"], input[type="email"] {
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

input[placeholder="이름"], input[placeholder="이메일"] {
	font-family: 'pretendard';
}

.id_btn {
	width: 100px;
	height: 36px;
	font-size: 15px;
	color: #fff;
	border: 0;
	border-radius: 17px;
	background-color: #3c40c6;
	margin-bottom: 14px;
}

.id_btn_container {
	display: flex;
	justify-content: space-around;
}

.id_btn:active {
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

</style>

<!-- 모달 스크립트 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<jsp:include page="/WEB-INF/views/common/header.jsp" />

</head>

<body>

<div class="id_container">
	
		<form action="findidcon" method="post">
		
			<h2 id="id_title">ID Search</h2>
			<p id="id_sub">ID 찾기</p>
			<br>
				<input type="text" placeholder="이름" name="id_name" required > <br>
				<input type="email" placeholder="이메일" name="id_email" required> <br>
			
			<div class="id_btn_container">
				<input type="submit" value="id찾기" class="id_btn" onclick="alter_action()">
			</div>


		</form>

	</div>

	

<script>
	function showmodal(dic){
		Swal.fire(
			  dic
			);
	}
	
	function alter_action(){

	}

	<% if (message != null) { %>
    	<% if ("success".equals(message)) { %>
        showmodal({title: "전송 완료! 😄",
        	text: "메일함을 확인해주세요.",
        			icon: "success"   });
    <% } else if ("fail".equals(message)) { %>
           showmodal({title: "전송 실패 😥",
   			text: "이름과 이메일을 다시 확인해주세요.",
   			icon: "error"   });
		   	<% } %>
		<% } %>

</script>
</body>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</html>