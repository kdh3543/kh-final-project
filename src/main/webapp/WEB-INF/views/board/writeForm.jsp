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
<link href="/css/writeForm.css" rel="stylesheet">
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
			<div class="contents">
				<select id="subject" name="subject">
					<option>게시글의 주제를 선택해주세요</option>
					<option>동네질문</option>
					<option>동네사건사고</option>
					<option>동네맛집</option>
					<option>동네소식</option>
					<option>분실/실종센터</option>
					<option>해주세요</option>
					<option>일상</option>
					<option>취미생활</option>
					<option>고양이</option>
					<option>강아지</option>
					<option>건강</option>
					<option>살림</option>
					<option>인테리어</option>
					<option>교육/학원</option>
					<option>동네사진전</option>
					<option>출산/육아</option>
					<option>기타</option>
				</select>
				<!-- <button type="button" class="btn btn-secondary-light"
					data-bs-toggle="dropdown" aria-expanded="false">
					<i class="fas fa-bars fa-2x"></i>
				</button>
				<ul class="dropdown-menu">

					Dropdown menu links
					<li>
						<h6 class="dropdown-header">전체 카테고리</h6>
					</li>
					<li><a class="dropdown-item" href="#" id="c01">여성의류</a>
						<div class="c01-content">
							<a class="dropdown-item" href="#">여성 상의</a> <a
								class="dropdown-item" href="#">여성 하의</a>
						</div></li>
					<li><a class="dropdown-item" href="#" id="c02">남성의류</a>
						<div class="c02-content">
							<a class="dropdown-item" href="#">남성 상의</a> <a
								class="dropdown-item" href="#">남성 하의</a>
						</div></li>
					<li><a class="dropdown-item" href="#" id="c03">신발</a>
						<div class="c03-content">
							<a class="dropdown-item" href="#">운동화</a> <a
								class="dropdown-item" href="#">슬리퍼</a>
						</div></li>
					<li><a class="dropdown-item" href="#" id="c04">가방</a></li>
					<li><a class="dropdown-item" href="#" id="c05">시계/쥬얼리</a></li>
					<li><a class="dropdown-item" href="#" id="c06">패션악세서리</a></li>
					<li><a class="dropdown-item" href="#" id="c07">디지털/가전</a></li>
					<li><a class="dropdown-item" href="#" id="c08">스포츠/레저</a></li>
					<li><a class="dropdown-item" href="#" id="c09">차량/오토바이</a></li>
					<li><a class="dropdown-item" href="#" id="c10">차량/오토바이</a></li>
					<li><a class="dropdown-item" href="#" id="c11">스타굿즈</a></li>
					<li><a class="dropdown-item" href="#" id="c12">키덜트</a></li>
				</ul> -->
			</div>
			<div class="contents">

				<textarea rows="20%" cols="100%" placeholder="우리 동네 관련 정보를 공유해주세요!"></textarea>

			</div>
		</div>
	</main>
	<footer>
		<div class="footer-box">
			<span>만든이들 : 곽서호, 김동현 92, 김동현 93, 김동휘, 박시현, 베소현 </span><br> <span>CopyRight
				2022 @ ALL RIGHT RESERVED</span>
		</div>
	</footer>
</body>
</html>