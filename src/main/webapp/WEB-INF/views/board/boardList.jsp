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
			<!-- CSS -->
			<link rel="stylesheet" href="/css/font.css">
			<link rel="stylesheet" href="/css/header_searchBar.css">
			<link rel="stylesheet" href="/css/footer.css">
			<!-- Custom styles for this template -->
			<link href="/css/board/boardList.css" rel="stylesheet">
			<!-- JS -->
			<script src="/js/boardDetail.js"></script>

</head>

<body>
	<!--  Header -->
	<header>
		<div class="header_Container">
			<ul class="header_list">
				<c:choose>
					<c:when test="${loginID != null}">
						${loginID} 님 안녕하세요&nbsp;&nbsp;| &nbsp;&nbsp;
						<a href="/member/logout" id="logoutbtn">로그아웃&nbsp;&nbsp;|</a>&nbsp;&nbsp;
						<a href="/member/myPage">마이페이지&nbsp;&nbsp;|</a>&nbsp;&nbsp;
						<a href="/member/leave" id="leavebtn">회원 탈퇴&nbsp;&nbsp;|</a>&nbsp;&nbsp;
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
					<i class="fas fa-seedling"></i> <a href="/">00마켓</a>
				</div>
				<div class="searchBar">
					<div class="input-group mb-3">
						<input type="text" class="form-control" placeholder="동네 이름, 물품명 등을 검색해 보세요!"
							aria-label="Recipient's username" aria-describedby="button-addon2">
						<button class="btn btn-outline-secondary" type="button" id="button-addon2">
							<i class="fas fa-search fa-2x"></i>
						</button>
					</div>
				</div>
			</div>
		</div>
	</header>
	<main>
		<div class="contents-box" id="contents-box">
			<div class="contents-top-div">
				<h1 class="h3 mb-3 fw-normal">동네(ex 회현동)</h1>
				<button class="btn btn-primary" id="toWrite">새 글 등록</button>
			</div>
			<div class="subject-menu">
				<button class="btn btn-primary" type="button" id="question">동네질문</button>
				<button class="btn btn-primary" type="button" id="incident">동네사건사고</button>
				<button class="btn btn-primary" type="button" id="restaurant">동네맛집</button>
				<button class="btn btn-primary" type="button" id="news">동네소식</button>
				<button class="btn btn-primary" type="button" id="lost">분실/실종센터</button>
				<button class="btn btn-primary" type="button" id="cat">고양이</button>
				<button class="btn btn-primary" type="button" id="dog">강아지</button>
				<button class="btn btn-primary" type="button" id="others">기타</button>
			</div>
			<c:forEach var="dto" items="${list}" varStatus="status">
				<div class="contents">
					<div class="contents-title">${dto.subject}</div>
					<div class="contents-div">
						<div class="contents-div-contents">
							<a class="contents-a${status.count}" href="toDetail?seq=${dto.board_seq}"
								style="color: black; text-decoration: none">${dto.contents}</a>
						</div>
					</div>
					<script>
						/* 글자수 넘쳤을 때 */
						let div${ status.count } = $(".contents-a${status.count}").html();
						if (div${ status.count }.length > 100) {
							$(".contents-a${status.count}").html(div${ status.count }.substring(0, 170) + "...");
						}
				
					</script>
					<div class="contents-container">
						<div class="contents-div-writer">${dto.writer} ·</div>
						<div class="contents-div-location"> 위치 ·</div>
						<div class="contents-div-writedate"> ${dto.parsed_date}</div>
					</div>
					<div class="form-floating">
						<div class="floating-likes" id="like">
							<c:choose>
								<c:when test="${loginID != null}">
									<c:choose>
										<c:when test="${dto.user_id == loginID}">
											<a href="#" board_seq="${dto.board_seq}" class="btnLike liked"
												style="color: #24a6a4; text-decoration: none"> <i
													class="fas fa-heart"></i>좋아요 <span
													class="likeCount">${dto.like_count}</span></a>
										</c:when>
										<c:otherwise>
											<a href="#" board_seq="${dto.board_seq}" class="btnLike disliked"
												style="color: black; text-decoration: none"> <i
													class="fas fa-heart"></i>좋아요 <span
													class="likeCount">${dto.like_count}</span></a>
										</c:otherwise>
									</c:choose>
								</c:when>
								<c:otherwise>
									<a class="like-unclickable"><i class="fas fa-heart"></i>좋아요
										<span>${dto.like_count}</span></a>
								</c:otherwise>
							</c:choose>
						</div>
						<div class="floating-comments">
							<a href="toDetail?seq=${dto.board_seq}" style="color: black; text-decoration: none"><i
									class="fas fa-comment"></i> 댓글
								${dto.comment_count}</a>
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
		// window.onscroll = function () {
		// 	if((window.innerHeight + window.scrollY) >= document.body.offsetHeight){
		// 		var toAdd = document.createElement("div");
		// 		toAdd.classList.add("contents");
		// 		toAdd.textContent = "추가";
		// 		document.querySelector("contents-box").append(toAdd);
		// 	}
		// }
		// window.onscroll = function () {
		// 	if((window.innerHeight + window.scrollY) >= document.body.offsetHeight){
		// 		var toAdd = $("<div class='body'>");
		// 		toAdd.append('추가!');
		// 		$("#contents-box").append(toAdd);
		// 	}
		// }
		// var count = 6;
		// window.onscroll = function () {
		// 	if((window.innerHeight + window.scrollY) >= document.body.offsetHeight){
		// 		var content_box = $("<div class='contents-box'>");
		// 		var contents = $("<div class='contents'>");
		// 		contents.append(count + '추가!');
		// 		content_box.append(contents);
		// 		$("#contents-box").append(contents);
		// 		count = count + 1;
		// 	}
		// }
	</script>
	
	<script>
		$("#toWrite").on("click", function () {
			location.href = "writeForm";
		})

		$(".like-unclickable").on("click", function () {
			alert("로그인이 필요한 기능입니다.");
		})

		$(".btnLike").on("click", function () {
			if ($(this).hasClass('liked')) {
				$.ajax({
					url: "dislikeProc",
					context: this,
					data: {
						seq: $(this).attr("board_seq")
					},
					success: function (likeCount) {
						$(this).children('span.likeCount').html(likeCount);
						$(this).css("color", "black");
						$(this).removeClass('liked');
						$(this).addClass('disliked');
					}
				})
			}

			else if ($(this).hasClass('disliked')) {
				$.ajax({
					url: "likeProc",
					context: this,
					data: {
						seq: $(this).attr("board_seq")
					},
					success: function (likeCount) {
						$(this).children('span.likeCount').html(likeCount);
						$(this).css("color", "#24a6a4");
						$(this).removeClass('disliked');
						$(this).addClass('liked');
					}
				})
			}
			return false;
		})
	</script>
</body>

</html>