<!DOCTYPE html>
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link rel="stylesheet" href="/css/header.css">
<link rel="stylesheet" href="/css/footer.css">
<!-- Custom CSS -->
<link rel="stylesheet" href="/css/productAdd.css">
<!-- JS -->
<script src="/js/index.js"></script>

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
		<div class="div-wrap3"></div>
	</header>
	<main>
		<div class="container-div">
			<!-- 네비바 -->
			<div class="top-div">
				<div class="div-wrap2">
					<div class="btn-group">
						<button type="button" class="btn btn-secondary-light"
							data-bs-toggle="dropdown" aria-expanded="false">
							<i class="fas fa-bars fa-2x"></i>
						</button>
						<ul class="dropdown-menu">

							<!-- Dropdown menu links -->
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
						</ul>
					</div>
					<div class="rightList">

						<a href="productAdd" class="btn-sell"> <i
							class="fas fa-dollar-sign fa-2x"></i> 판매하기
						</a> | <a href="myPage" class="btn-myshop"> <i
							class="fas fa-store fa-2x"></i> 내상점
						</a> | <a href="talk" class="btn-talk"> <i
							class="fas fa-comment fa-2x"></i> 00톡
						</a> | <a href="board/boardList" class="btn-talk"> <i
							class="fas fa-edit fa-2x"></i>커뮤니티
						</a>


					</div>
				</div>
			</div>
			<div class="contents-div">
				<nav>
					<div class="nav nav-tabs" id="nav-tab" role="tablist">
						<button class="nav-link active" id="nav-add-tab"
							data-bs-toggle="tab" data-bs-target="#nav-add" type="button"
							role="tab" aria-controls="nav-add" aria-selected="true">상품등록</button>
						<button class="nav-link" id="nav-control-tab" data-bs-toggle="tab"
							data-bs-target="#nav-control" type="button" role="tab"
							aria-controls="nav-control" aria-selected="false">상품관리</button>
						<button class="nav-link" id="nav-purchase-tab"
							data-bs-toggle="tab" data-bs-target="#nav-purchase" type="button"
							role="tab" aria-controls="nav-purchase" aria-selected="false">????</button>
					</div>
				</nav>
				<div class="tab-content" id="nav-tabContent">
					<!-- 상품정보 -->
					<div class="tab-pane fade show active" id="nav-add" role="tabpanel"
						aria-labelledby="nav-add-tab">
						<div class="add-title">
							<div class="left-title">기본정보</div>
							<div class="right-title">*필수항목</div>
						</div>
						<div class="add-contents">
							<table class="contents-table">
								<tr>
									<td>상품이미지</td>
									<td>이미지넣기</td>
								</tr>
								<tr>
									<td>제목</td>
									<td><input type="text" placeholder="상품제목을 입력하세요."
										class="inputTitle"></td>
								</tr>
								<tr>
									<td>카테고리</td>
									<td>
										<ul class="category-menu">
											<li>전체카테고리
											<li><a href="#">여성의류</a>
											<ul class="submenu-women">
												<li><a href="#">여성 상의</a>
												<li><a href="#">여성 하의</a>
											</ul>
											<li><a href="#">남성의류</a>
											<ul class="submenu-men">
												<li><a href="#">남성 상의</a>
												<li><a href="#">남성 하의</a>
											</ul>
											<li><a href="#">남성의류</a>
											<!-- <li>
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
											<li><a class="dropdown-item" href="#" id="c12">키덜트</a></li> -->
										</ul>
									</td>
								</tr>
								<tr>
									<td>거래지역</td>
									<td>
										<button>내위치</button>
										<button>최근지역</button>
										<button>주소검색</button>
										<button>지역설정안함</button> <br> <input type="text"
										placeholder="주소">
									</td>
								</tr>
								<tr>
									<td>상품 상태</td>
									<td><input type="radio" value="중고상품">중고상품 <input
										type="radio" value="새상품">새상품</td>
								</tr>
								<tr>
									<td>교환</td>
									<td><input type="radio" value="교환불가">교환불가 <input
										type="radio" value="교환가능">교환가능</td>
								</tr>
								<tr>
									<td>가격</td>
									<td><input type="text" placeholder="숫자만 입력하세요">원 <br>
										<input type="radio" value="교환불가">배송비포함</td>
								</tr>
								<tr>
									<td>기타 설명</td>
									<td><textarea rows="5" cols="40"
											placeholder="상품설명을 입력해주세요."></textarea></td>
								</tr>
								<tr>
									<td>연관태그</td>
									<td><input type="text" placeholder="연관태그를 입력하세요."></td>
								</tr>
							</table>
							<div class="add-bottom-title">
								<div class="bottom-left-title">기타옵션</div>
							</div>
							<div class="add-bottom-contents">
								<div class="contents-div">기타옵션</div>
							</div>
							<div class="add-btns-div">
								<button class="btn btn-outline-secondary" id="productAddBtn"
									type="button">상품등록</button>
								<button class="btn btn-outline-secondary" id="resetBtn"
									type="reset">초기화</button>
							</div>
						</div>
					</div>
					<!-- 판매내역-->
					<div class="tab-pane fade" id="nav-control" role="tabpanel"
						aria-labelledby="nav-control-tab">
						<div class="control-title">
							<div class="left-title">상품관리</div>
						</div>
						<div class="control-contents">
							<div class="control-search-input">
								<input type="text" placeholder="상품명을 입력하세요">
								<button type="button" class="searchBtn">검색</button>
							</div>
							<div class="control-search-div">
								<table class="control-search-table">
									<tr>
										<th>사진
										<th>판매상태
										<th>상품명
										<th>가격
										<th>찜/댓글
										<th>최근수정일
										<th>기능
									</tr>
									<tr>
										<td>
										<td>
										<td>
										<td>
										<td>
										<td>
										<td>
									</tr>
									<!-- 
									<tr>
										<td colsapn="7">표시할 내용이 없습니다.
									</tr> 
									-->
								</table>
							</div>
						</div>
					</div>
					<!-- 구매내역 -->
					<div class="tab-pane fade" id="nav-purchase" role="tabpanel"
						aria-labelledby="nav-purchase-tab">페이지3</div>
				</div>
			</div>
	</main>
	<!-- footer -->
	<footer>
		<div class="footer-box">
			<span>만든이들 : 곽서호, 김동현 92, 김동현 93, 김동휘, 박시현, 베소현 </span><br> <span>CopyRight
				2022 @ ALL RIGHT RESERVED</span>
		</div>
	</footer>

</body>
</html>