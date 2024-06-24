<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Animal info here</title>
<style type="text/css">

/* 타이틀 폰트 */
@font-face {
	font-family: 'Cafe24Meongi-W-v1.0';
	src:
		url('https://fastly.jsdelivr.net/gh/projectnoonnu/2405-3@1.1/Cafe24Meongi-W-v1.0.woff2')
		format('woff2');
	font-weight: normal;
	font-style: normal;
}

/* 타이틀 */
#ani_title {
	font-family: 'Cafe24Meongi-W-v1.0';
	color: #333333;
	font-size: 50px;
	text-align: center;
}

#profil_imgs {
	display: flex;
	justify-content: space-around;
	align-items: center;
	pointer-events: none;
}

#profil_body {
	width: 800px;
	height: 65vh;
	display: flex;
	align-content: space-between;
	flex-direction: column;
	justify-content: space-evenly;
	margin: auto;
}

.profil_img {
	width: 200px;
	height: 300px;
}

.btn {
	width: 300px;
	height: 36px;
	font-size: 15px;
	color: #fff;
	border: 0;
	border-radius: 17px;
	background-color: #3c40c6;
	margin: 0 auto 0 auto;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>
<body>

	<!-- 헤더 -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>


	<form action="animal_info/save" id="profil_body" method="POST" enctype="multipart/form-data"> 
		<h2 id="ani_title">
			My Animal<br>photo
		</h2>
		<input type="file" id="photo" multiple name="photo">
		<div id=profil_imgs>
			<input type="image" name="photo1" class='profil_img' alt='빈사진' src="resources/img/nullPic.png" /> 
			<input type="image"	name="photo2" class='profil_img' alt='빈사진' src="resources/img/nullPic.png" /> 
			<input type="image" name="photo3" class='profil_img' alt='빈사진' src="resources/img/nullPic.png" /> 
		</div>
		<input class="btn" type="submit" value="프로필 등록">
	</form>
		



	<!-- 푸터 -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

</body>

<script type="text/javascript">
	function getValue() {
		const storedList = sessionStorage.getItem('key');
		return storedList;
	}
	let defaultImg = "nullPic.png";
	let dic = getValue();
	//
	const imageUpload = document.getElementById('photo');
	let imgs = document.getElementsByClassName("profil_img");
	
	
	let imgIdx = 0;

	imageUpload.addEventListener('change', function(event) {
		const file = event.target.files;
		
		
		for(let i = 0; i< file.length; i++)
		{	
			if (file[i]) {
				const reader = new FileReader();
				reader.onload = function(e) {
					if (imgIdx == 3) {
						imgIdx = 0;
					}
					imgs[imgIdx].src = e.target.result;
					imgIdx++;				
				};
				reader.readAsDataURL(file[i]);
			}
		}
		
		

	});

	// 헤더에 매칭 강조
	let login = document.getElementById("h_mat");
	login.style = "border-bottom : 2px solid #3c40c6; border-radius: 2px; color : #3c40c6;";
</script>

</html>