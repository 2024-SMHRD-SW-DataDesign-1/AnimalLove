<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <style>
    
 * {
            padding: 0;
            margin: 0;
            /* border: 1px solid black; */
            
        }
        
        .container {
            max-width: 800px;
            margin: 0 auto;
            box-sizing: border-box;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            align-items: center;
        }

        header {
            display: flex;
            justify-content: space-between;
            width: 100%;
            align-items: center;
            padding: 1.2rem 0;
        }

        header>div {
            display: flex;
            align-items: center;

        }

        @font-face {
        font-family: 'BMJUA';
        src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/BMJUA.woff') format('woff');
        font-weight: normal;
        font-style: normal;
        }

        #title {
            font-size: 2rem;
            font-weight: 700;     
            text-decoration: none;
            color: #333333;
            font-family: 'BMJUA';
        }

        #logo {
            width: 65px;
            height: 65px;
            margin-right: 8px;
        }

        header>p>a {
            color: #333333;
            text-decoration: none;
            font-family: 'pretendard';
        }

        header>ul {
            display: flex;
        }

        header>ul>li {
            list-style-type: none;
            margin-left: 3.2rem;
            padding-bottom: 2px;

        }
        header>ul>li>a {
            color: #333333;
            text-decoration: none;
            font-size: 1rem;
            font-weight: 800;
            padding-bottom: 1px;
            font-family: 'pretendard';

         
        }
       


        header>ul>li> a:hover {
            border-bottom: 2px solid #3c40c6;
            border-radius: 2px;
            color : #3c40c6;
        }

        @media screen and (max-width:640px){
            header {
                flex-direction: column;
            }
            
        }

        header>ul>li>a>img{
            margin: auto;
  
        }
        
        #icon {
            filter: opacity(0.5) drop-shadow(0 0 0 #333333);
            width: 24px;
        }


    </style>

</head>
<body>
    <div class="container">
        <header>
         	<div>
                <a href="#"><img src="resources/img/img_logo.png" id="logo"></a>
                <p><a href="#" id="title">애니팅</a></p>
            </div>
            <ul>
                <li><a href="#">매칭</a></li>
                <li><a href="#">위치</a></li>
                <li><a href="#">마이페이지</a></li>
                
            </ul>
            <ul>
                <li><a href="#" id="login">로그인</a></li>
                <a href="#"><img src="resources/img/icon_angle.png" id="icon"></a>
            </ul>

        </header>
        
       
    </div>
</body>
</html>