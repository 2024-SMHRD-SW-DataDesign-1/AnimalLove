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
	<%} else{%>
	<a href="update"> <button>회원정보수정</button></a>
	<a href="member/delete?id=<%=member.getId()%>"><button>회원탈퇴</button></a>
	<% if(member.getId().equals("admin")){%>
		<a href="member/list"><button>회원전체리스트</button></a>
	<% } %>
	<a href="/member/logout"> <button>로그아웃</button></a>
	<%} %>
	<a href="chat"> <button>채팅</button></a>
	
	<a href="chat"> <button>지도</button></a>
</body>
</html>