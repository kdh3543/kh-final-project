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
			<div class="contents" id="subject-menu">
				<div>
					<button type="button" id="back">돌아가기</button>
					<div class="btn-group">
                        <button type="button" class="btn btn-secondary-light" data-bs-toggle="dropdown"
                            aria-expanded="false">
                            <i class="fas fa-bars fa-2x"></i>
                        </button>
                        <ul class="dropdown-menu">

                            <!-- Dropdown menu links -->
                            <li>
                                <h6 class="dropdown-header">메뉴</h6>
                            </li>
                            <li>
                               <a class="dropdown-item" id="modifyBoard">수정</a>
                               <a class="dropdown-item" id="deleteBoard">삭제</a>
                            </li>                      
                        </ul>
                    </div>
				</div>
				<span>주제(ex 동네소식)</span>
				<h3>${dto.writer}</h3>
				<h6>위치 / ${dto.write_date}</h6>

				<div>${dto.contents}</div>

				<span>등록순</span> / <span>최신순</span>
			</div>
				<c:forEach var="cdto" items="${list}">
					<div class="contents">
						<h3 id="comment-writer">${cdto.writer}</h3>
						<span id="location">위치</span> / <span id="comment-write-date">${cdto.write_date}</span>
						<div class="btn-group">
	                        <button type="button" class="btn btn-secondary-light" data-bs-toggle="dropdown"
	                            aria-expanded="false">
	                            <i class="fas fa-bars fa-2x"></i>
	                        </button>
	                        <ul class="dropdown-menu">
	
	                            <!-- Dropdown menu links -->
	                            <li>
	                                <h6 class="dropdown-header">메뉴</h6>
	                            </li>
	                            <li>
	                               <a class="dropdown-item" id="modifyComment">수정</a>
	                               <a class="dropdown-item" id="deleteComment">삭제</a>
	                            </li>                      
	                        </ul>
	                    </div>
						<div id="comment-contents">${cdto.contents}</div>
						<span id="like-count">좋아요(좋아요 수)</span>
					</div>
				</c:forEach>
			<div class="contents">
				<form action="/comment/writeProc?seq=${dto.board_seq}" method="post"
					enctype="multipart/form-data">
					<textarea rows="" cols="100%" placeholder="댓글을 입력해주세요."
						name="contents"></textarea>
					<button type="submit" name="submit">등록</button>
				</form>
			</div>
		</div>
	</main>
	<footer>
		<div class="footer-box">
			<span>만든이들 : 곽서호, 김동현 92, 김동현 93, 김동휘, 박시현, 베소현 </span><br> <span>CopyRight
				2022 @ ALL RIGHT RESERVED</span>
		</div>
	</footer>

	<script>
		$("#back").on("click", function() {
			location.href = "/board/boardList";
		})
		
		$("#modifyBoard").on("click", function() {
			location.href = "/board/boardList";
		})
		
		$("#deleteBoard").on("click", function() {
			location.href = "/board/deleteProc?seq=${dto.board_seq}";
		})
		
		$("#modifyComment").on("click", function() {
			location.href = "/board/boardList";
		})
		
		$("#deleteComment").on("click", function() {
			location.href = "/board/boardList";
		})
	</script>

	<!-- 댓글 Ajax 코드 -->
	<!-- <script>
		$("#add-comment").on("click", function() {
			$.ajax({
				url : "/comment/writeProc",
				data : {
					board_seq : "${dto.board_seq}",
					contents : $("#contents").val()
				},
				dataType : "json"
			}).done(function(ResponseResult) {
				console.log(ResponseResult);
				let contents = $("<div>");				

				let comment_writer = $("<h3>");
				comment_writer.append(ResponseResult.writer);
				
				let location = $("<span>");
				location.append("위치");
				
				let comment_write_date = $("<span>");
				comment_write_date.append(ResponseResult.write_date);

				let comment_contents = $("<div>");
				comment_contents.append(ResponseResult.contents);

				let like_count = $("<span>");
				like_count.append("좋아요(좋아요 수)");

				contents.append(comment_writer);
				contents.append(location);
				contents.append(comment_write_date);
				contents.append(comment_contents);
				contents.append(like_count);

				$("#comment-container").append(contents);
			})
		})
	</script> -->
</body>
</html>