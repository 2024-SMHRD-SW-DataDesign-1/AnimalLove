<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main title here</title>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>

<style>

/*배너 스타일*/
.swiper {
	max-width: 1000px;
	height: 550px;
}

.banner_img {
	width: 100%;
	height: 100%;
}

.swiper-button-next {
	color: #3c40c6;
}

.swiper-button-prev {
	color: #3c40c6;
}

.banner_title img {
	height: 600px;
	width: 1000px;
}

/*서비스 소개 스타일*/
.service .container {
	display: flex;
	justify-content: space-between;
	align-items: center;
	max-width: 1000px;
	margin: auto;
	margin-top: 100px;
}

.service .img {
	height: 320px;
}

.service .img img {
	height: 100%;
	width: 500px;
	border-radius: 10px;
}

.service .text {
	text-align: end;
	color: #444;
	padding-left: 100px;
}

.service .text h1 {
	letter-spacing: 0.2em;
}

.service .text p {
	word-wrap: break-word;
	word-break: keep-all;
	font-size: 14px;
}

/*인트로 스타일*/
.intro {
	display: flex;
	justify-content: center;
	align-items: center;
	max-width: 1200px;
	margin: auto;
}

.intro .card {
	flex: 1;
	text-align: center;
	margin: 140px 40px;
}

.intro .card h1 {
	letter-spacing: 0.2em;
}

.intro .card p {
	font-size: 14px;
}

.intro_icon {
	height: 150px;
	margin-bottom: 30px;
}
</style>

<jsp:include page="/WEB-INF/views/common/header.jsp" />

</head>
<body>


	<section>
		<div class="swiper">
			<!-- Additional required wrapper -->
			<div class="swiper-wrapper">
				<!-- Slides -->

				<div class="swiper-slide">
					<img src="resources/img/img_main_banner1.png" class="banner_img">
				</div>
				<div class="swiper-slide">
					<img src="resources/img/img_main_banner2.png" class="banner_img">
				</div>
				<div class="swiper-slide">
					<img src="resources/img/img_main_banner3.png" class="banner_img">
				</div>

			</div>
			<!-- If we need navigation buttons -->
			<div class="swiper-button-next"></div>
			<div class="swiper-button-prev"></div>
			<div class="swiper-pagination"></div>

		</div>
	</section>

	<!-- 서비스 소개 영역 -->
	<section class="service">
		<div class="container">
			<div class="img">
				<img src="#" alt="">
			</div>
			<div class="text">
				<h1>우리 서비스는~!</h1>
				<p>동물 교배 매칭 서비스로 교배를 원하는 모든 사용자를 대상으로 마음에드는 강아지 고양이를 찜할 수 있고
					채팅신청을 통해 다양한 소통 후 매칭이 가능하다구요~...</p>
			</div>

		</div>

	</section>




	<!-- 인트로 영역 -->
	<section class="intro">
		<div class="card">
			<img src="resources/img/icon_main_a.png" class="intro_icon">
			<h1>Location</h1>
			<p>Django는 2005년부터 시작된 Python의 오픈 소스 웹 프레임워크이당</p>
		</div>
		<div class="card">
			<img src="resources/img/icon_main_b.png" class="intro_icon">
			<h1>Communication</h1>
			<p>창시자는 귀도 반 로섬. 크리스마스 주에 , 연구실이 닫혀있어서 심심한</p>
		</div>
		<div class="card">
			<img src="resources/img/icon_main_c.png" class="intro_icon">
			<h1>Love</h1>
			<p>프로그래밍 언어로, 스크립트 언어에 해당된다.</p>
		</div>

	</section>



</body>

<!-- 배너 슬라이드 스크립트 -->
<script>
	const swiper = new Swiper('.swiper', {
		// Optional parameters
		loop : true,
		slidesPerView : 1,
		// If we need pagination
		pagination : {
			el : '.swiper-pagination',
		},

		// Navigation arrows
		navigation : {
			nextEl : '.swiper-button-next',
			prevEl : '.swiper-button-prev',
		}

	});
</script>


<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</html>