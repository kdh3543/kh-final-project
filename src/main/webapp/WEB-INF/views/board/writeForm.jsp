<!DOCTYPE html>
<html lang="en">

<head>
	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
		<!-- JSTL -->
		<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
			<meta charset="UTF-8">
			<meta http-equiv="X-UA-Compatible" content="IE=edge">
			<meta name="viewport" content="width=device-width, initial-scale=1.0">
			<title>커뮤니티</title>
			<!-- fontawesome-->
			<script src="https://kit.fontawesome.com/7d7ec2f3ed.js" crossorigin="anonymous"></script>
			<!-- Jquery-->
			<script src="https://code.jquery.com/jquery-3.6.0.js"
				integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
			<!-- bootstrap-->
			<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
				integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
				crossorigin="anonymous">
			<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
				integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
				crossorigin="anonymous"></script>
			<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
			<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
			<!-- include summernote css/js -->
			<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
			<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
			<!-- include summernote-ko-KR -->
			<script src="lang/summernote-ko-KR.js"></script>
			<!-- CSS -->
			<link rel="stylesheet" href="/css/font.css">
			<link rel="stylesheet" href="/css/header.css">
			<link rel="stylesheet" href="/css/footer.css">
			<!-- Custom styles for this template -->
			<link href="/css/board/writeForm.css" rel="stylesheet">
			<!-- JS -->
			<script src="/js/writeForm.js"></script>

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
			<form action="/board/writeProc" method="post" enctype="multipart/form-data">
				<div class="contents">
					<select id="subject" name="subject">
						<option>게시글의 주제를 선택해주세요</option>
						<option>동네질문</option>
						<option>동네사건사고</option>
						<option>동네맛집</option>
						<option>동네소식</option>
						<option>분실/실종센터</option>
						<option>고양이</option>
						<option>강아지</option>
						<option>기타</option>
					</select>
					<button type="submit" id="submit">완료</button>
				</div>
				<textarea id="summernote" name="contents"></textarea>
			</form>
		</div>
	</main>
	<footer>
		<div class="footer-box">
			<span>만든이들 : 곽서호, 김동현 92, 김동현 93, 김동휘, 박시현, 베소현 </span><br> <span>CopyRight
				2022 @ ALL RIGHT RESERVED</span>
		</div>
	</footer>
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