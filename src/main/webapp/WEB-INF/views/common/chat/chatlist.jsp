<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body >
	<img alt="" src="">
	<div id="chatList_inner">
		<script type="text/javascript">
			function setTag(idx)
			{
				//let tag = "<div style='width:100%; background-color: #3c40c6; display=flex;'><img src=""/><div style= 'display:flex; flex-direction: column;'><div>채팅방이름</div><div>마지막채팅대화</div></div></div>";
				let result = "";
				for(let i = 0; i< idx; i++)
				{
					result += tag;	
				}
				return result;	
			}
			let tag = 
			"<div style=\'background-color:red; display=flex;  \'> " +
				"<img alt=\'nullData\' src=resources/img/img_logo.png style=width:80px;>" +
				"<div  >" +
					"<div>채팅방이름</div>" +
					"<div>마지막채팅대화</div>" +
				"</div>" +
			"</div>";
			$("#chatList_inner").html(tag);
			


		
			
		</script> 
	</div>
</body>
</html>