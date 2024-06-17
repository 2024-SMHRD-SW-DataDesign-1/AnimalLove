<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	보낸요청<br>
	<c:forEach var="b" items="${chatlist}">
		<c:choose>
			<c:when test="${b.c_accept==0}">
				${b.c_recid}님께 요청중입니다.<br>
			</c:when>
			<c:otherwise>
				${b.c_recid}님과 채팅하기<a href="/aniting/chatting/${b.c_id}"><button>채팅</button></a><br>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	받은요청<br>
	<c:forEach var="b" items="${receivelist}">
		<c:choose>
			<c:when test="${b.c_accept==0}">
				${b.c_senid}님이 채팅을 요청하셨습니다.<a href="../accept/${b.c_recid}"><button>수락하기</button></a><br>
			</c:when>
			<c:otherwise>
				${b.c_senid}님과 채팅하기<a href="/aniting/chatting/${b.c_id}"><button>채팅</button></a><br>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	


</body>
</html>