<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>

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
<link rel="stylesheet" href="/css/index.css">

</head>

<body>
	
<!-- form 태그 추가 button type=submit 변경 -->
	<form action="/items/searchByInput" name =inputForm method="post" onsubmit="return frmSubmit()">
		<!--  Header -->
		<header>
			<div class="header_Container">
				<c:choose>
					<c:when test="${loginID != null}">
						<ul class="header-list-after-login">
							<li>이미지 부분 : ${dto.profile_image}</li>
							<li>${loginID}님안녕하세요</li>

							<li><a href="/items/myPage">마이페이지</a></li>
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

	
	<!-- 검색창 관련 -->
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

							




	<main>
		<div class="index-container">
			<!-- 네비바 -->
			<div class="d-none d-md-block d-lg-block" id="top-div">
				<div class="div-wrap2">
					<div class="btn-group">
						<button type="button" class="btn btn-secondary-light"
							data-bs-toggle="dropdown" aria-expanded="false">
							<i class="fas fa-bars fa-2x"></i>
						</button>
						<ul class="dropdown-menu">

							<!-- Dropdown menu links -->
							<li><h6 class="dropdown-header">전체 카테고리</h6></li>
							<li><a class="dropdown-item" href="/items/searchByCategory?category=여성의류" id="c01">여성의류</a></li>
							<li><a class="dropdown-item" href="/items/searchByCategory?category=남성의류" id="c02">남성의류</a></li>
							<li><a class="dropdown-item" href="/items/searchByCategory?category=신발" id="c03">신발</a></li>
							<li><a class="dropdown-item" href="/items/searchByCategory?category=가방" id="c04">가방</a></li>
							<li><a class="dropdown-item" href="/items/searchByCategory?category=시계/쥬얼리" id="c05">시계/쥬얼리</a></li>
							<li><a class="dropdown-item" href="/items/searchByCategory?category=패션악세서리" id="c06">패션악세서리</a></li>
							<li><a class="dropdown-item" href="/items/searchByCategory?category=디지털/가전" id="c07">디지털/가전</a></li>
							<li><a class="dropdown-item" href="/items/searchByCategory?category=스포츠/레저" id="c08">스포츠/레저</a></li>
							<li><a class="dropdown-item" href="/items/searchByCategory?category=차량/오토바이" id="c09">차량/오토바이</a></li>
							<li><a class="dropdown-item" href="/items/searchByCategory?category=스타굿즈" id="c11">스타굿즈</a></li>
							<li><a class="dropdown-item" href="/items/searchByCategory?category=키덜트" id="c12">키덜트</a></li>
						</ul>
					</div>
					<div class="rightList">

						<a href="/items/itemsSell" class="btn-sell"> <i
							class="fas fa-dollar-sign fa-2x"></i> 판매하기
						</a> | <a href="/items/myPage" class="btn-myshop"> <i
							class="fas fa-store fa-2x"></i> 내상점
						</a> | <a href="/chat/directTalk" class="btn-talk"> <i
							class="fas fa-comment fa-2x"></i> 00톡
						</a> | <a href="/board/boardList" class="btn-talk"> <i
							class="fas fa-edit fa-2x"></i>커뮤니티
						</a>


					</div>
				</div>
			</div>
			<div class="middle-div">
				<section>
					<div id="carouselExampleControls" class="carousel slide"
						data-bs-ride="carousel">
						<div class="carousel-inner" style="height: auto;">
							<div class="carousel-item active">
								<img src="/imgs/welcome.png" class="d-block w-100" alt="...">
							</div>
							<div class="carousel-item">
								<img src="/imgs/welcome2.png" class="d-block w-100" alt="...">
							</div>
							<div class="carousel-item">
								<img src="/imgs/welcome3.png" class="d-block w-100" alt="...">
							</div>
						</div>
						<button class="carousel-control-prev" type="button"
							data-bs-target="#carouselExampleControls" data-bs-slide="prev">
							<span class="carousel-control-prev-icon" aria-hidden="true"></span>
							<span class="visually-hidden">Previous</span>
						</button>
						<button class="carousel-control-next" type="button"
							data-bs-target="#carouselExampleControls" data-bs-slide="next">
							<span class="carousel-control-next-icon" aria-hidden="true"></span>
							<span class="visually-hidden">Next</span>
						</button>
					</div>
					<article>

						<p class="article_title">오늘의 상품추천</p>
						<!-- imgBox 1 구간 -->

						
								
						<div class="imgBox  col-sm-3">

  <!--상품 반복 시작 -->


								<c:forEach var="i" items="${ilist}">
									<c:forEach var="f" items="${flist}">

										<c:if test="${f.parentSeq == i.iseq}">

											<a href="/items/itemsDetail?iseq=${i.iseq}">
												<div class="detail-img">
													<img src="${f.sysName}" style="width: 100%; height: 100%;">
												</div>
												<div class="detail-container">
													<div class="title">${i.name}</div>
													<div class="price">${i.price}원</div>
													<div class="date">${i.detailDate}</div>
													<%-- <div class="title">${flist.oriname}</div> --%>
												</div>
											</a>

										</c:if>

									</c:forEach>

								</c:forEach>

						</div>


					</article>
				</section>

			</div>
		</div>
		<div class="d-none d-lg-block" id="sideBar">
			<div class="sidebar-div">
				<a href="#">
					<button class="btn btn-outline-secondary" type="button"
						id="likeProductBtn">
						찜한상품<br> <i class="fas fa-heart">개수</i>
					</button>

				</a>
				<div class="sidebar-resently-div">
					<div class="sidebar-title-div">최근 본 상품</div>
					<div class="sidebar-product-div">
						<img src=""> 
						<img src="">
					</div>

				</div>
				<a href="#"><button class="btn btn-outline-secondary"
						id="upTopBtn" onclick="window.scrollTo(0,0)">Top</button></a>
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

	<script>
		$("#logoutbtn").on("click", function() {
			if (confirm("정말 로그아웃하시겠습니까?")) {
				location.href = "logout"
			} else {
				return false;
			}

		})
		$("#leavebtn").on("click", function() {
			if (confirm("정말 회원을 탈퇴하시겠습니까?")) {
				location.href = "leave"
			} else {
				return false;
			}

		})
	</script>
</body>

</html>