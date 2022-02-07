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


</head>

<body>


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
							<li><a href="signIn">로그인</a></li>
							<li><a href="join">회원가입</a></li>
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
											<a class="dropdown-item" id="search-dropdown" href="javascript:void(0);" style="text-align: center">
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
												</nav> 
												<!-- 최근검색어 -->
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
						<div class="right-id">아이디 : ${loginID }</div>
						<div class="right-info">
							<label>
								<div>상점오픈일 : ${signDate }일째 오픈중!</div>
							</label>
							<div>상점방문수: ${dto.view_count}</div>
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
						<button class="nav-link active" id="nav-profile-tab"
							data-bs-toggle="tab" data-bs-target="#nav-profile" type="button"
							role="tab" aria-controls="nav-profile" aria-selected="true">회원정보수정</button>
						<button class="nav-link" id="nav-sell-tab" data-bs-toggle="tab"
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
					<!-- 회원정보 수정 -->
					<div class="tab-pane fade show active" id="nav-profile"
						role="tabpanel" aria-labelledby="nav-profile-tab">
						<div class="profile-top">회원정보수정</div>
						<form action="/member/updateInfo" method="post"
							enctype=multipart/form-data>
							<div class="profile-content">
								<div class="profile-img">
									<label for="imgfile" class="del-button img-up"> <input
										type="file" id=imgfile name="file"
										accept=".jpg, .png, .jpeg, .gif" style="display: none;">
										<img src="${dto.profile_image}" id="profile"> 프로필 사진 등록
									</label>
								</div>
								<div class="profile-content-section">
									<table class="profile-table">
										<br>
										<tr>
											<td>아이디</td>
											<td><input type="text" class="inputId" name="id"
												value="${dto.id }" readonly></td>
										</tr>
										<tr>
											<td>비밀번호</td>
											<!-- ^^^ -->
											<td><input type="hidden" class="input Password" id="pw"
												name="pw" value="${dto.pw}"> <input type="text"
												class="input Password" id="cpw" name="pw"
												placeholder="최소 한개의 문자, 한개의 숫자 , 한개의 특수 문자를 포함한 8~20자리"
												value="비밀번호를 변경하시려면 버튼을 눌러주세요"
												pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,20}$"
												required disabled>


												<button type="button" class=" btn btn-lg btn-light"
													id="pwChange">비밀번호 변경</button></td>
										</tr>
										<tr>
											<td>이름</td>
											<td><input type="text" class="inputName"
												value="${dto.name }" disabled></td>
										</tr>
										<tr>
											<td>전화번호</td>
											<td><input type="text" class="inputPhone" id="phone"
												name="phone" value="${dto.phone }" readonly required>
												<button type="button" class=" btn btn-lg btn-light"
													id="phoneChange">전화번호 변경</button></td>
										</tr>
										<tr>
											<td>우편변호</td>
											<td><input type="text" class="inputZipcode"
												id="inputZipcode" name="zipcode" value="${dto.zipcode }"
												required>
												<button type="button" class=" btn btn-lg btn-light"
													id="findAddress">주소 검색</button></td>
										</tr>
										<tr>
											<td>주소1</td>
											<td><input type="text" class="inputAddress1"
												id="inputAddress1" name="address1" value="${dto.address1 }"
												readonly required></td>
										</tr>
										<tr>
											<td>주소2</td>
											<td><input type="text" class="inputAddress2"
												id="address2" name=address2 value="${dto.address2 }"
												required></td>
										</tr>
										<tr>
											<td>거래선호지역</td>
											<td><input type="text" class="inputlocation"
												id="prefer_location" name=prefer_location
												value="${dto.prefer_location }" required></td>
										</tr>
										<tr>
											<td>잔여포인트</td>
											<td><input type="text" class="" id="remainPoint" name=cash
												value="${dto.cash}" disabled></td>
										</tr>
										<tr>
											<td colspan="2">
												<button type="submit" class=" btn btn-lg btn-light"
													id="updateInfo">정보수정</button>
												<button type="button" class=" btn btn-lg btn-light"
													id="deleteInfo">회원탈퇴</button>
											<td>
										</tr>
									</table>
								</div>
							</div>
						</form>

					</div>



					<!-- 판매내역-->
					<div class="tab-pane fade" id="nav-sell" role="tabpanel"
						aria-labelledby="nav-sell-tab">
						<div class="sell-top" id="sellCount">판매내역 : ${sellCount} 건</div>
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
												<td><a href="/items/itemsDetail?iseq=${i.iseq}"><img
														src="${f.sysName} " class="d-block w-100" alt="..."
														style="max-width: 100px; max-height: 100px;"></a></td>

												<td><select class="sellBoxes">

														<option value="Y"
															<c:if test ="${i.deal eq 'Y' }">selected</c:if>>판매중</option>
														<option value="R"
															<c:if test ="${i.deal eq 'R' }">selected </c:if>>예약중</option>
														<option value="N"
															<c:if test ="${i.deal eq 'N' }">selected </c:if>>판매완료</option>

												</select></td>
												<!-- onchange="alert(this.value)" -->
												<td id="targetName">${i.name }</td>
												<td>${i.price }</td>
												<td>${i.like_cnt }</td>
												<td>문의수들어갈자리</td>
												<td>${i.detailDate}</td>

												<td><a href="/items/itemsModify?iseq=${i.iseq}">
														<button type="button" class=" btn btn-lg btn-light">수정</button>
												</a>


													<button type="button"
														class=" btn btn-lg btn-light deleteBtn">삭제</button> </a></td>


											</tr>


										</c:if>
									</c:forEach>
								</c:forEach>

								<!-- 해당 회원의 상품리스트 뽑아준다. -->
							</table>
						</div>
					</div>


					<!-- 삭제하기 Script -->
					<script>
		$(document)
		.ready(
				function() {
					$('.deleteBtn').on("click",function() {
						
						//삭제할 상품명+seq
						let targetSeq =$(this).closest("tr").children("#target").text();
						let targetName =$(this).closest("tr").children("#targetName").text();
						
						console.log($(this).closest("tr").children("#target").text());
						console.log($(this).closest("tr").children("#targetName").text());
						
						if(confirm("해당 상품을 삭제하시겠습니까 ? : "+targetName )){

							$.ajax({
										url : "/items/itemsDeleteBySeq",
										context: this,
										data : {
											iseq : targetSeq,
										},
										

									}).done(
									function(resp) {
										console.log(resp);
										if(resp>0){
											$(this).closest("tr").remove();
											$("#sellCount").text("판매내역 : " +${sellCount-1}+"건");
										}
										
									});
							
						
						}else{
							
							return false;
						}

					})
					
				})
				
				
				
		
		</script>
					<!-- 상품 삭제하기 script -->

					<script>
			$(document)
					.ready(
							function() {

								//코드 변경

								var prev_val;

								$('.sellBoxes')
										.focus(function() {

											console.log($(this).val());

											prev_val = $(this).val();

										})
										.change(
												function() {

													//선택된 selectBox 의 index 추출
													var index = $('.sellBoxes')
															.index(this);

													console.log(index
															+ " 번째 값 ");

													//해당 selectBox의 선택된 option 값 추출 
													var targetSelect = $(
															'.sellBoxes').get(
															index);
													var cur_val = targetSelect.options[targetSelect.selectedIndex].text
													console.log(cur_val
															+ " 로 변경합니다");

													$(this).blur();

													if (confirm("거래상태를 "
															+ cur_val
															+ "(으)로 변경하시겠습니까?")) {

														console
																.log("바뀌는 값  : "
																		+ $(
																				this)
																				.val());
														var targetDeal = $(this)
																.val();
														/*해당상품의 seq 찾아내기 */
														var targetIseq = $(this)
																.parent()
																.parent()
																.children(
																		"#target")
																.text();

														console.log(targetIseq);

														alert('변경 완료');
														$.ajax(
																		{
																			url : "/items/updateProc",
																			data : {
																				piseq : targetIseq,
																				pdeal : targetDeal
																			},

																		})
																.done(
																		function(
																				resp) {
																			console
																					.log(resp);
																		});

														/* var sendData = "name="+iseq+'&phone='+iseq;
														name=2&phone=2
														console.log(sendData); */

														/* $("#delBtn").on("click",function(){
														   
														   $.ajax({
														      url:"/items/deleteAll",
														      
														   }).done(function(resp){
														      console.log(resp);
														      
														      $("#text").empty();
														      
														   })
														   
														   }) */
													} else {

														// 기존에 선택한 값으로 Undo

														$(this).val(prev_val);

														alert('변경취소');

														return false;

													}

												});

							});
		</script>

					<!-- 구매내역 -->
					<div class="tab-pane fade" id="nav-purchase" role="tabpanel"
						aria-labelledby="nav-purchase-tab">
						<div class="purchase-top" id="buyCount">구매내역 : ${buyCount}건</div>
						<div class="purchase-section">


							<table>
								<tr>
									<th>사진</th>
									<th>거래상태</th>
									<th>상품명</th>
									<th>가격(안전결제수수료 미포함)</th>
									<th>거래확정</th>
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
												<th><c:choose>
														<c:when test="${i.deal2 == 'Y'}">
															<button class=" btn btn-lg btn-light "
																id="otherConfirmBtn">구매확정</button>
														</c:when>
														<c:otherwise>
															<button class="btn btn-lg btn-light buyOk"
																id="confirmBtn">구매확정</button>
															<button class="btn btn-lg btn-light buyCancel"
																id="cancleBtn">구매취소</button>

														</c:otherwise>
													</c:choose> <!-- <button class=" btn btn-lg btn-light" id="readReviewBtn" hidden>거래완료</button> -->
												</th>

											</tr>
										</c:if>

									</c:forEach>
								</c:forEach>

							</table>
						</div>
					</div>

					<script>
		
	
			
			$(".buyOk").on(
					"click",
					function() {

						console.log($(this).text());
						/*iseq 찾기  */
						console.log("해당 iseq 는 ? : "
								+ $(this).closest("tr").find('td:nth-child(5)')
										.text());

						if (confirm("구매확정시 되돌릴 수 없습니다. 해당 구매를 확정하시겠습니까?")) {
							$(this).css("background-color", "rgb(220,20,60)");
							$(this).next().css("display", "none");
							/* $(this).css("disabled","true"); */
							
	
							let iseq = $(this).closest("tr").find(
									'td:nth-child(6)').text();
							console.log($(this));
							
							

							$.ajax({
								url : "/safeDeal/dealOk",
								data : {
									iseq : iseq
								},
								context : this,
							}).done(function(resp) {
								console.log("확정완료");
								 $(this).attr("disabled","true"); 

							})
							
						}
						

					})

			/* 판매자에게 돈들어가기 , deal2 Y 변경 ,  */

			$(".buyCancel").on(
					"click",
					function() {

						console.log($(this).text());
						/*이름 찾기  */
						console.log($(this).closest("tr").find(
								'td:nth-child(6)').text());
						
						
						
						if (confirm("구매취소시 되돌릴 수 없습니다. 해당 구매를 취소하시겠습니까?")) {

							/* 취소시 tr 영역 통째로 날림 */

							$(this).closest("tr").remove();
							

							let iseq = $(this).closest("tr").find(
									'td:nth-child(6)').text();
							
							/* remainPoint */
						
							
							$.ajax({
								url : "/safeDeal/dealCancel",
								data : {
									iseq : iseq
								}
							}).done(function(resp) {
								console.log("취소완료");
								console.log(resp);
								
								$("#buyCount").text("구매내역 : " +${buyCount-1}+"건");
								$("#remainPoint").text(${dto.cash});
								

							})
						}
						
						
						
						
						

						/* 구매내역 건수 줄이기 + 환불 + db삭제 */

						/* $.ajax({
							
							url : "/safeDeal/cancel",
							data : { iseq : }
							
						})
						 */

					})

			$("#btn-talk").on(
					"click",
					function() {
						location.href = "/chat/talk?productName="
								+ hiddenProduct + "&productId="
								+ hiddenProductId + "&roomId=" + roomId;
					})

			/* $("#btn-like").css("background-color","blue"); */
		</script>


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


										<div class="like-right">

											<a href="javascript:void(0);" id="${wl.sellerID}"
												class="dellist on"> <input type=hidden id="iseq"
												value="${wl.iseq}">
												<button type=button value="X" class="deleteXL">
													<i class="far fa-window-close fa-2x"></i>
												</button> <%-- <a href="#" id="${wl.sellerID}" class="dellist on">
							 <input	type=hidden id="iseq" value="${wl.iseq }"> 
							 <input	type=button value="X" class="deleteXL"
								style="background-color: #24a6a4"> --%>

											</a>
										</div>
									</div>
									<!-- </a> -->
								</c:if>

							</c:forEach>
						</c:forEach>


						<script>
				$("#rmvStyle").removeAttr('style');

				//찜 해제
				$(".dellist")
						.on(
								"click",
								function() {
									if ($(this).hasClass('on')) {
										$
												.ajax({
													url : "/wishlist/deletewishlist",
													context : this,
													data : {
														seller : $(this).attr(
																"id"),
														iseq : $(this)
																.children()
																.val()
													},
													success : function(resp) {
														if (resp > 0) {

															$
																	.ajax(
																			{
																				url : "/wishlist/reMycount",
																				data : {
																					iseq : $(
																							this)
																							.children()
																							.val()
																				}

																			})
																	.done(
																			function(
																					resp3) {

																				/* 수정중 */
																				let like_count = document
																						.getElementById("like_count");
																				like_count.innerHTML = ("찜 내역 : " + resp3);

																			})

															$(this)
																	.closest(
																			".like-section")
																	.remove();

														} else {
															alert("삭제실패");
														}
													}
												})
									}

								})
			</script>

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
								<div class="following-right">

									<a href="#" fid="${f.id}" class=" btnFollow followed"> <input
										type=button value="팔로우" class="unfollow"
										style="background-color: #24a6a4">
									</a>

								</div>
							</div>
						</c:forEach>
					</div>

					<!-- 팔로워에 대한 스크립트 -->
					<script>
      
      /* 수정중 */
      

      $(".btnFollow").on(
              "click",
              function() {
              
                 if ($(this).hasClass('followed')) {
                    $.ajax({
                       url : "/follow/following",
                       context : this,
                       data : {
                          sellerID : $(this).attr("fid")
                       },
                       success : function(resp) {
                    	   
                          $(this).children('input.unfollow').val(
                                "언팔로우");
                          $(this).children('input.unfollow').css(
                                "background-color", "#ef4444");
                          $(this).removeClass('followed');
                          $(this).addClass('unfollow');
                          
                       }
                    })
                 }

                 else if ($(this).hasClass('unfollow')) {
                    $.ajax({
                       url : "/follow/following",
                       context : this,
                       data : {
                          sellerID : $(this).attr("fid")
                       },
                       success : function(resp) {
                          $(this).children('input.unfollow').val(
                                "팔로우");
                          $(this).children('input.unfollow').css(
                                "background-color", "#24a6a4");
                          $(this).removeClass('unfollow');
                          $(this).addClass('followed');
                       }
                    })
                 }
                 return false;
              })
      
      </script>

					<!-- 팔로우 -->
					<div class="tab-pane fade" id="nav-follower" role="tabpanel"
						aria-labelledby="nav-follower-tab">
						<div class="follower-top">팔로우 수 : ${followedCount }</div>
						<c:forEach var="j" items="${followedList }">
							<div class="follower-section">
								<div class="follower-left">
									<img src="${j.profile_image}">
								</div>
								<div class="follower-middle">${j.name }</div>
								<div class="follower-right">
									<a href="#" jid="${j.id}" class="jbtnFollow unfollowed"> <input
										type=button value="언팔로우" class="junfollow"
										style="background-color: #ef4444">
									</a>
								</div>
							</div>
						</c:forEach>
					</div>

					<script>
    //내가 팔로우한 사람들 목록
      $(".jbtnFollow").on(
            "click",
            function() {
               if ($(this).hasClass('unfollowed')) {
                  $.ajax({
                    url : "/follow/followed",
                     context : this,
                     data : {
                        sellerID : $(this).attr("jid")
                     },
                     success : function(resp) {
                        $(this).children('input.junfollow').val(
                              "팔로우");
                        $(this).children('input.junfollow').css(
                              "background-color", "#24a6a4");
                       $(this).removeClass('unfollowed');
                        $(this).addClass('follow');
                     }
                  })
               }

              else if ($(this).hasClass('follow')) {
                  $.ajax({
                     url : "/follow/followed",
                     context : this,
                     data : {
                        sellerID : $(this).attr("jid")
                    },
                    success : function(resp) {
                        $(this).children('input.junfollow').val(
                             "언팔로우");
                        $(this).children('input.junfollow').css(
                             "background-color", "#ef4444");
                        $(this).removeClass('follow');
                       $(this).addClass('unfollowed');
                    }
                  })
               }
               return false;
            })
      
      
      </script>
				</div>
			</section>
		</div>

	</main>
	<!-- footer -->
	<footer>
		<div class="footer-box">
			<span>만든이들 : 곽서호, 김동현 92, 김동현 93, 김동휘, 박시현, 배소현 </span><br> <span>CopyRight
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




</body>

</html>