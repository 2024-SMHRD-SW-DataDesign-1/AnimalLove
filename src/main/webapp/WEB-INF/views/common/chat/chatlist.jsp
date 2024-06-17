<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.myapp.model.Chat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        .text{
            color:gray;
            font-size: 10px;
        }
    </style>
</head>
<body>
    <div id="chatReady">
		<span class="text">알림</span> 
		<!-- 보낸요청 -->
		<c:forEach var="b" items="${chatlist}">
		
			<c:choose>
				<!-- 상대방에게 신청 했을때 -->
				<c:when test="${b.c_accept==0}">
					<!-- src에 이미지 경로 넣어야됨 --> 
								
					<div style="display:flex; justify-content: space-between;  border-top:1px solid black; border-bottom:1px solid black;">
					<!-- src에 이미지 경로 넣어야됨 --> 
					<img src="#" style="width: 48px; height: 50px; border-radius: 150px; background-color: skyblue;"/>
						<div> ${b.c_recid}님께 요청중입니다 .</div>
					   	<button>수락</button>
					   	<button>거부</button>
					  	<button>정보확인</button>
					</div>
				</c:when>
			</c:choose>
		</c:forEach>
		
		<c:forEach var="b" items="${chatlist}">
			<c:choose>
				<!-- 상대방에게 신청 했을때 -->
				<c:when test="${b.c_accept==0}">
					<!-- src에 이미지 경로 넣어야됨 --> 
								
					<div style="display:flex; justify-content: space-between;  border-top:1px solid black; border-bottom:1px solid black;">
					<!-- src에 이미지 경로 넣어야됨 --> 
					<img src="#" style="width: 48px; height: 50px; border-radius: 150px; background-color: skyblue;"/>
						<div> ${b.c_recid}님 온 요청</div>
					   	<button>수락</button>
					   	<button>거부</button>
					  	<button>정보확인</button>
					</div>
				</c:when>
			</c:choose>
		</c:forEach>
    </div>
    <div id="chatModal">
        <span class="text">채팅방목록</span> 
        
    </div>
    
		<c:forEach var="b" items="${chatlist}">
		
			<c:choose>
				<!-- 상대방에게 신청 했을때 -->
				<c:when test="${b.c_accept==1}">
			
					<div style="display:flex; justify-content: space-between;  border-top:1px solid black; border-bottom:1px solid black;"> 
                		<img src="#" style="width: 48px; height: 50px; border-radius: 150px; background-color: skyblue;">
                		<div>
                			<div> ${b.c_recid}님 채팅방</div>
	                    	<div> 마지막문구 </div>
                		</div>
                		<img src="resources/img/deleteBox.png" style="width:40px;" alt='휴지통'/>
            		</div>
				</c:when>
			</c:choose>
		</c:forEach>
		
		<c:forEach var="b" items="${chatlist}">
		
			<c:choose>
				<!-- 상대방에게 신청 했을때 -->
				<c:when test="${b.c_accept==1}">
					<div style="display:flex; justify-content: space-between;  border-top:1px solid black; border-bottom:1px solid black;"> 
                		<img src="#" style="width: 48px; height: 50px; border-radius: 150px; background-color: skyblue;">
                		<div>
                			<div> ${b.c_recid}님 채팅방</div>
	                    	<div> 마지막문구 </div>
                		</div>
                		<img src="resources/img/deleteBox.png" style="width:40px;" alt='휴지통'/>
            		</div>
				</c:when>
			</c:choose>
		</c:forEach>



    <script>
    
    	
        let div = document.getElementById("chatModal");
        let ready = document.getElementById("chatReady");
        
		

        function getChatList(userId, LastMSG, imgPath)
        {
        	let result = 
            "<div style='display:flex; justify-content: space-between;  border-top:1px solid black; border-bottom:1px solid black;'>" + 
                "<div style='width: 48px; height: 50px; border-radius: 150px; background-color: skyblue;'></div>"+
                "<div>"+
                    "<div>" + userId + "님 과의 채팅방" + "</div>"+
                    "<div>" + LastMSG + "</div>" +
                "</div>" +
                "<img src='" + imgPath + "' style='width:40px;' alt='휴지통'>" +
            "</div>";
        	return result;
        }
        
        function getChatReady(imgPath)
        {
        	let result =
                "<div style='display:flex; justify-content: space-between;  border-top:1px solid black; border-bottom:1px solid black;'>" + 
                	"<img src='" + imgPath + "' style='width: 48px; height: 50px; border-radius: 150px; background-color: skyblue;'>이미지</img>"+
                	"<button>수락</button>" +
                	"<button>거부</button>" +
                	"<button>정보확인</button>" +
            	"</div>";
        	return result; 	
        };
        
        


        //ready.innerHTML += chatready;
    </script>
</body>
</html>