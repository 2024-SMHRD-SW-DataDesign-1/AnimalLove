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

		
		display : flex;
		align-content: space-between;
		flex-direction: column;
		justify-content: space-evenly;
		margin : auto;
		
	}
	
	.profil_img {
		width : 200px;
		height : 300px;	
		
	}
	
	.btn {	
		width: 300px;
		height: 36px;
		font-size: 15px;
		color: #fff;
		border: 0;
		border-radius: 17px;
		background-color: #3c40c6;
		margin : 0 auto 0 auto;
	}
	
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	
	
		<div action="anmal_info/save" id="profil_body" >
				<input type="file" accept="image/*" id="img_put" >
				<div id=profil_imgs>
					<img class='profil_img' alt='빈사진' src="resources/img/nullPic.png"/>
					<img class='profil_img' alt='빈사진' src="resources/img/nullPic.png"/>
					<img class='profil_img' alt='빈사진' src="resources/img/nullPic.png"/>
				</div>
				<input class="btn" type="submit" onclick="toSend()" value="프로필 등록" >
		</div>
			
	
		
	<script type="text/javascript">
		function getValue()
		{
			const storedList = JSON.parse(localStorage.getItem('dic'));
			return storedList;
		}
		let defaultImg = "nullPic.png";
		let dic = getValue();
		
		const imageUpload = document.getElementById('img_put');
		let imgs = document.getElementsByClassName("profil_img");
		
		let imgIdx = 0;
		
		imageUpload.addEventListener('change', function(event) {
            const file = event.target.files[0];
			if(imgIdx == 3)
			{
				return;
			}
            if (file) {
                const reader = new FileReader();
                reader.onload = function(e) {
               		//imgs[i].src = "resources/img/" + file.name;
               		imgs[imgIdx].src = e.target.result;
               		imgIdx++;           		   		
               		                    
                };
                reader.readAsDataURL(file);
            }
        });
		
		
		function toSend()
		{
			window.location = "/anithing/like"
		}
		
	</script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	
</body>
</html>