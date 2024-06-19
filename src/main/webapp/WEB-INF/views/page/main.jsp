<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main here</title>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>

<style>

/*배너 스타일*/
.swiper {
	max-width: 1000px;
	height: 550px;
}

.m_banner_img {
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
.m_service .m_container {
	display: flex;
	justify-content: space-between;
	align-items: center;
	max-width: 1000px;
	margin: auto;
	margin-top: 100px;
}

.m_service .m_img {
	height: 350px;

}

.m_service .m_img img {
	height: 100%;
	width: 350px;
	border-radius: 150px;
	margin-left:50px;
}

.m_service .m_text {
	text-align: end;
	color: #444;
	padding-left: 100px;
	margin-right:60px;
}

.m_service .m_text h1 {
	letter-spacing: 0.2em;
}

.m_service .m_text p {
	word-wrap: break-word;
	word-break: keep-all;
	font-size: 15px;
}

/*인트로 스타일*/
.m_intro {
	display: flex;
	justify-content: center;
	align-items: center;
	max-width: 1200px;
	margin: auto;
}

.m_intro .m_card {
	flex: 1;
	text-align: center;
	margin: 140px 40px;
}

.m_intro .m_card h1 {
	letter-spacing: 0.2em;
}

.m_intro .m_card p {
	font-size: 14px;
}

.m_intro_icon {
	height: 150px;
	margin-bottom: 30px;
}
</style>


</head>
<body>

<!-- 헤더 -->
<jsp:include page="/WEB-INF/views/common/header.jsp" />

	<section>
		<div class="swiper">
			<!-- Additional required wrapper -->
			<div class="swiper-wrapper">
				<!-- Slides -->

				<div class="swiper-slide">
					<img src="resources/img/img_main_banner1.png" class="m_banner_img">
				</div>
				<div class="swiper-slide">
					<img src="resources/img/img_main_banner2.png" class="m_banner_img">
				</div>
				<div class="swiper-slide">
					<img src="resources/img/img_main_banner3.png" class="m_banner_img">
				</div>

			</div>
			<!-- If we need navigation buttons -->
			<div class="swiper-button-next"></div>
			<div class="swiper-button-prev"></div>
			<div class="swiper-pagination"></div>

		</div>
	</section>

	<!-- 서비스 소개 영역 -->
	<section class="m_service">
		<div class="m_container">
			<div class="m_img">
				<img src="resources/img/img_main_service.jpg">
			</div>
			<div class="m_text">
				<h1>Our Service</h1>
				<p>반려동물의 교배를 원하는 보호자들의 매칭 공간. <br>
				사랑하는 나의 반려동물에게 어울리는 짝꿍을 매칭해 보아요. </p>
			</div>

		</div>

	</section>


	<!-- 인트로 영역 -->
	<section class="m_intro">
		<div class="m_card">
			<img src="resources/img/icon_main_a.png" class="m_intro_icon">
			<h1>Location</h1>
			<p>지도를 통해 편리한 위치 확인 가능</p>
		</div>
		<div class="m_card">
			<img src="resources/img/icon_main_b.png" class="m_intro_icon">
			<h1>Communication</h1>
			<p>보호자 간의 채팅을 사용한 원활한 소통</p>
		</div>
		<div class="m_card">
			<img src="resources/img/icon_main_c.png" class="m_intro_icon">
			<h1>Like</h1>
			<p>내가 선호하는 프로필 선택</p>
		</div>

	</section>

<!-- 푸터 -->
<jsp:include page="/WEB-INF/views/common/footer.jsp" />

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

</html>