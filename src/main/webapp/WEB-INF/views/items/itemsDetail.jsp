<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>

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
						<li>이미지 부분 : ${dto.profile_image}</li>
						<li>${loginID}님안녕하세요</li>
						<li><a href="/myPage">마이페이지</a></li>
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
							placeholder="상점명, 물품명 등을 검색해 보세요!"
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
											data-bs-slide-to="${status.index}"
											aria-label="${status.count}"></button>

									</c:otherwise>
								</c:choose>
							</c:forEach>



						</div>






						<div class="carousel-inner">
							<c:forEach var="f" items="${flist}" varStatus="status">

								<c:choose>

									<c:when test="${status.first}">

										<div class="carousel-item active">
											<img src="${f.sysName} " class="d-block w-100" alt="..."
												style="max-width: 300px; max-height: 300px;">
										</div>

									</c:when>

									<c:otherwise>
										<div class="carousel-item">
											<img src="${f.sysName }" class="d-block w-100" alt="..."
												style="max-width: 300px; max-height: 300px;">
										</div>
									</c:otherwise>

								</c:choose>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>





			<div class="detail-right">
				<c:forEach var="i" items="${ilist}" varStatus="status">


					<div class="productName">${i.name}</div>
					<div class="productPrice">${i.price}원</div>
					<div class="product-status">
						<div class="status-like">좋아요</div>

						<div class="status-view">조회수 : ${i.view_cnt}</div>
						<div class="status-view">작성일 : ${i.detailDate}</div>
					</div>


				</c:forEach>
				<div class="product-detail">

					<div class="detail-report">
						<!-- Button trigger modal -->
						<button type="button" class="btn btn-primary"
							data-bs-toggle="modal" data-bs-target="#staticBackdrop"
							id="reportBtn">
							<i class="fas fa-bell"></i>신고하기
						</button>
						<!-- Modal -->
						<div class="modal fade" id="staticBackdrop"
							data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
							aria-labelledby="staticBackdropLabel" aria-hidden="true">
							<div class="modal-dialog modal-dialog-centered">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="staticBackdropLabel">신고하기</h5>
										<button type="button" class="btn-close"
											data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body">
										<div class="form-check">
											<input class="form-check-input" type="radio"
												name="flexRadioDefault" id="flexRadioDefault1"> <label
												class="form-check-label" for="flexRadioDefault1">
												광고(상점 및 타사이트 홍보, 상품도배) </label>
										</div>
										<div class="form-check">
											<input class="form-check-input" type="checkbox" value=""
												id="flexCheckDefault2"> <label
												class="form-check-label" for="flexCheckDefault2"> 상품
												정보 부정확(상품명, 이미지, 가격, 태그 등) </label>
										</div>
										<div class="form-check">
											<input class="form-check-input" type="radio"
												name="flexRadioDefault" id="flexRadioDefault3"> <label
												class="form-check-label" for="flexRadioDefault3">거래
												금지 품목 </label>
										</div>
										<div class="form-check">
											<input class="form-check-input" type="radio"
												name="flexRadioDefault" id="flexRadioDefault4"> <label
												class="form-check-label" for="flexRadioDefault4">
												사기의심(외부채널 유도) </label>
										</div>
										<div class="form-check">
											<input class="form-check-input" type="radio"
												name="flexRadioDefault" id="flexRdioDefault5" value="r5">
											<label class="form-check-label" for="flexRadioDefault5">
												기타(사유) </label> <input type="text" placeholder="사유를 입력해주세요."
												class="reasonInput" disabled>
										</div>
										<script>
										  $("input:radio[name=flexRadioDefault]").click(function(){
											  if($("#flexRdioDefault5:checked").val() =="r5"){
													$(".reasonInput").attr("disabled",false);
												}
										  });
										
											
										</script>

									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-bs-dismiss="modal">닫기</button>
										<button type="submit" class="btn btn-primary"
											id="reportSubmitBtn">전송하기</button>
									</div>
								</div>
							</div>
						</div>
					</div>

					<c:forEach var="i" items="${ilist}" varStatus="status">
						<div class="detail-product-status">상품 상태 : ${i.condition}</div>
						<div class="detail-exchange">교환 여부 : ${i.refundable}</div>
						<div class="detail-delivery">거래 희망 지역 : ${i.exarea}</div>
						<div class="detail-location"></div>

					</c:forEach>
				</div>


				<c:forEach var="i" items="${ilist}" varStatus="status">
					<div class="detail-btns">
						<c:choose>
							<c:when test="${i.sellerID eq loginID}">
								<button type="button" id="btn-myPage"
									class="btn btn-lg btn-light">내상점관리</button>
							</c:when>
							<c:otherwise>
								<button id="btn-like" class="btn btn-lg btn-light">찜</button>
								<button id="btn-talk" class="btn btn-lg btn-light">연락하기</button>
								<button id="btn-buy" class="btn btn-lg btn-light">바로구매</button>
							</c:otherwise>
						</c:choose>
					</div>
				</c:forEach>
				<!-- 진행중 -->
			</div>

		</div>


		<!--  동현이형 -->
		<!-- 연락하기 버튼을 눌렀을 때의 script -->
		<input type=hidden value="베이직후드티" id="hiddenProduct"> <input
			type=hidden value="2" id="hiddenProductId">
		<script>
        	let hiddenProduct = $("#hiddenProduct").val();
        	let hiddenProductId = $("#hiddenProductId").val();
            let roomId = 0;
        	$("#btn-talk").on("click",function(){
        		location.href = "/chat/talk?productName="+hiddenProduct+"&productId="+hiddenProductId+"&roomId="+roomId;
        	})
        </script>


		<!-- 동현이형 /// -->
		<script>
        <!-- 바로구매 버튼을 눌렀을 때의 script -->
        	$("#btn-buy").on("click",function(){
        		location.href = "/items/itemsOrder";
        	})
        	
        	<!-- 내상점관리 버튼을 눌렀을 때의 script -->
        	  $("#btn-myPage").on("click",function(){
    		location.href = "/items/myPage";
    	})
  
        </script>

		<div class="detail-bottom-div">
			<div class="bottom-top">
				<div class="bottom-top-title">연관상품</div>
				<div class="bottom-top-img">



					<c:forEach var="ri" items="${rilist}" varStatus="statusRI">
						<c:forEach var="rf" items="${rflist}" varStatus="statusRF">

							<c:if test="${statusRF.index eq statusRI.index }">

								<%--  <c:if test= "${rf.parentSeq == ri.iseq}"> --%>
								<div class="bottom-top-imglist">
									<a href="/items/itemsDetail?iseq=${ri.iseq}"><img
										src="${rf.sysName}"
										style="max-width: 200px; max-height: 200px;"> <a
										href="javascript:void(0);">${ri.name}</a></a>
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
						<!--  <button class="nav-link" id="nav-ask-tab" data-bs-toggle="tab" data-bs-target="#nav-ask"
                            type="button" role="tab" aria-controls="nav-ask" aria-selected="false">상품문의</button>
                        <button class="nav-link" id="nav-purchase-tab" data-bs-toggle="tab"
                            data-bs-target="#nav-purchase" type="button" role="tab" aria-controls="nav-purchase"
                            aria-selected="false">????</button> -->
					</div>
				</nav>
				<div class="tab-content" id="nav-tabContent">
					<!-- 상품정보 -->


					<div class="tab-pane fade show active" id="nav-profile"
						role="tabpanel" aria-labelledby="nav-profile-tab">
						<div class="product-section">


							<div class="product-section1">
								<c:forEach var="i" items="${ilist}" varStatus="status">

									<div class="product-info-title">상품정보</div>
									<div class="product-info-contents">${i.info}</div>
									<div class="product-middle">
										<div class="middle-location">
											<div class="location-title">거래지역</div>
											<div class="location-contents">${i.exarea}</div>
										</div>
										<div class="middle-category">
											<div class="category-title">카테고리</div>
											<div class="category-contents">
												<a href="#">${i.category}</a>
											</div>
										</div>
										<div class="middle-tag">
											<div class="tag-title">태그</div>
											<div class="tagy-contents">${i.tag}</div>
										</div>
									</div>

								</c:forEach>
								<!-- 시현이형 부분 -->
								<div class="write-title-div">상품문의</div>
								<div class="product-question">
									<form action="/items/QNAWriteProc" method="post"
										enctype="multipart/form-data">
										<div class="write-div">
											<textarea class="write-textarea" placeholder="상품 문의를 작성해주세요."
												name="contents"></textarea>
										</div>
										<div class="write-bottom-div">
											<div>1/100</div>
											<button type="submit" class="writeBtn" name="submit">등록</button>
											<c:forEach var="i" items="${ilist}" varStatus="status">
												<input type="hidden" name="iseq" value="${i.iseq}">
											</c:forEach>
										</div>
									</form>
									<div>
										<c:forEach var="q" items="${qlist}" varStatus="status">
										${q.writer}
										${q.contents}
										${q.parsed_date}
										<c:if test="${q.writer == loginID}">
												<div class="btn-group">
													<button type="button" class="btn btn-secondary-light"
														data-bs-toggle="dropdown" aria-expanded="false">
														<i class="fas fa-ellipsis-v fa-2x"></i>
													</button>
													<ul class="dropdown-menu">

														<!-- Dropdown menu links -->
														<li>
															<h6 class="dropdown-header">메뉴</h6>
														</li>
														<li>
															<a class="dropdown-item" id="deleteQNA"
															href="/items/deleteQNAProc?qseq=${q.items_qna_seq}&iseq=${q.iseq}">삭제</a>
														</li>
													</ul>
												</div>
											</c:if>
										</c:forEach>
									</div>
								</div>
							</div>
							<div class="product-section2">
								<div class="shop-info-title">상점정보</div>
								<div class="shop-info-div">
									<div class="info-left-div">
										<i class="fas fa-camera fa-1x"></i>
									</div>
									<div class="info-right-div">
										<div class="right-div-title">상점이름</div>
										<div class="right-div-contents">
											<span>상품 10 </span>| <span>팔로워 1</span>
										</div>
									</div>
								</div>
								<div class="follow-btn-div">
									<button type="button" class="followBtn">
										<i class="fas fa-user-plus"></i> 팔로우
									</button>
								</div>
								<div class="shop-info-images">
									<img src=""> <img src="">
								</div>
								<div class="more-btn-div">
									<button type="button" class="moreBtn">?개의 상품 더보기 ></button>
								</div>
								<div class="shop-info-review">
									<div class="review-title-div">상점후기</div>
									<div class="review-title-contents">
										<div class="review-contents-left">
											등록된 후기가 없습니다.<br>첫 후기를 등록해보세요!
										</div>
										<div class="review-contents-right">
											<button type="button" class="reviewBtn">후기작성</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>


					<!-- <!— 판매내역—>
					<!— <div class="tab-pane fade" id="nav-ask" role="tabpanel" aria-labelledby="nav-ask-tab">
                        페이지2
                    </div> —>
					<!— 구매내역 —>
					<!— <div class="tab-pane fade" id="nav-purchase" role="tabpanel" aria-labelledby="nav-purchase-tab">
                        페이지3
                    </div>  —> -->

				</div>


			</div>

		</div>

	</main>
	<!-- <!— footer —> -->
	<footer>
		<div class="footer-box">
			<span>만든이들 : 곽서호, 김동현 92, 김동현 93, 김동휘, 박시현, 베소현 </span><br> <span>CopyRight
				2022 @ ALL RIGHT RESERVED</span>
		</div>
	</footer>
</body>
</html>