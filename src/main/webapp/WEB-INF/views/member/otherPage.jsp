<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>내 상점</title>
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
<!-- Custom styles for this template -->
<link rel="stylesheet" href="/css/member/mypage.css">
<!-- 주소 API -->
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
img {
	width: 100px;
	height: 100px;
}
</style>


</head>

<body>

	<!--  Header -->
	<header>
		<!-- 로그인 했을 때만 진입 가능 -->
		<div class="header_Container">
			<ul class="header_list">
				<li><a href="signIn" hidden>로그인</a></li>
				<li><a href="/member/logout">로그아웃</a></li>
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
		<div class="mypage-container">
			<section class="section1">
				<div class="top-Container">
					<div class="left-Container">
						<!-- <div class="img-Container"> -->
						<!-- 수정중 -->

						<img src="${dto.profile_image}"
							style="width: 400px; height: 300px;">
						<!-- <button class="btn btn-lg btn-light" id="myShopBtn">내 상점
								관리</button> -->
						<!-- </div> -->
					</div>
					<div class="right-Container">
						<div class="right-id">아이디 : ${dto.id}</div>
						<div class="right-info">
							<label>
								<div>상점오픈일 : ${signDate }일째 오픈중!</div>
							</label>
							<div>상점방문수</div>
							<div>상품판매 : ${sellCount}건</div>
							<div></div>
							
						</div>
						<div class="right-introduce">
							소개글
							<textarea cols="30" rows="5" readonly> 새해복 많이 받으세요!</textarea>
						</div>
					</div>
				</div>
			</section>
			<section class="section2">
				<nav>
					<div class="nav nav-tabs" id="nav-tab" role="tablist">
							
						<button class="nav-link active" id="nav-sell-tab" data-bs-toggle="tab"
							data-bs-target="#nav-sell" type="button" role="tab"
							aria-controls="nav-sell" aria-selected="false">판매내역</button>
						<button class="nav-link" id="nav-purchase-tab"
							data-bs-toggle="tab" data-bs-target="#nav-purchase" type="button"
							role="tab" aria-controls="nav-purchase" aria-selected="false">구매내역</button>
						<button class="nav-link" id="nav-like-tab" data-bs-toggle="tab"
							data-bs-target="#nav-like" type="button" role="tab"
							aria-controls="nav-like" aria-selected="false">찜</button>
						<button class="nav-link" id="nav-following-tab"
							data-bs-toggle="tab" data-bs-target="#nav-following"
							type="button" role="tab" aria-controls="nav-following"
							aria-selected="false">팔로워</button>
						<button class="nav-link" id="nav-follower-tab"
							data-bs-toggle="tab" data-bs-target="#nav-follower" type="button"
							role="tab" aria-controls="nav-follower" aria-selected="false">팔로우
						</button>
					</div>
				</nav>
				
				
				<div class="tab-content" id="nav-tabContent">
				
		
		<!-- 판매내역-->
		<div class="tab-pane fade show active" id="nav-sell" role="tabpanel"
			aria-labelledby="nav-sell-tab">
			<div class="sell-top">판매내역 ${sellCount} 건</div>
			<div class="sell-section">
				<table>
					<tr>
						<th>사진</th>
						<th>거래상태</th>
						<th>상품명</th>
						<th>가격</th>
						<th>찜 수</th>
						<th>댓글 수</th>
						<th>최근 수정일</th>
						<th>기능</th>
					</tr>
					<!-- 해당 회원의 상품리스트 뽑아준다. -->

					<c:forEach var="i" items="${ilist}" varStatus="statusI">
						<c:forEach var="f" items="${flist}" varStatus="statusF">

							<c:if test="${statusI.index eq statusF.index }">


								<tr>
									<td id="target" style="display: none;">${i.iseq}</td>
									<td><img src="${f.sysName} " class="d-block w-100"
										alt="..." style="max-width: 100px; max-height: 100px;"></td>

									<td><select class="sellBoxes">

											<option value="Y"
												<c:if test ="${i.deal eq 'Y' }">selected </c:if>disabled>판매중</option>
											<option value="R"
												<c:if test ="${i.deal eq 'R' }">selected </c:if>disabled>예약중</option>
											<option value="N"
												<c:if test ="${i.deal eq 'N' }">selected </c:if>disabled>판매완료</option>

									</select></td>
									<!-- onchange="alert(this.value)" -->
									<td>${i.name}</td>
									<td>${i.price}</td>
									<td>${i.like_cnt}</td>
									<td>문의수들어갈자리</td>
									<td>${i.detailDate}</td>
									<%-- <td><a href="/items/itemsModify?iseq=${i.iseq}"><button
												type="button" class=" btn btn-lg btn-light">수정하기</button></a></td> --%>


								</tr>


							</c:if>
						</c:forEach>
					</c:forEach>

					<!-- 해당 회원의 상품리스트 뽑아준다. -->
				</table>
			</div>
		</div>

		

		<!-- 구매내역 -->
		<div class="tab-pane fade" id="nav-purchase" role="tabpanel"
			aria-labelledby="nav-purchase-tab">
			<div class="purchase-top" id="buyCount">구매내역 ${buyCount}건</div>
			<div class="purchase-section">


				<table>
					<tr>
						<th>사진</th>
						<th>거래상태</th>
						<th>상품명</th>
						<th>가격(안전결제수수료 미포함)</th>
						
					</tr>
					
					<c:forEach var="i" items="${buyIlist}" varStatus="statusI">
						<c:forEach var="f" items="${buyFlist}" varStatus="statusF">
							<c:if test="${i.iseq == f.parentSeq}">
								<tr>
									<td><a href=/items/itemsDetail?iseq=${i.iseq}><img
											src="${f.sysName}"></a></td>
									<c:if test="${i.deal2 =='R'}">
									<td>구매중</td>
									</c:if>		
									<c:if test="${i.deal2 =='Y'}">
									<td>구매완료</td>
									</c:if>
									<td>${i.name}</td>
									<td>${i.price}원</td>
									<td style="display: none;">${i.iseq}</td>
								

								</tr>
							</c:if>

						</c:forEach>
					</c:forEach>

				</table>
			</div>
		</div>

		



		<!-- 찜 내역 -->
		<div class="tab-pane fade" id="nav-like" role="tabpanel"
			aria-labelledby="nav-like-tab">
			<div class="like-top" id="like_count">찜 내역 : ${wCount}</div>
			<c:forEach var="wl" items="${wlist}" varStatus="statusWL">
				<c:forEach var="li" items="${likeImg}" varStatus="statusLI">


					<c:if test="${wl.iseq == li.parentSeq}">
						<!-- 수정중 -->

						<%-- <a id="rmvStyle" href="/items/itemsDetail?iseq=${wl.iseq}"> --%>

						<div class="like-section">

							<div class="like-left">
								<a id="rmvStyle" href="/items/itemsDetail?iseq=${wl.iseq}">
									<img src="${li.sysName}"
									style="width: 236.26px; height: 101.9px">
								</a>
							</div>


							<div class="like-middle">
								<div class="like-title">상품명:${wl.name }</div>

								<div class="like-seller">판매자:${wl.sellerID }</div>

								<div class="like-price">가격:${wl.price }</div>
							</div>


							
						</div>
						<!-- </a> -->
					</c:if>

				</c:forEach>
			</c:forEach>
		
		</div>





