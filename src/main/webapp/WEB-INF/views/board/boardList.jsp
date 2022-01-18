<!DOCTYPE html>
<html lang="en">

<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>커뮤니티</title>
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
<link href="/css/boardList.css" rel="stylesheet">
<!-- JS -->
<script src="/js/boardList.js"></script>

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
					<i class="fas fa-seedling"></i> <a href="/">00마켓</a>
				</div>
			</div>
		</div>
	</header>
	<main>
		<div class="contents-box">
			<div class="contents-top-div">
				<h1 class="h3 mb-3 fw-normal">동네(ex 회현동)</h1>
				<button class="btn btn-primary" id="toWrite">새 글 등록</button>
			</div>
			<div class="subject-menu">
				<button class="btn btn-primary" type="button">주제1</button>
				<button class="btn btn-primary" type="button">주제2</button>
				<button class="btn btn-primary" type="button">주제3</button>
				<button class="btn btn-primary" type="button">주제4</button>
				<button class="btn btn-primary" type="button">주제5</button>
				<button class="btn btn-primary" type="button">주제6</button>
			</div>
			<c:forEach var="dto" items="${list}">
				<div class="contents">
					<div class="contents-title">${dto.subject}</div>
					<div class="contents-div">
						<div class="contents-div-contents">
							<a href="toDetail?seq=${dto.board_seq}">${dto.contents}</a>
						</div>
					</div>
					<div class="contents-container">
						<div class="contents-div-writer">${dto.writer}</div>
						<div class="contents-div-location">위치</div>
						<div class="contents-div-writedate">${dto.write_date}</div>
					</div>
					<div class="form-floating">
						<div class="floating-likes">
							<i class="fas fa-heart"></i>좋아요(좋아요 수)
						</div>
						<div class="floating-comments">
							<i class="fas fa-comment"></i> 댓글
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</main>
	<footer>
		<div class="footer-box">
			<span>만든이들 : 곽서호, 김동현 92, 김동현 93, 김동휘, 박시현, 베소현 </span><br> <span>CopyRight
				2022 @ ALL RIGHT RESERVED</span>
		</div>
	</footer>

	<script>
		$("#toWrite").on("click", function() {
			location.href = "/board/writeForm";
		})
		let text = $(".contents-div-contents > a").text();
		console.log(text);
		console.log(text.split(""));
		let num = text.split("");
		console.log(num.length);
		// overflow hidden 값을 주기
		if(num.length > 200){
			$(".contents-div").css("overflow","hidden");
			$(".contents-div-contents").css("overflow","hidden");
			
		}
		/* if() */
		
		/* if($(".contents-div-contents").val) */
	</script>
</body>
</html>