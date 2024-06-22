<%@page import="com.smhrd.myapp.model.MavenMember"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DevEric Chatting</title>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/b145cfedc2.js" crossorigin="anonymous"></script>

<style type="text/css">


@font-face {
    font-family: 'NanumSquareRound';
    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_two@1.0/NanumSquareRound.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

* {
	text-align: center;
	font-family: 'NanumSquareRound';
}

/*뒤로가기*/
#c_icon_back{
	text-align: start;
	margin: 8px;
	padding-left: 10px;
}

#chat_back {
	text-decoration : none;
	color: #383838;
	text-align: left;
}


#messageWindow {
	background: black;
	color: greenyellow;
}

#inputMessage {
	width: 480px;
	height: 30px
}


/*전송 버튼*/
#btn-submit {
	background: #ff7878;
	width: 76px;
	height: 40px;
	font-size: 17px;
	border-radius: 22px;
	color: #fff;
	font-weight: bold;
	border: none;
}


/*채팅 컨테이너*/
#main-container {
	width: 600px;
	height: 680px;
	border: 1px solid #666666;
	border-radius: 10px;
	margin: 10px;
	display: inline-block;
	background-color: #ffebeb;
}

#chat-container {
	vertical-align: bottom;
	border: 1px solid black;
	margin: 10px;
	min-height: 500px;
	max-height: 580px;
	overflow: scroll;
	overflow-x: hidden;
	background: #fff;
}

.chat {
	font-size: 20px;
	margin: 5px;
	min-height: 20px;
	padding: 5px;
	min-width: 50px;
	height: auto;
	word-break: break-all;
	background: #ebebeb;
	width: auto;
	display: inline-block;
	border-radius: 20px;
}

.notice {
	color: #607080;
	font-weight: bold;
	border: none;
	text-align: center;
	background-color: #9bbbd4;
	display: block;
}

.my-chat {
	background: #ff7878;
	border-radius: 20px;
	color:#fff;
}

#bottom-container {
	margin: 10px;
}

.chat-info {
	color: #556677;
	font-size: 10px;
	text-align: right;
	padding: 5px;
	padding-top: 0px;
}

.chat-box {
	text-align: left;
}

.my-chat-box {
	text-align: right;
}



</style>
</head>
<body>
	<div id="main-container">
		<div id="c_icon_back">
			<a href="/aniting" id="chat_back"><i class="fa-solid fa-arrow-left fa-lg"></i></a>
		</div>
		<div id="chat-container"></div>
		<div id="bottom-container">
			<input id="inputMessage" type="text" name="log" style="
    text-align: left;"> 
			<input id="btn-submit" type="submit" value="전송">
		</div>
	</div>

	<script type="text/javascript">
		<% MavenMember member = (MavenMember) session.getAttribute("member"); %>
		var chatId = "${c_id}";
		var userIdFromJSP = "<%= member.getU_id() %>";
		
		console.log(chatId);
		console.log(userIdFromJSP);

		$(document).ready(function(){
			readLog();
		});

		var inputMessage = document.getElementById('inputMessage');
		var webSocket = new WebSocket("ws://" + document.location.host + "/aniting/chat/" + chatId);

		webSocket.onerror = function(e) {
			onError(e);
		};
		webSocket.onopen = function(e) {
			console.log("WebSocket 연결이 열렸습니다.");
			 $.ajax({
				type: "POST",
				url: "/aniting/chat/ruread",
				data: { c_id: chatId, c_senid: userIdFromJSP },
				success: function(response) {
					console.log(response);
				},
				error: function(xhr, status, error) {
					console.error("Error updating read status: ", status, error);
				}
			}); 
		};
		webSocket.onmessage = function(e) {
			onMessage(e);
		};

		function onMessage(e) {
			var chatM = e.data;
			var json = JSON.parse(chatM);
			var chatMsg = json.message;
			var date = new Date();
			var dateInfo = date.getHours() + ":" + date.getMinutes() + ":" + date.getSeconds();
			
			$.ajax({
				type: "POST",
				url: "/aniting/chat/ruread",
				data: { c_id: chatId, c_senid: userIdFromJSP },
				success: function(response) {
					console.log(response);
				},
				error: function(xhr, status, error) {
					console.error("Error updating read status: ", status, error);
				}
			});			
			
			if (chatMsg.substring(0, 6) == 'server') {
				var $chat = $("<div class='chat notice'>" + chatMsg + "</div>");
				$('#chat-container').append($chat);
			} else {
				var $chat = $("<div class='chat-box'><div class='chat'>" + chatMsg + "</div><div class='chat-info chat-box'>" + dateInfo + "</div></div>");
				$('#chat-container').append($chat);
			}

			$('#chat-container').scrollTop($('#chat-container')[0].scrollHeight + 20);
		}

		function readLog() {
			var importLog = { cl_c_id: chatId };

			$.ajax({
				type: "POST",
				url: "/aniting/chat/roadLog",
				data: JSON.stringify(importLog),
				contentType: "application/json; charset=utf-8",
				dataType: "json",
				success: function(response) {
					$.each(response, function(index, vo) {
						console.log(vo.cl_senid);
						console.log(userIdFromJSP);

						if (vo.cl_senid === userIdFromJSP) {
							var $chat = $("<div class='my-chat-box'><div class='chat my-chat'>" + vo.cl_log + "</div></div>");
							$('#chat-container').append($chat);
						} else {
							var $chat = $("<div class='chat-box'><div class='chat'>" + vo.cl_log + "</div></div>");
							$('#chat-container').append($chat);
						}
					});

					inputMessage.value = "";
					$('#chat-container').scrollTop($('#chat-container')[0].scrollHeight + 20);
				},
				error: function(xhr, status, error) {
					console.error("Error loading chat log: ", status, error);
				}
			});
		}

		function send() {
			var chatMsg = inputMessage.value;

			if (chatMsg === '') {
				return;
			}

			var chatLog = {
				cl_c_id: chatId,
				cl_senid: userIdFromJSP,
				cl_log: chatMsg
			};

			$.ajax({
				type: "POST",
				url: "/aniting/chat/send",
				data: JSON.stringify(chatLog),
				contentType: "application/json; charset=utf-8",
				success: function(response) {
					var $chat = $("<div class='my-chat-box'><div class='chat my-chat'>" + chatMsg + "</div></div>");
					$('#chat-container').append($chat);
					webSocket.send(chatMsg);
					inputMessage.value = "";
					$('#chat-container').scrollTop($('#chat-container')[0].scrollHeight + 20);
				},
				error: function(xhr, status, error) {
					console.error("Error sending message: ", status, error);
				}
			});
		}

		function onError(e) {
			console.error("WebSocket error: ", e);
		}

		$(function() {
			$('#inputMessage').keydown(function(key) {
				if (key.keyCode === 13) {
					send();
				}
			});
			$('#btn-submit').click(function() {
				send();
			});
		});
	</script>
</body>
</html>