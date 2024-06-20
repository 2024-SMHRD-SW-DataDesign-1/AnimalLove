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


<style type="text/css">
* {
	font-family: 나눔고딕;
}

#messageWindow {
	background: black;
	color: greenyellow;
}

#inputMessage {
	width: 500px;
	height: 20px
}

#btn-submit {
	background: white;
	background: #F7E600;
	width: 60px;
	height: 30px;
	color: #607080;
	border: none;
}

#main-container {
	width: 600px;
	height: 680px;
	border: 1px solid black;
	margin: 10px;
	display: inline-block;
}

#chat-container {
	vertical-align: bottom;
	border: 1px solid black;
	margin: 10px;
	min-height: 600px;
	max-height: 600px;
	overflow: scroll;
	overflow-x: hidden;
	background: #9bbbd4;
}

.chat {
	font-size: 20px;
	color: black;
	margin: 5px;
	min-height: 20px;
	padding: 5px;
	min-width: 50px;
	text-align: left;
	height: auto;
	word-break: break-all;
	background: #ffffff;
	width: auto;
	display: inline-block;
	border-radius: 10px 10px 10px 10px;
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
	text-align: right;
	background: #F7E600;
	border-radius: 10px 10px 10px 10px;
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
		<div id="chat-container"></div>
		<div id="bottom-container">
			<input id="inputMessage" type="text" name="log"> 
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