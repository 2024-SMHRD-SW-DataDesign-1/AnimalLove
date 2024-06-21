<%@page import="com.smhrd.myapp.model.Animal"%>
<%@page import="com.smhrd.myapp.model.MavenMember"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Animal info here</title>

<style>
* {
	margin: 0px;
	padding: 0px;
	
}

.profil_img {
	width: 200px;
	height: 300px;
}

#profil_imgs {
	display: flex;
	justify-content: space-around;
	align-items: center;
	pointer-events: none;
}
.animal_form {
	max-width: 800px;
	margin: 0 auto;
	box-sizing: border-box;
	flex-direction: column;
	display: flex;
	justify-content: space-around;
	align-items: center;
	overflow-y:auto
}

@font-face {
	font-family: 'Cafe24Meongi-W-v1.0';
	src:
		url('https://fastly.jsdelivr.net/gh/projectnoonnu/2405-3@1.1/Cafe24Meongi-W-v1.0.woff2')
		format('woff2');
	font-weight: normal;
	font-style: normal;
}

#ani_title {
	font-family: 'Cafe24Meongi-W-v1.0';
	color: #333333;
	font-size: 50px;
	text-align: center;
}



p {
	margin-bottom: 8px;
	margin-left: 50px;
	font-family: 'pretendard';
}

.ani_text {
	width: 250px;
	height: 36px;
	font-size: 15px;
	border: 0;
	border-radius: 15px;
	outline: none;
	padding-left: 10px;
	background-color: rgb(233, 233, 233);
}

.btn {
	width: 262px;
	height: 36px;
	font-size: 15px;
	color: #fff;
	border: 0;
	border-radius: 17px;
	background-color: #3c40c6;
	margin-top: 10px;
	margin-left: 50px;
}

.btn:active {
	width: 262px;
	height: 36px;
	font-size: 15px;
	color: #3c40c6;
	border: 0;
	border-radius: 17px;
	outline: none;
	outline-style: solid;
	outline-width: 1px;
	background-color: #fff;
}

select {
	margin-bottom: 10px;
	outline: 0;
	color: black;
	border: 1.5px solid #3c40c6;
	padding: 4px;
	border-radius: 9px;
}

input[type='radio'] {
	-webkit-appearance: none;
	appearance: none;
	width: 15px;
	height: 15px;
	border: 2px solid #ccc;
	border-radius: 50%;
	outline: none;
	cursor: pointer;
}

input[type='radio']:checked {
	background-color: #3c40c6;
	border: 3.5px solid white;
	box-shadow: 0 0 0 1px #3c40c6;
}

input[type="text"], input[type="number"], input[placeholder="kg"] {
	font-size: 14px;
}

.center{
	margin-left: 50px;
}

