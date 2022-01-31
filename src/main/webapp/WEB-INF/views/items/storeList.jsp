<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>상점 검색페이지</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>index</title>
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
<link rel="stylesheet" href="/css/header_searchBar.css">
<link rel="stylesheet" href="/css/footer.css">
<link rel="stylesheet" href="/css/storeList.css">
</head>
<body>
	<!--  Header -->
		<header>
			<div class="header_Container">
				<c:choose>
					<c:when test="${loginID != null}">
						<ul class="header-list-after-login">
							<li>이미지 부분 : ${dto.profile_image}</li>
							<li>${loginID}님안녕하세요</li>
							<li><a href="/member/myPage">마이페이지</a></li>
							<li><a href="/member/leave" id="leavebtn">회원 탈퇴</a></li>
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
						<i class="fas fa-seedling"></i> <a href="/">00마켓</a>
					</div>
					<div class="searchBar">
						<div class="input-group mb-3">

						<div class="btn-group ">
								<input type="text" name="keyword" class="form-control"
									placeholder="상점명 또는 물품명 등을 검색해 보세요!"
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
									<a class="dropdown-item" id="search-dropdown" href="javascript:void(0);"
										style="text-align: center">
											<nav>
												<div class="nav nav-tabs" id="nav-tab" role="tablist">
													
													<button class="nav-link active" id="nav-home-tab"
														data-bs-toggle="tab" data-bs-target="#nav-home"
														type="button" role="tab" aria-controls="nav-home"
														aria-selected="true">최근검색어</button>
														
														
													<button class="nav-link" id="nav-profile-tab"
														data-bs-toggle="tab" data-bs-target="#nav-profile"
														type="button" role="tab" aria-controls="nav-profile"
														aria-selected="false">인기검색어</button>

												</div>
											</nav>
											<!-- 최근검색어 -->
											<div class="tab-content" id="nav-tabContent">
												<div class="tab-pane fade show active" id="nav-home"
													role="tabpanel" aria-labelledby="nav-home-tab">

													<!-- 내용 채워넣기 -->
													<div id=text>
													
													<button type=button id=delBtn class="dropdown-item"
														style="display: inline"><b><h5>검색어 전체삭제</h5></b></button>												
													</div>
																	
														
												</div>
												<!--  인기검색어-->
												  <div class="tab-pane fade" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact-tab">
												
												  </div>
													
												<div class="tab-pane fade" id="nav-profile" role="tabpanel"
													aria-labelledby="nav-profile-tab">
													<div class="hotkeyword-title">인기검색어 순위</div>
													<div class=hotkeyword-contents>
													
													
													<c:forEach var="hs" items="${hslist}" varStatus="statusHS">
														
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

								<!-- 인기 검색어 -->
									<!-- <ul class="dropdown-menu" style="min-width: 400px;" >
									<li><a class="dropdown-item" href="#"><span>1.</span> Action</a></li>
									<li><a class="dropdown-item" href="#"> actisadfasdfasdfon</a></li>
									<li><a class="dropdown-item" href="#">Something else
											here</a></li>
									<li><hr class="dropdown-divider"></li>
									<li><a class="dropdown-item" href="#">검색어 전체삭제</a></li>
								</ul>  -->

								<!-- Default dropend button -->
								<!-- <div class="btn-group dropend">
  <button type="button" class="btn btn-secondary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
    Dropright
  </button>
  <ul class="dropdown-menu">
    Dropdown menu links
  </ul>
</div> -->

			




		</header>
	
	<main>
	<div class="main-container">
		<div class="title">검색결과</div>
		<div class="contents">
			<div class="contents-list">
				<div class="left-list">
					<img src="#">
				</div>
				<div class="right-list">
					<div class="store-name">스토어이름</div>
					<div class="store-etc">
						<span>상품 </span>|
						<span>팔로워 </span>
					</div>
				</div>
			</div>
		</div>
	</div>
	</main>
	<!-- footer -->
	<footer>
		<div class="footer-box">
			<span>만든이들 : 곽서호, 김동현 92, 김동현 93, 김동휘, 박시현, 소현 </span><br> <span>CopyRight
				2022 @ ALL RIGHT RESERVED</span>
		</div>
	</footer>

</body>
</html>