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
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- include summernote css/js -->
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<!-- include summernote-ko-KR -->
<script src="lang/summernote-ko-KR.js"></script>
<!-- CSS -->
<link rel="stylesheet" href="/css/font.css">
<link rel="stylesheet" href="/css/header.css">
<link rel="stylesheet" href="/css/footer.css">
<!-- Custom styles for this template -->
<link href="/css/board/modifyForm.css" rel="stylesheet">
<!-- JS -->
<script src="/js/modifyForm.js"></script>
<style>
header .header-list-after-login li:nth-child(2) a {
	text-decoration: none !important;
	color: #fff !important;
	font-family: 'OTWelcomeRA' !important;
	font-size: 15px !important;
}
header .header-list-after-login li:nth-child(3) a {
	text-decoration: none !important;
	color: #f8d200 !important;
	font-family: 'OTWelcomeRA' !important;
	font-size: 15px !important;
}

</style>

</head>

<body>
	<c:choose>
		<c:when test="${loginID !=null}">
			<header>
				<div class="header_Container">
					<c:choose>
						<c:when test="${loginID != null}">
							<ul class="header-list-after-login">

								<li>${loginID}</li>
								<!-- 수정중 -->
								<li><a href="/items/myPage?">마이페이지</a></li>
								<li><a href="/member/logout" id="logoutbtn">로그아웃</a></li>


							</ul>
						</c:when>

						<c:when test="${Admin != null}">
							<!----- admin 로그인 되었을 때,  ----->
							<ul class="header-list-after-login">
								<li><img src="${dto.profile_image}"
									style="max-width: 30px; max-height: 30px;"></li>

								<li>${Admin}</li>
								<!-- 수정중 -->
								<li><a href="/admin/adminIndex">관리페이지</a></li>
								<li><a href="/member/logout" id="logoutbtn">로그아웃</a></li>

							</ul>
						</c:when>
						<c:otherwise>
							<ul class="header_list">
								<li><a href="signIn">로그인</a></li>
								<li><a href="join">회원가입</a></li>
							</ul>
						</c:otherwise>
					</c:choose>
				</div>
				<div class="div-wrap">
					<div class="nav_div">
						<div class="logo">
							<a href="/"><img src="/imgs/sideLogo2.png" class="logoImg"></a>
						</div>
					</div>
				</div>

			</header>

		</c:when>
	</c:choose>
	<main>
		<div class="contents-box">
			<form action="/board/modifyProc" method="post"
				enctype="multipart/form-data">
				<input type="hidden" value="${dto.board_seq}" name="board_seq">
				<div class="contents">
					<select id="subject" name="subject">
						<option id="question">동네질문</option>
						<option id="incident">동네사건사고</option>
						<option id="restaurant">동네맛집</option>
						<option id="news">동네소식</option>
						<option id="lost">분실/실종센터</option>
						<option id="cat">고양이</option>
						<option id="dog">강아지</option>
						<option id="others">기타</option>
					</select>
					<button type="submit" id="submit">완료</button>
				</div>
				<textarea id="summernote" name="contents">${dto.contents}</textarea>
			</form>
		</div>
	</main>
	<footer>
		<div class="footer-box">
			<span>만든이들 : 곽서호, 김동현 92, 김동현 93, 김동휘, 박시현, 배소현 </span><br> <span>CopyRight
				2022 @ ALL RIGHT RESERVED</span>
		</div>
	</footer>

	<script>
		$(document).ready(function () {
			if ("${dto.subject}" == $("#question").html()) {
				$("#question").attr("selected", "");
			} else if ("${dto.subject}" == $("#incident").html()) {
				$("#incident").attr("selected", "");
			} else if ("${dto.subject}" == $("#restaurant").html()) {
				$("#restaurant").attr("selected", "");
			} else if ("${dto.subject}" == $("#news").html()) {
				$("#news").attr("selected", "");
			} else if ("${dto.subject}" == $("#lost").html()) {
				$("#lost").attr("selected", "");
			} else if ("${dto.subject}" == $("#cat").html()) {
				$("#cat").attr("selected", "");
			} else if ("${dto.subject}" == $("#dog").html()) {
				$("#dog").attr("selected", "");
			} else if ("${dto.subject}" == $("#others").html()) {
				$("#others").attr("selected", "");
			}
		});
	</script>
	<script>
		$(document).ready(function () {
			$('#summernote').summernote({
				lang: 'ko-KR', 				 // default: 'en-US'
				height: 500,                 // set editor height
				minHeight: null,             // set minimum height of editor
				maxHeight: null,             // set maximum height of editor
				focus: true                  // set focus to editable area after initializing summernote
			});
		});
	</script>
</body>

</html>