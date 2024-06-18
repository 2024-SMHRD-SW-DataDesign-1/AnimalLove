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
		pointer-events: none;
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	
	
		<form action="anmal_info/save" id="profil_body" >
				<input type="file" accept="image/*" id="img_put" multiple name="a_path1">
				<div id=profil_imgs>
					<input type="image"  class='profil_img' alt='빈사진' src="resources/img/nullPic.png" />
					<input type="image"  class='profil_img' alt='빈사진' src="resources/img/nullPic.png" />
					<input type="image"  class='profil_img' alt='빈사진' src="resources/img/nullPic.png" />
					
					<input type="hidden" name="a_path1" class="imageSrc" value="one">
        			<input type="hidden" name="a_path2" class="imageSrc" value="one">
        			<input type="hidden" name="a_path3" class="imageSrc" value="one">
				</div>
				<input class="btn" type="submit" onclick="toSend()" value="프로필 등록" >
				<div >111</div>
		</form>
			
		
	<script type="text/javascript">
		function getValue()
		{
			const storedList = sessionStorage.getItem('key');
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
			let dataList = {
					a_path1 : imgs[0].src,
					a_path2 : imgs[1].src,
					a_path3 : imgs[2].src
			}
			
			$.ajax({
				url:"animalInfo/save",// 요청경로
				type : "post",
				data : dataList,
				success : function (res) {
					console.log(res)
	
				},
				error :function(){
					console.log("통신실패");
				}
			
			})
		}
		
	</script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	
</body>
</html>