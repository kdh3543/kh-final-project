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
			<link rel="stylesheet" href="/css/header_searchBar.css">
			<link rel="stylesheet" href="/css/footer.css">
			<!-- Custom styles for this template -->
			<link href="/css/board/modifyForm.css" rel="stylesheet">
			<!-- JS -->
			<script src="/js/modifyForm.js"></script>

</head>

<body>
		 <!--  Header -->
    <header>
        <div class="header_Container">
            <ul class="header_list">
              <c:choose>
               <c:when test="${loginID != null}">
              
              	
              	${dto}
           			${dto.profile_image } 하이요
           				 ${loginID} 님 안녕하세요&nbsp;&nbsp;| &nbsp;&nbsp;
                  <a href="/member/logout" id="logoutbtn">로그아웃&nbsp;&nbsp;|</a>&nbsp;&nbsp;
                  <a href="/member/myPage">마이페이지&nbsp;&nbsp;|</a>&nbsp;&nbsp;
                  <a href="/member/leave" id="leavebtn" >회원 탈퇴&nbsp;&nbsp;|</a>&nbsp;&nbsp;
               </c:when>
               <c:otherwise>
                  <li><a href="signIn">로그인</a></li>
                  <li><a href="join">회원가입</a></li>
               </c:otherwise>
            </c:choose>
                
            </ul>
        </div>
        <div class="div-wrap">
            <div class="nav_div">
                <div class="logo">
                    <i class="fas fa-seedling"></i>
                    <a href="/">00마켓</a>
                </div>
                <div class="searchBar">
                    <div class="input-group mb-3">
                        <input type="text" class="form-control" placeholder="동네 이름, 물품명 등을 검색해 보세요!"
                            aria-label="Recipient's username" aria-describedby="button-addon2">
                        <button class="btn btn-outline-secondary" type="button" id="button-addon2"><i
                                class="fas fa-search fa-2x"></i></button>    
                    </div>
                </div>
            </div>
        </div>
    </header>

	<main>
		<div class="contents-box">
			<form action="/board/modifyProc" method="post" enctype="multipart/form-data">
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