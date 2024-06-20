<%@page import="com.smhrd.myapp.model.MavenMember"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% MavenMember member = (MavenMember)session.getAttribute("member");%>
	<% if (member == null) {%>
	<!-- href가 join이면 PageController에서 join이라고 하는 곳으로 이동 -->
	<a href="join"> <button>회원가입</button></a>
	<a href="login"> <button>로그인</button></a>
	<a href="findid"> <button>id찾기</button></a>
	<%} else{%>
	<a href="update"> <button>회원정보수정</button></a>
	<a href="delete?u_id=<%=member.getU_id()%>"><button>회원탈퇴</button></a>
	<% if(member.getU_id().equals("admin")){%>
		<a href="/list"><button>회원전체리스트</button></a>
	<% } %>
	<form action="member/call" method="post">
			채팅요청보낼ID <input type="text" name="c_recid">
			<input type="submit" value="요청보내기">
	</form>
	<a href="chatlist"><button>채팅목록</button></a>
	
	<a href="chat"> <button>지도</button></a>
	<a href="logout"> <button>로그아웃</button></a>
	<%} %>
	
	<% String id = (String)request.getAttribute("id");%>
	<%if(id!=null){ %>
	<script>
        // URL 파라미터로부터 가져온 ID를 사용하여 알림창으로 표시
        alert('인증에 성공했습니다. ID는 <%= id %>입니다.');
    </script>
	<%} %>
	
</body>
</html>