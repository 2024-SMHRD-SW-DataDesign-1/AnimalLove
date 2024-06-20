<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Matching Profile here</title>
<script src="https://kit.fontawesome.com/b145cfedc2.js" crossorigin="anonymous"></script>

<style>
       
        /* 타이틀 폰트 */
        @font-face {
        font-family: 'Cafe24Meongi-W-v1.0';
        src:
            url('https://fastly.jsdelivr.net/gh/projectnoonnu/2405-3@1.1/Cafe24Meongi-W-v1.0.woff2')
            format('woff2');
        font-weight: normal;
        font-style: normal;
        }

        /* 프로필 카드 폰트 */
        @font-face {
        font-family: 'BMJUA';
        src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/BMJUA.woff') format('woff');
        font-weight: normal;
        font-style: normal;
        }


        .p_container{
            text-align: center;
        }


        /* 프로필 */
        #p_title{
            font-family: 'Cafe24Meongi-W-v1.0';
            color: #333333;
            font-size: 50px;
            margin: 20px;
            margin-bottom: 10px;
        }

        /* 프로필 카드 박스 */
        .p_c_container{
            text-align: center;
            display: flex;
            justify-content: space-evenly;
        }

        .p_card{
            background: #ffffff;
            border-radius: 6px;
            display: inline-block;
            height: 470px;
            width: 370px;
            margin-top: 60px;
            box-shadow: 0 12px 13px rgba(0, 0, 0, 0.16), 0 12px 13px rgba(0, 0, 0, 0.16);
            font-family: 'BMJUA';
        }

        /* 이미지, 하트 아이콘 */
        .p_like{
            text-align: end;
            margin-right: 24px;
            margin-top: 24px;
            color: #444444;
        }

        .p_img{
            border-radius: 100%;
            width: 220px;
            height: 220px;
        }

    
        /*이름,나이,품종*/
        .t_name{
            font-family: 'BMJUA';
            color: #1b1b1b;
            letter-spacing: 3px;
            margin-bottom: 8px;
            margin-top: 10px;
        }

        .t_age{
            color: #a1a1a1;
            font-size: 16px;
            margin-top: 0;
            margin-bottom: 4px;
        }

        .t_text{
            font-size: 16px;
            margin-left: 65px;
            margin-right: 65px;
            color: #a1a1a1;
        }

        .m_p_btn{
            outline: none;
            background: #ff3f34;
            margin-top: 10px;
            border: none;
            height: 40px;
            width: 35%;
            color: #fff;
            font-size: 18px;
            border-radius: 30px;
            font-family: 'BMJUA';
        }

        .m_p_btn:hover{
            color: #ff3f34;
            background: #e2e1e0;
            transition: all 300ms linear;
            cursor: pointer;
        }

        .m_btn{
            height: 40px;
            width: 320px;
            font-size: 18px;
            font-family: 'BMJUA';
            background: #fff;
            color: #ff3f34;
            margin-top: 5em;
            border: 0;
            border-radius: 30px;
            outline: none;
            outline-style: solid;
            outline-width: 2px;
        }

        .m_btn:hover{
            color: #fff;
            background: #ff3f34;
            transition: all 200ms linear;
            cursor: pointer;
        }

	</style>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<link href="https://cdn.jsdelivr.net/npm/@sweetalert2/theme-dark@4/dark.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.js"></script>

</head>
<body>
	<!-- 헤더 -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

	
	<div class="p_container">
        <h2 id="p_title">Profile</h2>
            <div class="p_c_container">
                <div class="p_card">
                    <div class="p_like">
                        <i class="fa-regular fa-heart fa-2xl"></i>
                    </div>
                    <img src="resources/img/img_pro1.jpg" alt="" class="p_img">
                    <div class="p_body">
                        <h1 class="t_name">구름이</h1>
                        <p class="t_age">2살</p>
                        <p class="t_text">비숑프리제</p>
                    </div>
                    <button class="m_p_btn" onclick="showModal()">Pick Me</button>
                </div>

                <div class="p_card">
                    <div class="p_like">
                        <i class="fa-regular fa-heart fa-2xl"></i>
                    </div>
                    <img src="resources/img/img_pro2.jpg" alt="" class="p_img">
                    <div class="p_body">
                        <h1 class="t_name">뽀미</h1>
                        <p class="t_age">3살</p>
                        <p class="t_text">포메라니안</p>
                    </div>
                    <button class="m_p_btn" onclick="showModal()">Pick Me</button>
                </div>

                <div class="p_card">
                    <div class="p_like">
                        <i class="fa-regular fa-heart fa-2xl"></i>
                    </div>
                    <img src="resources/img/img_pro3.jpg" alt="" class="p_img">
                    <div class="p_body">
                        <h1 class="t_name">순이</h1>
                        <p class="t_age">2살</p>
                        <p class="t_text">스피치</p>
                    </div>
                    <button class="m_p_btn" onclick="showModal()">Pick Me</button>
                </div>
            </div>
        <button class="m_btn">Reset</button>
    </div>


	<!-- 푸터 -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

</body>



<script>
	//헤더에 매칭 강조
	let login = document.getElementById("h_mat");
	login.style = "border-bottom : 2px solid #3c40c6; border-radius: 2px; color : #3c40c6;";
	
	
	function showModal()
	{
		Swal.fire({
			  title: "Custom width, padding, color, background.",
			  width: 600,
			  padding: "3em",
			  color: "#716add",
			  background: "#fff url(resources/img/cutecat.gif)",
			  backdrop: `
			    rgba(0,0,123,0.4)
			    url(resources/img/cutecat.gif")
			    left top
			    no-repeat
			  `
			});
	}
	
	
</script>


</html>