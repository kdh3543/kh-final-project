<!DOCTYPE html>
<html lang="en">

<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>login</title>
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
<link href="/css/member/signIn.css" rel="stylesheet">

<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- input Type password 보이게 하는 거 -->
<style>
input[type=password] {
	font-family: "굴림";
}
</style>


</head>

<body>
	<%
      String cookie = "";
      Cookie[] cookies = request.getCookies(); //쿠키생성
      if(cookies !=null&& cookies.length > 0)
      for (int i = 0; i < cookies.length; i++){
         if (cookies[i].getName().equals("logid")) { // 내가 원하는 쿠키명 찾아서 값 저장
            cookie = cookies[i].getValue();}}
   %>
	<header>
		<c:choose>
			<c:when test="${loginID == null && Admin == null}">
				<div class="header_Container">

					<ul class="header_list">
						<li><a href="signIn">로그인</a></li>
						<li><a href="join">회원가입</a></li>
					</ul>
				</div>
				<div class="div-wrap">
					<div class="nav_div">
						<div class="logo">
							<a href="/"><img src="/imgs/sideLogo2.png" class="logoImg"></a>
						</div>
					</div>
				</div>
			</c:when>
		</c:choose>
	</header>

	<main>
		<div class="form-signin">
			<form action="/member/login" method="post" class="loginForm">
				<h1 class="h3 mb-3 fw-normal">로그인</h1>

				<div class="form-floating">
					<input type="text" class="form-control" id="floatingInput"
						name="logid" placeholder="name@example.com" value="<%=cookie%>">
					<label for="floatingInput">아이디</label>
				</div>
				<div class="form-floating">
					<input type="password" class="form-control" id="floatingPassword"
						name="logpw" placeholder="Password" style="z-index: 3;"> <label
						for="floatingPassword">비밀번호</label>
				</div>
				<div class="checkbox mb-3">
					<label> <input type="checkbox" name="remember_userID">
						Remember me
					</label>
				</div>
				<div class="buttons">
					<button id="signIn" class=" btn btn-lg btn-light" type="button">로그인</button>
					<button id="findMyInfo" class=" btn btn-lg btn-light" type="button">아이디/비밀번호
						찾기</button>
				</div>
				<div class="form-group socialimage" id="kakaoBtn">
					<a
						href="https://kauth.kakao.com/oauth/authorize?client_id=e60a4b1af6b713f21e514a4af2e2bab4&redirect_uri=http://localhost:80/kakaologin&response_type=code">
						<img id="socialimage" src="/imgs/kakao_login_large_wide.png"
						width="100%" height="100%"/ >
					</a>

				</div>
			</form>
			<div class="buttons"></div>

		</div>


	</main>
	<footer>
		<div class="footer-box">
			<span>만든이들 : 곽서호, 김동현 92, 김동현 93, 김동휘, 박시현, 배소현 </span><br> <span>CopyRight
				2022 @ ALL RIGHT RESERVED</span>
		</div>
	</footer>

	<script>
        $("#findMyInfo").on("click",function(){
            location.href="findInfo";
        });
        
        // 아이디랑 비밀번호 값 비어있는지 확인
        $("#signIn").on("click",function(){
        	
        	 if($("#floatingInput").val() == ""){
             	alert("아이디를 입력하세요.");
             	return false;
             }
        	 
             if($("#floatingPassword").val() == ""){
             	alert("비밀번호를 입력하세요.");
             	return false;
             }
             
             if(!$("#floatingInput").val() == "" && !$("#floatingPassword").val() == ""){
            	 $(".loginForm").submit();
             }
        });
       
   
      
</script>




</body>

</html>