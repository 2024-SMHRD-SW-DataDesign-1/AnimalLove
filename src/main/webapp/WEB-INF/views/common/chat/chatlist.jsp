<%@page import="com.smhrd.myapp.model.MavenMember"%>
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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<style>
.text {
	color: gray;
	font-size: 10px;
}

.list-container {
	display: flex;
	justify-content: space-between;
	border-top: 1.2px solid #b5b5b5;
	border-bottom: 1.2px solid #b5b5b5;
	padding-top: 8px;
    padding-bottom: 8px;
    padding-left: 16px;
    padding-right: 10px;
}


.imgcontainer {
	style ="width: 48px;
	height: 50px;
	border-radius: 150px;
	background-color: skyblue;
}p
.list-content{
	display: flex;
	align-items: center;
}

.noread{
    margin-top: 0.6em;
	margin-left : 3.2em;
}

#chat_text{
	text-decoration : none;
	color:#3c40c6;
	font-weight: bold;
}

#chatReady {
	
	
	margin: 14px 16px;
}

.ch_r_btn{
	background: #fff;
    border: 0;
    outline: 1.2px solid #3c40c6;
    border-radius: 3px;
    width: 64px;
    height: 20px;

}

.ch_r_btn:hover{
	background: #e2e1e0;
    transition: all 100ms linear;
    cursor: pointer;
}

#btnContainer{
	width :100%;
	display : flex;
	justify-content: space-around;
	
}
</style>
</head>
<body>


	<div id="chatReady">

	</div>
	<div id="btnContainer">
	</div>
	<div id="chatModal">
		
	</div>
	
	<div id="lastlog">
	</div>

</body>

<script type="text/javascript">
	<%MavenMember member = (MavenMember) session.getAttribute("member");%>
	let userid = "<%=member.getU_id()%>";
	let session = [];
	let sum =0; 
	
	$(document).ready(function(){
		$.ajax({
			url: "roadchatlist",
			type: "POST",
			data: { u_id: userid },
			dataType:"json",
			success: function(chatList){
				load(chatList);
				
				noread(chatList);
				
				for(let i = 0; i < chatList.length; i++){
					var url = "ws://" + document.location.host + "/aniting/chat/" + chatList[i].c_id;
		            var ws =  new WebSocket(url);
					session.push(ws);
		            ws.onmessage = onMessage;
		        }
				
				
			},
			error: function(err) {
				console.error("Error:", err); // 에러 핸들링
			}
		});
	});
	
function load(chatList){
	$.each(chatList, (index,chat)=> {
		console.log(chat)
		if (chat.c_accept === 0 && chat.c_senid === userid) { // 조건 1: 요청 중인 채팅방
			$('#chatReady').append(
				'<div class="request-container">' +
					'<div>' + chat.c_recid + '님께 요청중입니다.</div>' +
				'</div>'
			);
		

		
		} else if (chat.c_accept === 0 && chat.c_recid === userid) { // 조건 2: 내가 받은 요청
			$('#chatReady').append(
				'<div class="request-container">' +
					'<div style="margin-bottom: 5px; margin-left: 5px;" >' + chat.c_senid + '님 온 요청</div>' +

				'</div>'
			);
			$('#btnContainer').append(
					'<a href="/aniting/accept/' + chat.c_id + '"><button class="ch_r_btn">수락</button></a>' +
					'<button class="ch_r_btn">거부</button>' +
					'<button class="ch_r_btn">정보확인</button>'	
			);
		} else if (chat.c_accept === 1 && chat.c_senid === userid) { // 조건 3: 다른사람이 보낸 요청을 수락한 채팅방
			$('#chatModal').append(
				'<div class="list-container">' +
					'<div class="list-content" style="display: flex;">' +
						'<div>' +
							'<a href="/aniting/chatting/' + chat.c_id + '" id="chat_text"><div>' + chat.c_recid + '님과의 채팅방</div></a>' +
							'<div id="lastLog'+chat.c_id+'">' + (chat.lastChatLog ? chat.lastChatLog.cl_log : '최근 대화가 없습니다.') + '</div>' +
						'</div>' +
						'<div id="noread'+chat.c_id+'" class="noread"></div>'+
					'</div>'+
					'<img src="resources/img/deleteBox1.png" style="width: 40px;height: 40px;" alt="휴지통" />' +
				'</div>'
			);
		} else if (chat.c_accept === 1 && chat.c_recid === userid) { // 조건 4: 내가 보낸 요청이 수락된 경우
			$('#chatModal').append(
				'<div class="list-container">' +
					'<div class="list-content" style="display: flex;">' +
						'<div>' +
							'<a href="/aniting/chatting/' + chat.c_id + '" id="chat_text"><div>' + chat.c_senid + '님과의 채팅방</div></a>' +
							'<div id="lastLog'+chat.c_id+'">' + (chat.lastChatLog ? chat.lastChatLog.cl_log : '최근 대화가 없습니다.') + '</div>' +
						'</div>' +
						'<div id="noread'+chat.c_id+'" class="noread"></div>'+
					'</div>'+
					'<img src="resources/img/deleteBox1.png" style="width: 40px;height: 40px;" alt="휴지통" />' +
				'</div>'
			);
		}
	});	
}

function noread(chatList){
	
	$.each(chatList, (index,chat)=> {
		$.ajax({
			url: "noread",
			type: "POST",
			data: { c_id : chat.c_id,
					u_id : userid },
			success: function(data){ console.log(data);
			sum= sum+parseInt(data);
				if(data !==0){
					$('#noread'+ chat.c_id).text(data);
					$('#mainnoread').text(sum);
				}
			
				
				
			},
			error: function(err) {
				console.error("Error:", err); // 에러 핸들링
			} 
		});
		
	});
	
	
} 

function onMessage(event){
	var msg = event.data; // WebSocket으로부터 받은 원시 데이터
	var json = JSON.parse(msg); // 수신된 메시지를 JSON 객체로 파싱
    var chatId = json.chatId;
    var message = json.message;
	
    // 해당 채팅방의 마지막 로그 업데이트
    var lastLogElement = $('#lastLog'+ chatId); // ID를 이용하여 해당 요소 선택
     if (lastLogElement.length > 0) { 
        lastLogElement.text(message); // 최근 대화 내용 업데이트
    } else {
        console.error('Element for last log not found.');
    }
    var noreadElement = $('#noread'+ chatId);
    if (noreadElement.text() === "") {
        // 요소가 존재하지 않을 때
        $('#noread' + chatId).text("1");
    } else {
        // 요소가 존재할 때
        var currentCount = parseInt(noreadElement.text(), 10); // 문자열을 정수로 변환
        $('#noread' + chatId).text(currentCount + 1);
    }
    
    if ($('#mainnoread').text() ===""){
    	$('#mainnoread').text("1");
    }else{
    	var currentCount = parseInt($('#mainnoread').text(), 10); // 문자열을 정수로 변환
    	$('#mainnoread').text(currentCount + 1);
    }

    
}

</script>

</html>

