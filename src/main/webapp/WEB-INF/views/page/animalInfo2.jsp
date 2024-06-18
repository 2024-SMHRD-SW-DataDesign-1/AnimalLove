<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

	
	#profil_imgs{
		display : flex;
		justify-content: space-around;
		align-items: center;

	}
	
	#profil_body{
		width : 800px;
		height : 65vh;
		flex-direction: column;
		justify-content: space-around;
		
		display : flex;
		align-content: space-around;
		magin : auto;
		
	}
	
	.profil_img {
		width : 200px;
		height : 400px;	
		
	}
	
	.btn {	
		width: 300px;
		height: 36px;
		font-size: 15px;
		color: #fff;
		border: 0;
		border-radius: 17px;
		background-color: #3c40c6;
		margin : auto;
	}
	
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	
	
		<form action="" id="profil_body" >
				<input type="file" style="display: none;" id="img_put">
				<div id=profil_imgs>
					<img class='profil_img' alt='빈사진' src="resources/img/nullPic.png"/>
					<img class='profil_img' alt='빈사진' src="resources/img/nullPic.png"/>
					<img class='profil_img' alt='빈사진' src="resources/img/nullPic.png"/>
				</div>
				<input class="btn" type="submit" value="프로필 등록" >
		</form>
			
	
		
	<script type="text/javascript">
		function getValue()
		{
			const storedList = JSON.parse(localStorage.getItem('dic'));
			return storedList;
		}
		
		let dic = getValue();
		
		const imageUpload = document.getElementById('img_put');
		console.log(dic);
		function open()
		{
			imageUpload.click();			
		}
		
	</script>
	<button onclick="open()">11	</button>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	
</body>
</html>