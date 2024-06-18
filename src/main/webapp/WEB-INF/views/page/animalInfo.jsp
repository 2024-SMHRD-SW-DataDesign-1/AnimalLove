<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
* {
	margin: 0px;
	padding: 0px;
	font-family: 'pretendard';
}

.join_form {
	max-width: 800px;
	margin: 0 auto;
	box-sizing: border-box;
	flex-direction: column;
	height: 60vh;
	display: flex;
	justify-content: space-around;
	align-items: center;
}

@font-face {
	font-family: 'Cafe24Meongi-W-v1.0';
	src:
		url('https://fastly.jsdelivr.net/gh/projectnoonnu/2405-3@1.1/Cafe24Meongi-W-v1.0.woff2')
		format('woff2');
	font-weight: normal;
	font-style: normal;
}

#j_title {
	font-family: 'Cafe24Meongi-W-v1.0';
	color: #333333;
	font-size: 50px;
	padding-top: 10px;
	text-align: center;
}

.sub {
	margin-left: 5px;
	width: 68px;
	height: 28px;
	color: #fff;
	border: 0;
	border-radius: 8px;
	background-color: #3c40c6;
	letter-spacing: 0.1em;
}

.sub:active {
	margin-left: 5px;
	width: 68px;
	height: 28px;
	color: #3c40c6;
	border: 0;
	border-radius: 8px;
	outline: none;
	outline-style: solid;
	outline-width: 1px;
	background-color: #fff;
	letter-spacing: 0.1em;
}

p {
	margin-bottom: 8px;
	margin-left: 30px;
}

.text {
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
	margin-left: 30px;
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
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	<div class="join_form">
		
		<form action="matting_pic" id="infoadd">
			<h2 id="j_title">Animal Info</h2>
			<br>

			<p>동물이름</p>
			<p>
				<input type="text" class="text" name="u_id" required id="u_id"> 
			</p>

			<p>나이</p>
			<p>
				<input type="number" class="text" name="u_pw">
			</p>


			<p>몸무게</p>
			<p>
				<input type="number" class="text" name="u_kg">
			</p>


			<p>성 별</p>
			<p>
				<input type="radio" name="gender" value="male" > Male
				<input type="radio" name="gender" value="female"> Female
			</p>

			<p>품종</p>
			<p>
				<input onclick="onClickEvent()" id="dog" type="radio" name="breed" value="dog" > Dog
				<input onclick="onClickEvent()" id="cat" type="radio" name="breed" value="cat"> Cat
			</p>


			<p>상세품종</p>
			<p>
			<select name="breedList" id="breed">

			</select>
			</p>

			<button  onclick="" class="btn">다음 화면</button>
		</form>
		
	</div> 
	<script type="text/javascript">
		
		let dogs = ["몰티즈", "푸들", "믹스견","포메라니안", "진돗개", "시추", "비숑프리제"];
		let cats = ["코리안숏헤어", "페르시안", "러시안블루", "샴", "터키쉬앙고라", "스코티쉬폴드", "믹스묘"];
		
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
			
		    
			var selectElement = document.getElementById('breed');

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

			let form = document.getElementById('infoadd');
			
			let dic  = {
				u_id : form.u_id.value,
				u_pw : form.u_pw.value,
				u_kg : form.u_kg.value,
				gender : form.gender.value,
				breedList : form.breedList.value,
			};
			
			localStorage.setItem('dic', JSON.stringify(dic));
		}

	</script>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
</html>