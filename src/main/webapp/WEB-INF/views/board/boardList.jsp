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
  			<script src="/js/paginga.jquery.js"></script>

</head>

<body>
	<!--  Header -->
	<!-- form 태그 추가 button type=submit 변경 -->
	<form action="/items/searchByInput" name=inputForm method="post"
		onsubmit="return frmSubmit()">
		<!--  Header -->
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
							<li><a href="/signIn">로그인</a></li>
							<li><a href="/join">회원가입</a></li>
						</ul>
					</c:otherwise>
				</c:choose>
			</div>
			<div class="div-wrap">
				<div class="nav_div">
					<div class="logo">
						<a href="/"><img src="/imgs/sideLogo2.png" class="logoImg"></a>
					</div>


					<div class="searchBar">
						<div class="input-group mb-3">


							<!-- 검색창 관련 -->
							<div class="btn-group ">
								<input type="text" name="keyword" class="form-control"
									placeholder="@상점명 또는 물품명 등을 검색해 보세요!"
									aria-label="Recipient's username"
									aria-describedby="button-addon2" id="search"
									data-bs-toggle="dropdown" aria-expanded="false">

								<!-- 돋보기-->
								<button class="btn btn-outline-secondary" type="submit"
									id="button-addon2">
									<i class="fas fa-search fa-2x"></i>
								</button>
								<!--  돋보기 끝-->

								<input type=hidden name="user_id" value="${loginID}">


								<!-- 최신검색어-->
								<!--  수정 -->

								<div class="dropdown-menu" id=recent>
									<!-- <a class="dropdown-item" href="/"
										style="text-align: center"> -->
									<div class="list-search-div">
										<div class="list-search-div">
											<a class="dropdown-item" id="search-dropdown"
												href="javascript:void(0);" style="text-align: center">
												<nav class="top-nav">
													<div class="nav nav-tabs" id="nav-tab1" role="tablist">

														<button class="nav-link active" id="nav-search-tab"
															data-bs-toggle="tab" data-bs-target="#nav-search"
															type="button" role="tab" aria-controls="nav-search"
															aria-selected="true">최근검색어</button>


														<button class="nav-link" id="nav-hotkeyword-tab"
															data-bs-toggle="tab" data-bs-target="#nav-hotkeyword"
															type="button" role="tab" aria-controls="nav-hotkeyword"
															aria-selected="false">인기검색어</button>

													</div>
												</nav> <!-- 최근검색어 -->
												<div class="tab-content" id="nav-tabContent">
													<div class="tab-pane fade show active" id="nav-home"
														role="tabpanel" aria-labelledby="nav-home-tab">

														<!-- 내용 채워넣기 -->
														<div id=text>

															<button type=button id=delBtn class="dropdown-item"
																style="display: inline">
																<b><h6>검색어 전체삭제</h6></b>
															</button>
														</div>


													</div>
													<!--  인기검색어-->
										
													<div class="tab-pane fade" id="nav-hotkeyword" role="tabpanel"
														aria-labelledby="nav-hotkeyword-tab">
														<div class="hotkeyword-title">인기검색어 순위</div>
														<div class=hotkeyword-contents>


															<c:forEach var="hs" items="${hslist}"
																varStatus="statusHS">

																<div>
																	<span class="hotkeyword-num">${statusHS.count}.</span>
																	<span class="hotkeyword-word">${hs.keyword}</span>
																</div>


															</c:forEach>
														</div>
													</div>
												</div>
											</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</header>
	</form>
		<!-- 검색어 전체 삭제 -->
	<script>
								
									$("#delBtn").on("click", function() {
										$.ajax({
											url : "/items/deleteAll",
										}).done(function(resp) {
											console.log(resp);
											$("#text").empty();
										})
									})
								</script>

	<!-- 검색어 하나 눌렀을때 검색되게 -->

	<script>
									$('#text').on("click",	".delBtnOne",function() {
										/*버튼 X 제거하고 값 추출  */
														var str = $(this).parent().text().slice(0, -1);
														$(this).parent().remove();

														$.ajax({
															url : "/items/deleteByKeyword?keyword="+ str
																	}).done(function(resp) {
																		
																	})
																})
								</script>
	<!-- 	<button type=button style="float: right">인기검색어 보기</button> -->

	<script>
						// 검색버튼 눌렀을 때, 
							$(function() {

								$("#search").one("click", function() {

									$.ajax({
										url : "/items/listing",
										datatype : "json"
									}).done(function(resp) {

										resp = JSON.parse(resp);

										for (let i = 0; i < 5; i++) {
											let text = $("#text");

											let line = $("<div>");
											line.addClass("line");

										
											 let textLine= $("<div>");
											

											textLine.append(resp[i].keyword);

											textLine.addClass("textLine");

											let delButton = $("<button>");
											delButton.addClass("delBtnOne");
											delButton.text("X");
											delButton.css("float", "right");

											textLine.append(text.val());
											textLine.append(delButton);
										

											line.append(textLine);

											$("#text").append(line);

										}

									})
								})
							})
							/*드랍다운 꺼지는 것 방지 */
							$("#recent").on('click', function (e) {
					                             e.stopPropagation();
					                           });
					// 삭제할 때, 
							$('#text').on("click",".delBtnOne",function() {
								/*버튼 X 제거하고 값 추출  */
								var str = $(this).parent().text().slice(0, -1);
								$(this).parent().remove();
								$.ajax({
								url : "/items/deleteByKeyword?keyword="+ str
								}).done(function(resp) {


								})

							})
			
						</script>

	<!-- 검색시 공백 막기-->
	<script>
						
						function frmSubmit() {
							let searchValue = $("#search").val();
							console.log(searchValue);
							if(searchValue ==null || searchValue == "" ){
								alert("상품명 또는 @상점명을 검색하세요")
								return false;
								
							}
							
							}
							
							
						</script>

	<main>
      <div class="contents-box" id="contents-box">
         <div class="contents-top-div">
            <h1 class="h3 mb-3 fw-normal">커뮤니티</h1>
            <button class="btn btn-primary" id="toWrite">새 글 등록</button>
         </div>
         <div class="subject-menu">
            <button class="btn btn-primary search" type="button" id="question">동네질문</button>
            <button class="btn btn-primary search" type="button" id="incident">동네사건사고</button>
            <button class="btn btn-primary search" type="button" id="restaurant">동네맛집</button>
            <button class="btn btn-primary search" type="button" id="news">동네소식</button>
            <button class="btn btn-primary search" type="button" id="lost">분실/실종센터</button>
            <button class="btn btn-primary search" type="button" id="cat">고양이</button>
            <button class="btn btn-primary search" type="button" id="dog">강아지</button>
            <button class="btn btn-primary search" type="button" id="others">기타</button>
         </div>
         <div class="paginate">
            <div class="items">
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
                        <div class="contents-div-writer">${dto.writer} </div>
                        <div class="contents-div-location"> </div>
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
                           <a href="toDetail?seq=${dto.board_seq}"
                              style="color: black; text-decoration: none"><i class="fas fa-comment"></i> 댓글
                              ${dto.comment_count}</a>
                        </div>
                     </div>
                  </div>
               </c:forEach>
            </div>

            <div class="pager">
               <div class="firstPage">&laquo;</div>
               <div class="previousPage">&lsaquo;</div>
               <div class="pageNumbers"></div>
               <div class="nextPage">&rsaquo;</div>
               <div class="lastPage">&raquo;</div>
            </div>
         </div>
      </div>
   </main>

	<footer>
		<div class="footer-box">
			<span>만든이들 : 곽서호, 김동현 92, 김동현 93, 김동휘, 박시현, 배소현 </span><br> <span>CopyRight
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
			
			if(${loginID==null}){
				alert("로그인 후 이용가능합니다.");
				return false;
			}else{
				location.href = "writeForm";
			}
			
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
	<script>
		$(".search").on("click", function () {
			var subject = $(this).html();
			console.log(subject);
			location.href = "boardSearch?subject=" + subject;
		})
		    $(".paginate").paginga({
         page: 1,
         maxPageNumbers: false,
         itemsPerPage: 5
      });

	</script>
</body>

</html>