<!-- 팔로워  -->
      <div class="tab-pane fade" id="nav-following" role="tabpanel"
         aria-labelledby="nav-following-tab">
         <div class="following-top">팔로워 수: ${fCount}</div>
         <c:forEach var="f" items="${followlist}">
            <div class="following-section">
               <div class="follower-left">
                  <img src="${f.profile_image}" style="width: 100%; height: 100%">
               </div>
               <div class="following-middle">${f.name }</div>
              
            </div>
         </c:forEach>
      </div>
      
      <!-- 팔로워에 대한 스크립트 -->
      
      
      <!-- 팔로우 -->
      <div class="tab-pane fade" id="nav-follower" role="tabpanel"
         aria-labelledby="nav-follower-tab">
         <div class="follower-top">팔로우 수 : ${followedCount }</div>
         <c:forEach var="j" items="${followedList }">
            <div class="follower-section">
               <div class="follower-left">
                  <img src="${j.profile_image}" style="width: 100%; height: 100%">
               </div>
               <div class="follower-middle">${j.name }</div>
              
            </div>
         </c:forEach>
      </div>
      
    
       

		


	</main>
	<!-- footer -->
	<footer>
		<div class="footer-box">
			<span>만든이들 : 곽서호, 김동현 92, 김동현 93, 김동휘, 박시현, 베소현 </span><br> <span>CopyRight
				2022 @ ALL RIGHT RESERVED</span>
		</div>
	</footer>
	<script>
		$("#deleteInfo").on("click", function() {
			if (confirm("정말 탈퇴하시겠습니까?")) {
				location.href = "/member/leave";
			} else {
				return false;
			}
		})
		$("#pwChange").on("click", function() {
			$("#pw").attr("disabled", true);
			$("#cpw").attr("disabled", false);
			document.getElementById("cpw").value = "";

		})
		//이미지 삽입 후 바뀜
		$(document).ready(function() {
			$("#imgfile").change(function(event) {
				var tmppath = URL.createObjectURL(event.target.files[0]);
				$('#profile').attr('src', tmppath);
			});
		});
		$("#phoneChange").on("click", function() {
			$("#phone").attr("readonly", false);
		})
		//주소지 값 자동 추가해주는 함수
		document.getElementById("findAddress").onclick = function() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							document.getElementById('inputZipcode').value = data.zonecode;
							document.getElementById("inputAddress1").value = data.roadAddress;
							document.getElementById("inputAddress1").value = data.jibunAddress;
						}
					}).open();
		}
	</script>
	<!--^^^  -->


</div>

</body>

</html>