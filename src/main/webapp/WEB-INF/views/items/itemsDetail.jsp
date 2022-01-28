<!DOCTYPE html>
<html lang="en">
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>상품 상세 설명</title>
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
<link rel="stylesheet" href="/css/items/itemsDetail.css">


</head>
<body>
	<!--  Header -->
	<header>
		<div class="header_Container">
					<c:choose>
						<c:when test="${loginID != null}">	
						<ul class="header-list-after-login">
           			     <li> 이미지 부분 : ${dto.profile_image}</li>
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
		<div class="detail-top-div">
			<div class="detail-left">
				<div class="left-img">
					<!-- <i class="fas fa-camera fa-2x"></i> -->

					<div id="carouselExampleIndicators" class="carousel slide"
						data-bs-ride="carousel">
						<div class="carousel-indicators">



							<!--     <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0"
                                class="active" aria-current="true" aria-label="Slide 1"></button>
                            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1"
                                aria-label="Slide 2"></button>
                            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2"
                                aria-label="Slide 3"></button>
                                 -->



							<c:forEach var="f" items="${flist}" varStatus="status">



								<c:choose>

									<c:when test="${status.first}">
										<button type="button"
											data-bs-target="#carouselExampleIndicators"
											data-bs-slide-to="0" class="active" aria-current="true"
											aria-label="Slide 1"></button>

									</c:when>

									<c:otherwise>
										<button type="button"
											data-bs-target="#carouselExampleIndicators"
											data-bs-slide-to="${status.index} "
											aria-label="Slide ${status.count }"></button>

										<script>
											console.log(${status.index} + " : " +${status.count});
											</script>

									</c:otherwise>

								</c:choose>
							</c:forEach>








						</div>
						<div class="carousel-inner">
							<c:forEach var="f" items="${flist}" varStatus="status">

								<c:choose>

									<c:when test="${status.first}">

										<div class="carousel-item active">
											<img src="${f.sysName } " class="d-block w-100" alt="..." style="max-width:200px; max-height:200px;">
										</div>

									</c:when>

									<c:otherwise>
										<div class="carousel-item">
											<img src="${f.sysName }" class="d-block w-100" alt="..." style="max-width:200px; max-height:200px;">
										</div>
									</c:otherwise>

								</c:choose>
							</c:forEach>



						</div>
					</div>

				</div>
			</div>


			<c:forEach var="i" items="${ilist}" varStatus="status">
				<div class="detail-right">
					<div class="productName">${i.name}</div>
					<div class="productPrice">${i.price}원</div>
					<div class="product-status">
						<div class="status-like">좋아요</div>
						<div class="status-view">조회수</div>
						<div class="status-view">작성일 : ${i.detailDate}</div>
					</div>
					<div class="product-detail">
						<div class="detail-product-status">상품 상태 : ${i.condition}</div>
						<div class="detail-exchange">교환 여부 : ${i.refundable}</div>
						<div class="detail-delivery">거래 희망 지역 : ${i.exarea}</div>
						<div class="detail-location"></div>
					</div>
					
					<!-- 진행중 -->
					<%-- <c:when test="${loginID != null}"> --%>
					<div class="detail-btns">
					<c:choose> 
						<c:when test = "${i.sellerID eq loginID}">
					<a href = "/items/myPage" ><button type="button" class="btn btn-lg btn-light">내상점관리</button></a>
						</c:when>
						<c:otherwise>
						<button id="btn-like" class="btn btn-lg btn-light">찜</button>
						<button id="btn-talk" class="btn btn-lg btn-light">연락하기</button>
						<button id="btn-buy" class="btn btn-lg btn-light">바로구매</button>
						</c:otherwise>
						</c:choose>
					</div>
					
					
					 <!-- 연락하기 버튼을 눌렀을 때의 script -->
					 
					 <!--value =${i.name}  -->
        <input type=hidden value="300티셔츠" id="hiddenProduct">
        <input type=hidden value="1" id="hiddenProductId">
       <script>
        	let hiddenProduct = $("#hiddenProduct").val();
        	let hiddenProductId = $("#hiddenProductId").val();
        	$("#btn-talk").on("click",function(){
        		location.href = "/chat/talk?productName="+hiddenProduct+"&productId="+hiddenProductId;
        	})
        </script>
         
				</div>
			</c:forEach>
		</div>
		
		

		<div class="detail-bottom-div">
			<div class="bottom-top">
				<div class="bottom-top-title">연관상품</div>
				<div class="bottom-top-img">
					<c:forEach var="ri" items="${rilist}"  varStatus="statusRI">
						<c:forEach var="rf" items="${rflist}"  varStatus="statusRF">
						
						<c:if test = "${statusRF.index eq statusRI.index }" >
	
							<%--  <c:if test= "${rf.parentSeq == ri.iseq}"> --%>
							<div class="bottom-top-imglist">
								<a href="/items/itemsDetail?iseq=${ri.iseq}"><img src="${rf.sysName}" style="max-width:200px; max-height:200px;"> <a href="javascript:void(0);">${ri.name}</a></a>
						<script>
						
								</script>		
								
							</div>
							</c:if>
							</c:forEach>
					
						</c:forEach>
						
				</div>
			</div>
			<div class="bottom-bottom">
				<nav>
					<div class="nav nav-tabs" id="nav-tab" role="tablist">
						<button class="nav-link active" id="nav-profile-tab"
							data-bs-toggle="tab" data-bs-target="#nav-profile" type="button"
							role="tab" aria-controls="nav-profile" aria-selected="true">상품정보</button>
						<button class="nav-link" id="nav-ask-tab" data-bs-toggle="tab"
							data-bs-target="#nav-ask" type="button" role="tab"
							aria-controls="nav-ask" aria-selected="false">상품문의</button>
						<button class="nav-link" id="nav-purchase-tab"
							data-bs-toggle="tab" data-bs-target="#nav-purchase" type="button"
							role="tab" aria-controls="nav-purchase" aria-selected="false">????</button>
					</div>
				</nav>
				<div class="tab-content" id="nav-tabContent">
					<!-- 상품정보 -->
					<div class="tab-pane fade show active" id="nav-profile"
						role="tabpanel" aria-labelledby="nav-profile-tab">
						<div class="product-section">
							<c:forEach var="i" items="${ilist}" varStatus="status">
							<div class="product-section1">							
								<div class="product-info-title">상품정보</div>
								<div class="product-info-contents">상품설명</div>
							</div>
							</c:forEach>
							<div class="product-section2">
								<div class="shop-info">상점정보</div>
							</div>
							
						</div>
					</div>
					<!-- 판매내역-->
					<div class="tab-pane fade" id="nav-ask" role="tabpanel"
						aria-labelledby="nav-ask-tab">페이지2</div>
					<!-- 구매내역 -->
					aria-labelledby="nav-purchase-tab">페이지3
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