<%@page import="com.smhrd.myapp.model.MavenMember"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
		display : flex;
		justify-content: center;
		align-items: center;
	}
	
	.prf_menu{
		margin-bottom : 40px;
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
		margin-left : 25%;
	}
	
	.container {
		display : flex;
		justify-content: space-around;
	}
	
	.prf_wradio{
		width : 80px;
		height : 30px;
		border-radius : 20px;
		border : 1px solid #5d5d5d;;
		text-align: center;
		line-height : 30px;
	}
	
	.prf_aradio{
		width : 80px;
		height : 30px;
		border-radius : 20px;
		border : 1px solid #5d5d5d;;
		text-align: center;
		line-height : 30px;
	}
	
	.select{
		background-color : #ebecff;
	}
	
	#prf_btn{
		width: 262px;
		height: 36px;
		font-size: 15px;
		color: #fff;
		border: 0;
		border-radius: 17px;
		background-color: #3c40c6;
		margin-left : 25%;
	}
	
	#m_u_title {
		font-family: 'Cafe24Meongi-W-v1.0';
		color: #333333;
		font-size: 50px;
		padding-top: 10px;
	}
	
	
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	<%MavenMember member = (MavenMember) session.getAttribute("member");%>
	<div id="prf_main">
		<div id="prf_inner">
		<h2 id="m_u_title">Preference Pick</h2>
		<h4 style="text-align : left; color:#666">추천될 프로필 카드의 정보를 입력해주세요!</h4>
		<form action="prfinforsave" style='width:100%' method="post">
		
			<input type="hidden" name = "a_u_id" value="<%=member.getU_id()%>">
			<p class="prf_menu">나이</p>
			<div id="ageContainer" class="prf_menu container">
				<input type="hidden" id="a_prfage" class="prf_text" name="a_prfage" value="" required>			
			</div>


			
			<p class="prf_menu">몸무게</p>
			<div id="weightContainer" class="prf_menu container">
				<input type="hidden" id="a_prfweight" class="prf_text" name="a_prfweight" value="" required>
				
				
			</div>
			
			<p class="prf_menu">상세품좀</p>
			<p class="prf_menu">
				<select class="prf_text" name="a_prfbreed" id="a_prfbreed"
					 oninput="idCheck()" required>
				</select>
				
			</p>
			
			<input id="prf_btn" type="submit" value="프로필 찾기!"/>
		</form>
		</div>
	</div>
	
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	<script type="text/javascript">
		function setWRadio(menu1, menu2, menu3)
		{
			// 몸무게 선택 박스 생성
			let container = document.getElementById("weightContainer");
			let value = "<div class='prf_wradio' onclick='change_btn1(event)'>" + menu1 + "</div>" +
						"<div class='prf_wradio' onclick='change_btn1(event)'>" + menu2 + "</div>" +
						"<div class='prf_wradio' onclick='change_btn1(event)'>" + menu3 + "</div>";
						
			container.innerHTML += value;
		}	
		
		function setARadio(menu1, menu2, menu3)
		{	
			// 나이 선택 박스 생성
			let container = document.getElementById("ageContainer");
			
			let value = "<div class='prf_aradio' onclick='change_btn2(event)'> 1년 이하</div>" +
						"<div class='prf_aradio' onclick='change_btn2(event)'>" + menu1 + "</div>" +
						"<div class='prf_aradio' onclick='change_btn2(event)'>" + menu2 + "</div>" +
						"<div class='prf_aradio' onclick='change_btn2(event)'>" + menu3 + "</div>" +
						"<div class='prf_aradio' onclick='change_btn2(event)'> 10년 이상</div>"  ;
						
			container.innerHTML += value;
		}	
		
		$(document).ready(function(){
			let dogs = ["몰티즈", "푸들", "포메라니안", "치와와","스피츠" , "시바이누", "웰시코기", "닥스훈트", "비숑프리제","골든 리트리버","사모예드","허스키", "믹스견", "그 외"];
			let cats = ["코리안숏헤어", "먼치킨", "페르시안", "뱅갈", "러시안블루", "아비시니안", "샴", "터키시앙고라", "스코티시폴드", "스핑크스", "믹스묘", "그 외"];
			
			if(true)
			{
				setWRadio("1 ~ 40", "40 ~ 70", "70 ~");		
						
			}
			else
			{
				setWRadio("3 ~ 4", "4 ~ 6", "6 ~");
				
			}
			setARadio("1 ~ 3", "3 ~ 6", "6 ~ 9");
			
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
		
		
   		function change_btn1(e) {
	      	let btns = document.querySelectorAll(".prf_wradio");
	      	let basket = document.querySelector("#a_prfweight");
	      
	      	btns.forEach(function (btn, i) {
	        	if (e.currentTarget == btn) {
	            	btn.className += " select";
	            	basket.value=btn.innerText;
	            	
	          	} else {
	            	btn.classList.remove("select");
	       		}
	       });
	   }
		
   		function change_btn2(e) {
	      	let btns = document.querySelectorAll(".prf_aradio");
	      	let basket = document.querySelector("#a_prfage");
	      
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