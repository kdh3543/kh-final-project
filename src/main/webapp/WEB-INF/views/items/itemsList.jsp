<!DOCTYPE html>
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>상품리스트 페이지</title>
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
    <link rel="stylesheet" href="/css/items/itemsList.css">
<body>
	<!--  Header -->
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
				<div class="searchBar">
					<div class="input-group mb-3">
						<input type="text" class="form-control"
							placeholder="동네 이름, 물품명 등을 검색해 보세요!"
							aria-label="Recipient's username"
							aria-describedby="button-addon2">
						<button class="btn btn-outline-secondary" type="button"
							id="button-addon2">
							<i class="fas fa-search fa-2x"></i>
						</button>
					</div>
				</div>
			</div>
		</div>
	</header>
	<main>
		<div class="main-title">예를들어 카테고리 여성의류</div>
		<div class="main-container">
			<article>
				<p class="article_title">오늘의 상품추천</p>
				<!-- imgBox 1 구간 -->
				<div class="imgBox-1">
					<a href="productDetail">
						<div class="detail-img">
							<img src="imgs/t-shirt.jpeg">
						</div>
						<div class="detail-container">
							<div class="title">티셔츠</div>
							<div class="price">3000원</div>
							<div class="date">0일전</div>
						</div>

					</a> <a href="#">
						<div class="detail-img">
							<img src="imgs/200Pic.png">
						</div>
						<div class="detail-container">
							<div class="title">상품명</div>
							<div class="price">0000원</div>
							<div class="date">0일전</div>
						</div>

					</a> <a href="#">
						<div class="detail-img">
							<img src="imgs/200Pic.png">
						</div>
						<div class="detail-container">
							<div class="title">상품명</div>
							<div class="price">0000원</div>
							<div class="date">0일전</div>
						</div>

					</a> <a href="#">
						<div class="detail-img">
							<img src="imgs/200Pic.png">
						</div>
						<div class="detail-container">
							<div class="title">상품명</div>
							<div class="price">0000원</div>
							<div class="date">0일전</div>
						</div>
					</a> <a href="#">
						<div class="detail-img">
							<img src="imgs/200Pic.png">
						</div>
						<div class="detail-container">
							<div class="title">상품명</div>
							<div class="price">0000원</div>
							<div class="date">0일전</div>
						</div>

					</a> <a href="#">
						<div class="detail-img">
							<img src="imgs/200Pic.png">
						</div>
						<div class="detail-container">
							<div class="title">상품명</div>
							<div class="price">0000원</div>
							<div class="date">0일전</div>
						</div>

					</a>

					<!-- imgBox 2 구간 -->
					<a href="#">
						<div class="detail-img">
							<img src="imgs/200Pic.png">
						</div>
						<div class="detail-container">
							<div class="title">상품명</div>
							<div class="price">0000원</div>
							<div class="date">0일전</div>
						</div>

					</a> <a href="#">
						<div class="detail-img">
							<img src="imgs/200Pic.png">
						</div>
						<div class="detail-container">
							<div class="title">상품명</div>
							<div class="price">0000원</div>
							<div class="date">0일전</div>
						</div>
					</a> <a href="#">
						<div class="detail-img">
							<img src="imgs/200Pic.png">
						</div>
						<div class="detail-container">
							<div class="title">상품명</div>
							<div class="price">0000원</div>
							<div class="date">0일전</div>
						</div>

					</a> <a href="#">
						<div>
							<img src="imgs/200Pic.png">
						</div>
						<div class="detail-container">
							<div class="title">상품명</div>
							<div class="price">0000원</div>
							<div class="date">0일전</div>
						</div>
					</a>

				</div>
				<p class="article_title">일반상품</p>
				<!-- imgBox 1 구간 -->
				<div class="imgBox-2">
					<a href="productDetail">
						<div class="detail-img">
							<img src="imgs/t-shirt.jpeg">
						</div>
						<div class="detail-container">
							<div class="title">티셔츠</div>
							<div class="price">3000원</div>
							<div class="date">0일전</div>
						</div>

					</a> <a href="#">
						<div class="detail-img">
							<img src="imgs/200Pic.png">
						</div>
						<div class="detail-container">
							<div class="title">상품명</div>
							<div class="price">0000원</div>
							<div class="date">0일전</div>
						</div>

					</a> <a href="#">
						<div class="detail-img">
							<img src="imgs/200Pic.png">
						</div>
						<div class="detail-container">
							<div class="title">상품명</div>
							<div class="price">0000원</div>
							<div class="date">0일전</div>
						</div>

					</a> <a href="#">
						<div class="detail-img">
							<img src="imgs/200Pic.png">
						</div>
						<div class="detail-container">
							<div class="title">상품명</div>
							<div class="price">0000원</div>
							<div class="date">0일전</div>
						</div>
					</a> <a href="#">
						<div class="detail-img">
							<img src="imgs/200Pic.png">
						</div>
						<div class="detail-container">
							<div class="title">상품명</div>
							<div class="price">0000원</div>
							<div class="date">0일전</div>
						</div>

					</a> <a href="#">
						<div class="detail-img">
							<img src="imgs/200Pic.png">
						</div>
						<div class="detail-container">
							<div class="title">상품명</div>
							<div class="price">0000원</div>
							<div class="date">0일전</div>
						</div>

					</a>

					<!-- imgBox 2 구간 -->
					<a href="#">
						<div class="detail-img">
							<img src="imgs/200Pic.png">
						</div>
						<div class="detail-container">
							<div class="title">상품명</div>
							<div class="price">0000원</div>
							<div class="date">0일전</div>
						</div>

					</a> <a href="#">
						<div class="detail-img">
							<img src="imgs/200Pic.png">
						</div>
						<div class="detail-container">
							<div class="title">상품명</div>
							<div class="price">0000원</div>
							<div class="date">0일전</div>
						</div>
					</a> <a href="#">
						<div class="detail-img">
							<img src="imgs/200Pic.png">
						</div>
						<div class="detail-container">
							<div class="title">상품명</div>
							<div class="price">0000원</div>
							<div class="date">0일전</div>
						</div>

					</a> <a href="#">
						<div>
							<img src="imgs/200Pic.png">
						</div>
						<div class="detail-container">
							<div class="title">상품명</div>
							<div class="price">0000원</div>
							<div class="date">0일전</div>
						</div>
					</a>

				</div>
				<nav aria-label="Page navigation example">
					<ul class="pagination">
						<li class="page-item"><a class="page-link" href="#"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a></li>
						<li class="page-item"><a class="page-link" href="#">1</a></li>
						<li class="page-item"><a class="page-link" href="#">2</a></li>
						<li class="page-item"><a class="page-link" href="#">3</a></li>
						<li class="page-item"><a class="page-link" href="#"
							aria-label="Next"> <span aria-hidden="true">&raquo;</span>
						</a></li>
					</ul>
				</nav>
			</article>
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