<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#prf_inner
	{	
		width : 500px;
		flex-direction: column;
		display: flex;
		justify-content: space-around;
		align-items: center;
	}
	
	#prf_main{
		height : 70vh;
	}
	
	
	
	.prf_menu{
		margin-bottom : 20px;
	}
	
	
	.prf_text {
		width: 250px;
		height: 36px;
		font-size: 15px;
		border: 0;
		border-radius: 15px;
		margin :auto;
		padding-left: 10px;
		background-color: rgb(233, 233, 233);
	}
	
	.container {
		display : flex;
		justify-content: space-around;
	}
	
	.prf_radio{
		width : 80px;
		border-radius : 20px;
		border : 2px solid black;
		text-align: center;
	}
	
	.select{
		background-color : skyblue;
	}
	
	#prf_btn{
		width: 262px;
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
	<div id="prf_main">
		<div id="prf_inner">
		
		<form action="#" >
			<p class="prf_menu">나이</p>

			<input type="text" class="prf_text" name="a_prfage" id="A_prfage"
				maxlength="8" oninput="idCheck()" required>

			
			<p class="prf_menu">몸무게</p>
			<div id="weightContainer" class="prf_menu container">
				<input type="hidden" id="prf_text" class="prf_text" name="a_prfweight" value="" required>
				
				
			</div>
			
			<p class="prf_menu">상세품좀</p>
			<p class="prf_menu">
				<select type="text" class="prf_text" name="a_prfbreed" id="a_prfbreed"
					maxlength="8" oninput="idCheck()" required>
				</select>
				
			</p>
			
			<input id="prf_btn" type="submit" value="프로필 찾기!"/>
		</form>
		</div>
	</div>
	
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	<script type="text/javascript">
		function setRadio(menu1, menu2, menu3)
		{
			let container = document.getElementById("weightContainer");
			let value = "<div class='prf_radio' onclick='change_btn(event)'>" + menu1 + "</div>" +
						"<div class='prf_radio' onclick='change_btn(event)'>" + menu2 + "</div>" +
						"<div class='prf_radio' onclick='change_btn(event)'>" + menu3 + "</div>";
						
			container.innerHTML += value;
		}	
		
		$(document).ready(function(){
			let dogs = ["몰티즈", "푸들", "포메라니안", "치와와","스피츠" , "시바이누", "웰시코기", "닥스훈트", "비숑프리제","골든 리트리버","사모예드","허스키", "믹스견", "그 외"];
			let cats = ["코리안숏헤어", "먼치킨", "페르시안", "뱅갈", "러시안블루", "아비시니안", "샴", "터키시앙고라", "스코티시폴드", "스핑크스", "믹스묘", "그 외"];
			
			if(true)
			{
				setRadio("1 ~ 40", "40 ~ 70", "70 ~");				
			}
			else
			{
				setRadio("3 ~ 4", "4 ~ 6", "6 ~");				
			}
			
			// 여기에 강아지인지 고양이인지 체크하는 로직 넣어야됨
			let list = dogs;
			
			var selectElement = document.getElementById('a_prfbreed');

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
			
			
		})
		
		
   		function change_btn(e) {
	      	let btns = document.querySelectorAll(".prf_radio");
	      	let basket = document.querySelector("#prf_text");
	      
	      	btns.forEach(function (btn, i) {
	        	if (e.currentTarget == btn) {
	            	btn.className += " select";
	            	basket.value=btn.innerText;
	            	
	          	} else {
	            	btn.classList.remove("select");
	       		}
	       });
	   }
	</script>
</body>
</html>