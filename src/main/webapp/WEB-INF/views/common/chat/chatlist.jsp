<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        
    </div>
    <div id="chatModal">
        <span class="text">채팅방목록</span> 
        
    </div>
    
    <script>
        let div = document.getElementById("chatModal");
        let ready = document.getElementById("chatReady");
       
        let chatlist =
        "<div style='display:flex; justify-content: space-between;  border-top:1px solid black; border-bottom:1px solid black;'>" + 
            "<div style='width: 48px; height: 50px; border-radius: 150px; background-color: skyblue;'>이미지</div>"+
            "<div>"+
                "<div>채팅방이름</div>"+
                "<div>마지막채팅</div>" +
            "</div>" +
            "<img src='resources/img/deleteBox.png' style='width:40px;' alt='휴지통'>" +
        "</div>";

        div.innerHTML += chatlist;
        let  chatready = 
        "<div style='display:flex; justify-content: space-between;  border-top:1px solid black; border-bottom:1px solid black;'>" + 
            "<div style='width: 48px; height: 50px; border-radius: 150px; background-color: skyblue;'>이미지</div>"+
            "<button>수락</button>" +
            "<button>거부</button>" +
            "<button>정보확인</button>" +
        "</div>";
		
        for(let i = 0; i< 10; i++)
        {
        	ready.innerHTML += chatready;
        }
        ready.innerHTML += chatready;
    </script>
</body>
</html>