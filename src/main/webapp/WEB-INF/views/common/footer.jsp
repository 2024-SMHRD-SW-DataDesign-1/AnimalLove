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
            max-width: 700px;
            margin: 0 auto;
            box-sizing: border-box;
            height: 100vh;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            align-items: center;
        }

        @media screen and (max-width:640px){
            footer {
                flex-direction: column;
            }
        }
        footer {  
            margin-bottom: 10px;
            position: fixed;
            bottom: 0;
        }

        footer span {
            color: #333333;
            font-family: 'pretendard';
            font-size: 0.6rem;
            margin: 0 20px 0px 20px;
        }

    </style>
</head>
<body>
    <div class="container">
        <footer><span>애니팅 소개</span><span>이용안내</span><span>가맹점 개점문의</span><span>사이버 감사실</span><span>고객센터</span></footer>

    </div>
    
</body>
</html>