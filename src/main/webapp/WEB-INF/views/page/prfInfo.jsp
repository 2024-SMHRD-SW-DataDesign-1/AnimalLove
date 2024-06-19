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
		height : 70vh;
	}
	
	.prf_menu {
		margin-bottom: 8px;
		margin-left: 50px;
	}
	
	.prf_text {
		width: 250px;
		height: 36px;
		font-size: 15px;
		border: 0;
		border-radius: 15px;
		outline: none;
		padding-left: 10px;
		background-color: rgb(233, 233, 233);
	}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	<div id="prf_inner">
		<form action="#">
			<p class="prf_menu">나이</p>
			<p class="prf_menu">
				<input type="text" class="j_text" name="a_prfage" id="A_prfage"
					maxlength="8" oninput="idCheck()" required>
				<button class="j_btn" type="button" id="idChk" onclick="fn_idChk();"
					value="N">중복확인</button>
				<br> <span id="idCheck"></span>
			</p>
			
			<p class="prf_menu">몸무게</p>
			<p class="prf_menu">
				<input type="radio" class="j_text" name="a_prfweight" value="1" required>
				<input type="radio" class="j_text" name="a_prfweight" required>
				<input type="radio" class="j_text" name="a_prfweight" required>
				<button class="j_btn" type="button" id="idChk" onclick="fn_idChk();"
					value="N">중복확인</button>
				<br> <span id="idCheck"></span>
			</p>
			
			<p class="prf_menu">상세품좀</p>
			<p class="prf_menu">
				<input type="text" class="prf_text" name="a_prfbreed" id="a_prfbreed"
					maxlength="8" oninput="idCheck()" required>
				<button class="j_btn" type="button" id="idChk" onclick="fn_idChk();"
					value="N">중복확인</button>
				<br> <span id="idCheck"></span>
			</p>
			
			<input type="submit" value="프로필 찾기!"/>
		</form>
	</div>
	
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	<script type="text/javascript">
		$(document).ready(function(){
			"1.4 – 110kg"
			"4 – 5kg"
		})
	</script>
</body>
</html>