</style>
</head>
<body>

	<!-- 헤더 -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<%
	MavenMember member = (MavenMember) session.getAttribute("member");
	%>
	<%Animal animal = (Animal) request.getAttribute("animal"); %>

	<div class="animal_form">

		<form action="#" id="infoadd">
			<h2 id="ani_title">My Animal Info Update</h2>
			<input type="hidden" name = "a_u_id" value="<%=member.getU_id()%>">
			<br>
			<p>동물 이름 </p>
			<p>
				<input type="text" class="ani_text" name="a_name" value="<%=animal.getA_name()%>" required id="u_id">
			</p>

			<p>나이</p>
			<p>
				<input type="number" class="ani_text" name="a_age" value="<%=animal.getA_age()%>">
			</p>


			<p>몸무게</p>
			<p>
				<input type="number" class="ani_text" name="a_weight" value="<%=animal.getA_weight()%>"
					placeholder="kg" min="1">
			</p>


			<p>동물 성별</p>
			<p>
				<input type="radio" name="a_gender" id="male" value="male"> Male <input
					type="radio" name="a_gender" id="female" value="female"> Female
			</p>

			<p>품종</p>
			<p>
				<input onclick="onClickEvent()" name="a_animal" id="dog"
					type="radio" value="dog"> Dog <input
					onclick="onClickEvent()" name="a_animal" id="cat" type="radio"
					value="cat"> Cat
			</p>


			<p>상세품종</p>
			<p>
				<select name="a_breed" id="a_breed" value="<%=animal.getA_breed()%>">

				</select>
			</p>
			
			<p>소개글</p>
			<textarea class="center" name="a_intro" id="" cols="40" rows="8" ><%=animal.getA_intro()%></textarea><br>
			<input type="file" id="photo" multiple name="photo">
		<div id=profil_imgs>
			<input type="image" name="photo1" class='profil_img' alt='빈사진' src="resources/img/nullPic.png" /> 
			<input type="image"	name="photo2" class='profil_img' alt='빈사진' src="resources/img/nullPic.png" /> 
			<input type="image" name="photo3" class='profil_img' alt='빈사진' src="resources/img/nullPic.png" /> 
			<input type="hidden" name="a_path1" class="imageSrc" value="">
			<input type="hidden" name="a_path2" class="imageSrc" value=""> 
			<input type="hidden" name="a_path3" class="imageSrc" value="">
		</div>
			<button  class="btn" >수정 완료</button>
		</form>
	</div>

	<!-- 푸터 -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>

	<script type="text/javascript">
		
	
		let dogs = ["몰티즈", "푸들", "포메라니안", "치와와","스피츠" , "시바이누", "웰시코기", "닥스훈트", "비숑프리제","골든 리트리버","사모예드","허스키", "믹스견", "그 외"];
		let cats = ["코리안숏헤어", "먼치킨", "페르시안", "뱅갈", "러시안블루", "아비시니안", "샴", "터키시앙고라", "스코티시폴드", "스핑크스", "믹스묘", "그 외"];
		
		let dogTag = document.getElementById('dog'); 
		let catTag = document.getElementById('cat');
		
		let list = null;
		
		function onClickEvent()
		{
		    if (dogTag.checked) {
		    	list = dogs;
		    } else if (catTag.checked) {
		    	list = cats;
		    } else {
		        selectedValue = "None selected";
		        return;
		    }
			
		    
			var selectElement = document.getElementById('a_breed');

			selectElement.innerHTML = "";
			for(let i = 0; i < list.length; i++)
			{
				// 새로운 option 요소를 생성합니다.
				var optionElement = document.createElement('option');
				optionElement.value = list[i]; // option 요소의 값
				optionElement.textContent = list[i]; // option 요소의 텍스트 내용
			
				// 생성한 option 요소를 select 요소에 추가합니다.
				selectElement.appendChild(optionElement);
			}
		}
		
		function onSave()
		{
			<!-- 주소, 상세주소 분리 로직 -->
			let form = document.getElementById('infoadd');
			
			let dicList  = {
				'a_u_id' : form.a_u_id.value,
				'a_name' : form.a_name.value,
				'a_weight' : form.a_weight.value,
				'a_gender' : form.a_gender.value,
				'a_breed' : form.a_breed.value,
				'a_intro' : form.a_intro
			};
			
			
			//sessionStorage.setItem('key', dicList);
		}

		
		// 헤더에 매칭 강조
		let login = document.getElementById("h_my");
	    login.style = "border-bottom : 2px solid #3c40c6; border-radius: 2px; color : #3c40c6;";
		
	</script>
	
	
	<script>
	// 암컷 수컷 불러오기
				if($("animal.getA_gender")==="male"){
					$("#male").prop("checked", true);
				}else{
					$("#female").prop("checked", true);
				}
				
	</script>
	
	<script>
	// 강아지 고양이 불러오기
				if($("animal.getA_breed")=== dogs){
					$("#dog").prop("checked", true);
				}else{
					$("#cat").prop("checked", true);
				}
				onClickEvent();
	</script>
	
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
	let list2 = document.getElementsByClassName("imageSrc");
	
	let imgIdx = 0;

	imageUpload.addEventListener('change', function(event) {
		const file = event.target.files[0];
		
		console.log(file);
		if (imgIdx == 3) {
			return;
		}
		if (file) {
			const reader = new FileReader();
			reader.onload = function(e) {
				//imgs[i].src = "resources/img/" + file.name;
				imgs[imgIdx].src = e.target.result;
				list2[imgIdx].value = file.name;
				imgIdx++;
				
			};
			reader.readAsDataURL(file);
		}
	});

	function toSend() {
		let dataList = {
			a_path1 : imgs[0].value,
			a_path2 : imgs[1].value,
			a_path3 : imgs[2].value
		}
 		 $.ajax({
			url : "#",// 요청경로
			type : "post",
			data : dataList,
			success : function(res) {

			},
			error : function(error) {

			}

		}) 

	}
	</script>
</html>