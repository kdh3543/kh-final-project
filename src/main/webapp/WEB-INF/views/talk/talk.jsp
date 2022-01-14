<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>00톡</title>
<!-- fontawesome-->
<script src="https://kit.fontawesome.com/7d7ec2f3ed.js"
	crossorigin="anonymous"></script>
<!-- Jquery-->
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<!-- bootstrap-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<!-- CSS -->
<link rel="stylesheet" href="/css/font.css">
<link rel="stylesheet" href="/css/header.css">
<link rel="stylesheet" href="/css/footer.css">
<!-- Custom styles for this template -->
<link rel="stylesheet" href="/css/talk.css">

</head>
<body>
	<header>
        <div class="header_Container">
            <ul class="header_list">
                <li><a href="signIn">로그인</a></li>
                <li><a href="join">회원가입</a></li>
            </ul>
        </div>
        <div class="div-wrap">
            <div class="nav_div">
                <div class="logo">
                    <i class="fas fa-seedling"></i>
                    <a href="/">00마켓</a>
                </div>
            </div>
        </div>
    </header>
    <main>
        <div class="talk-container">
            <div class="talk-left">
                <div class="talk-search">
                    <input type="text" placeholder="검색할 목록" class="inputTalk">
                </div>
                <div class="talk-title">
                    대화목록
                </div>
                <div class="talk-list">
                    <div class="talk-list-left">
                        <i class="fas fa-camera fa-2x"></i>
                    </div>
                    <div class="talk-list-right">
                        <div class="talk-name">이름</div>
                        <div class="talk-last-conversation">안녕</div>
                    </div>
                </div>
            </div>
            <div class="talk-right">
                <div class="right-top">
                <div class="right-title-left">
                    <div class="title-img">
                        <i class="fas fa-camera fa-2x"></i>
                    </div>
                    <div class="title-name">이름</div>
                </div>
                <div class="right-title-right">
                    <div class="title-alarms"></div>
                </div>
            </div>
            <div class="right-middle">
                대화내용
            </div>
            <div class="right-bottom">
                <textarea name="" id="" cols="30" rows="10"></textarea>
                <button>전송하기</button>
            </div>
            </div>
        </div>
    </main>
    <footer>
        <div class="footer-box">
            <span>만든이들 : 곽서호, 김동현 92, 김동현 93, 김동휘, 박시현, 베소현 </span><br>
            <span>CopyRight 2022 @ ALL RIGHT RESERVED</span>
        </div>
    </footer>
	
</body>
</html>