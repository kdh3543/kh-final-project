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
											<a class="dropdown-item" id="search-dropdown"
												href="javascript:void(0);" style="text-align: center">
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
												</nav> <!-- 최근검색어 -->
												<div class="tab-content" id="nav-tabContent">
													<div class="tab-pane fade show active" id="nav-home"
														role="tabpanel" aria-labelledby="nav-home-tab">

														<!-- 내용 채워넣기 -->
														<div id=text></div>
														<button type=button id=delBtn class="dropdown-item"
															style="display: inline">
															<b><h6>검색어 전체삭제</h6></b>
														</button>


													</div>
													<!--  인기검색어-->
													<div class="tab-pane fade" id="nav-contact" role="tabpanel"
														aria-labelledby="nav-contact-tab"></div>

													<div class="tab-pane fade" id="nav-profile" role="tabpanel"
														aria-labelledby="nav-profile-tab">
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
					<!-- ajax로 데이터 보내기 위한 코드-->
					<input type="hidden" id="iseq" value="${i.iseq }">
					<div class="productPrice">${i.price}원</div>
					<div class="product-status">
						<div class="status-like" id='like_count'>찜 : ${wishCount}</div>
						<div class="status-view">조회수 : ${i.view_cnt}</div>
						<div class="status-view">작성일 : ${i.detailDate}</div>
					</div>


				</c:forEach>
				<div class="product-detail">




					<div class="detail-report">
						<!-- Button trigger modal -->


						<c:choose>
							<c:when test="${loginID==null}">
								<button type="button" class="btn btn-primary"
									data-bs-toggle="modal" data-bs-target="#staticBackdrop"
									id="reportBtn" disabled>
									<i class="fas fa-bell"></i>신고하기
								</button>

							</c:when>

							<c:when test="${ilist[0].iseq==rdto.iseq}">
								<button type="button" class="btn btn-primary"
									data-bs-toggle="modal" data-bs-target="#staticBackdrop"
									id="reportBtn" disabled>
									<i class="fas fa-bell"></i>신고중
								</button>

							</c:when>



							<c:otherwise>
								<button type="button" class="btn btn-primary"
									data-bs-toggle="modal" data-bs-target="#staticBackdrop"
									id="reportBtn">
									<i class="fas fa-bell"></i>신고하기
								</button>
							</c:otherwise>
						</c:choose>



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

									<!-- required 하나 붙임 .1개 필수선택 -->
									<form action="/report/itemsReport" method="post">

										<input type=hidden name="buyerid" value="${loginID}">
										<input type=hidden name="sellerid"
											value="${ilist[0].sellerID}"> <input type=hidden
											name="iseq" value="${ilist[0].iseq}">


										<div class="modal-body">
											<div class="form-check">
												<input class="form-check-input" type="radio"
													value="광고(상점 및 타사이트 홍보, 상품도배)" name="reason"
													id="flexRadioDefault1" required> <label
													class="form-check-label" for="flexRadioDefault1">
													광고(상점 및 타사이트 홍보, 상품도배) </label>
											</div>
											<div class="form-check">
												<input class="form-check-input" type="radio"
													value="상품정보 부정확(상품명, 이미지, 가격, 태그 등)" name="reason"
													id="flexCheckDefault2" class="form-check-label"
													for="flexCheckDefault2"> 상품정보 부정확(상품명, 이미지, 가격, 태그
												등) </label>
											</div>
											<div class="form-check">
												<input class="form-check-input" type="radio" name="reason"
													id="flexRadioDefault3" value="거래 금지 품목"> <label
													class="form-check-label" for="flexRadioDefault3">거래
													금지 품목 </label>
											</div>
											<div class="form-check">
												<input class="form-check-input" type="radio" name="reason"
													id="flexRadioDefault4" value="사기의심(외부채널 유도)"> <label
													class="form-check-label" for="flexRadioDefault4">
													사기의심(외부채널 유도) </label>
											</div>
											<!-- <div class="form-check">
											<input class="form-check-input" type="radio"
												name="flexRadioDefault" id="flexRdioDefault5" value="r5">
											<label class="form-check-label" for="flexRadioDefault5">
												기타(사유) </label> <input type="text" placeholder="사유를 입력해주세요."
												class="reasonInput" disabled>
										</div> -->


											<!-- 	<script>
										  $("input:radio[name=flexRadioDefault]").click(function(){
											  if($("#flexRdioDefault5:checked").val() =="r5"){
													$(".reasonInput").attr("disabled",false);
												}
										  });
										</script> -->

										</div>

										<div class="modal-footer">
											<button type="button" class="btn btn-secondary"
												data-bs-dismiss="modal">닫기</button>
											<button type="submit" id="confirmBtn" class="btn btn-primary"
												id="reportSubmitBtn">전송하기</button>
										</div>
									</form>

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
								<input type="button" id="btn-like"
									class="btn btn-lg btn-light choose" value="찜">
								<!--  sellerID정보 ajax로 보내기-->
								<input type=hidden id="sellerID" value="${i.sellerID}">
								<button id="btn-talk" class="btn btn-lg btn-light">연락하기</button>
								<button id="btn-buy" class="btn btn-lg btn-light">바로구매</button>
							</c:otherwise>
						</c:choose>
					</div>

				</c:forEach>
				<!-- 진행중 -->
			</div>

		</div>

		<!-- 서호 찜 부분-->
		<!-- 찜 버튼 기능 구현 추가 -->
		<script>
   
   $("#btn-like").on(
               "click",
               function() {
            	   if(${loginID==null}){
            		   alert("로그인후 사용 가능한 기능입니다.");
            		   return false;
            	   }
                  if(${loginID!=null}){
                  
                   $.ajax({
                           url:"/wishlist/checkwishlist",
                           data:{seller:$("#sellerID").val(),iseq:$("#iseq").val()}
                        }).done(function(resp){
                           if(resp>0){
                             let readd = $("#btn-like").val();
                             console.log(readd);
                             if(readd=="찜해제"){
                                $.ajax({
                                    url:"/wishlist/deletewishlist",
                                    data:{seller:$("#sellerID").val(),iseq:$("#iseq").val()}
                                 }).done(function(resp2){
                                    if(resp2>0){
                                       $("#btn-like").val("찜하기");
                                         $("#btn-like").css("background-color","blue");
                                         
                                         /*찜 recount */
                                         
                                         $.ajax({
                                        	 url: "/wishlist/reCount",
                                        	data: {iseq:$("#iseq").val()}
                                         
                                         }).done(function(resp3){
                                        	
                                        	 let like_count = document.getElementById("like_count");
                                        	 like_count.innerHTML = ("찜 : " +resp3);
                                         
                                         })
                                         
                                    }else{
                                    }
                                 });
                             }
                            
                           }else{
                            $.ajax({
                                 url:"/wishlist/addwishlist",
                                 data:{seller:$("#sellerID").val(),iseq:$("#iseq").val()}
                              }).done(function(resp1){
                                 if(resp1>0){
                                    $("#btn-like").val("찜해제");
                                      $("#btn-like").css("background-color","red");
                                      
                                      /*찜 recount  */
                                      $.ajax({
                                     	 url: "/wishlist/reCount",
                                     	data: {iseq:$("#iseq").val()}
                                      
                                      }).done(function(resp3){
                                     	
                                     	 let like_count = document.getElementById("like_count");
                                     	 like_count.innerHTML = ("찜 : " +resp3);
                                      
                                      })
                                      
                                      
                                 }else{
                                 }
                              });
                           }
                        });
                  }else{
                  }
                     });
   
   window.onload=function(){
      
      $.ajax({
            url:"/wishlist/checkwishlist",
            data:{seller:$("#sellerID").val(),iseq:$("#iseq").val()}
         }).done(function(resp){
            if(resp>0){
               $("#btn-like").val("찜해제");
                 $("#btn-like").css("background-color","red");
            }else{
               $("#btn-like").val("찜하기");
                 $("#btn-like").css("background-color","blue");
            }
         });
      
      
      
      
   }

   </script>

		<!--  동현이형 -->
		<input type=hidden value="${ilist[0].name}" id="hiddenProduct">
		<input type=hidden value="${ilist[0].iseq}" id="hiddenProductId">
		<script>
		let hiddenProduct = $("#hiddenProduct").val();
        let hiddenProductId = $("#hiddenProductId").val();
           let roomId=0;
        $("#btn-talk").on("click",function(){
        	if(${loginID ==null}){
				 alert("로그인후 사용 가능한 기능입니다.");
				 return false;
			 }else{
           location.href = "/chat/talk?productName="+hiddenProduct+"&productId="+hiddenProductId+"&roomId="+roomId;
			 }
        })
        </script>


		<!-- 동현이형 /// -->
		<script>
		
		/* 만약에 deal2 or buyerID != 면 거래중 상품 표시 */
		  $(document).ready(function(){
			if(${ilist[0].deal2 != 'N' }){
				$("#btn-buy").text("거래중");
				
			}
			  
			  
		  });
		      

        <!-- 바로구매 버튼을 눌렀을 때의 script -->
        	$("#btn-buy").on("click",function(){
        		
        		
        		if(${loginID ==null}){
   				 alert("로그인후 사용 가능한 기능입니다.");
   				 return false;
   			 }else{
        		
        		if($("#btn-buy").text()=="거래중"){
        			alert("이미 거래중인 상품입니다.");
        		}else{
        			location.href = "/items/itemsOrder?iseq=${ilist[0].iseq}";
        		}
   			 }
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
						<button class="nav-link active" id="nav-info-tab"
							data-bs-toggle="tab" data-bs-target="#nav-info" type="button"
							role="tab" aria-controls="nav-info" aria-selected="true">상품정보</button>
						<!--  <button class="nav-link" id="nav-ask-tab" data-bs-toggle="tab" data-bs-target="#nav-ask"
                            type="button" role="tab" aria-controls="nav-ask" aria-selected="false">상품문의</button>
                        <button class="nav-link" id="nav-purchase-tab" data-bs-toggle="tab"
                            data-bs-target="#nav-purchase" type="button" role="tab" aria-controls="nav-purchase"
                            aria-selected="false">????</button> -->
					</div>
				</nav>
				<div class="tab-content" id="nav-tabContent">
					<!-- 상품정보 -->


					<div class="tab-pane fade show active" id="nav-info"
						role="tabpanel" aria-labelledby="nav-info-tab">
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
												${i.category}
											</div>
										</div>
										<div class="middle-tag">
											<div class="tag-title">태그</div>
											<div class="tagy-contents">${i.tag}</div>
										</div>
									</div>

								</c:forEach>





								<!-- 시현이형 부분 -->
								<!-- 상품문의 -->
								<div class="write-title-div">상품문의</div>
								<div class="product-question">
									<form action="/items/QNAWriteProc" method="post"
										enctype="multipart/form-data">
										<div class="write-div">
											<textarea class="write-textarea" placeholder="상품 문의를 작성해주세요."
												name="contents" id="contents"></textarea>
										</div>
										<div class="write-bottom-div">
											<div id="write_cnt">(0/100)</div>
											<button type="submit" class="writeBtn" id="writeBtn">등록</button>
											<c:forEach var="i" items="${ilist}" varStatus="status">
												<input type="hidden" name="iseq" value="${i.iseq}">
											</c:forEach>
										</div>
									</form>
									<script>
								$(document).ready(function(){
									$('.write-textarea').on('keyup',function(){
										$("#write_cnt").html("("+$(this).val().length+" /100)");
										
										if($(this).val().length > 100){
											$(this).val($(this).val().substring(0,100));
											$("#write_cnt").html("(100/100)");
										}
									});
								});
								</script>

									<c:forEach var="q" items="${qlist}" varStatus="status">
										<div class="questionList">

											<div class="listWriter">${q.writer}</div>

											<div class="listContents">${q.contents}</div>

											<div class="listDate">${q.parsed_date}</div>
											<c:if test="${q.writer == loginID}">
												<div class="btn-group">
													<button type="button" class="btn btn-secondary-light"
														data-bs-toggle="dropdown" aria-expanded="false">
														<i class="fas fa-ellipsis-v fa-1x"></i>
													</button>
													<ul class="dropdown-menu">

														<!-- Dropdown menu links -->
														<li>
															<h6 class="dropdown-header">메뉴</h6>
														</li>
														<li><a class="dropdown-item" id="deleteQNA"
															href="/items/deleteQNAProc?qseq=${q.items_qna_seq}&iseq=${q.iseq}">삭제</a>
														</li>
													</ul>
												</div>
											</c:if>

										</div>
									</c:forEach>
								</div>
							</div>

							<script>
							$("#writeBtn").on("click",function(){
								
								if(${loginID ==null}){
									alert("로그인 후 이용가능합니다.");
									return false;
								}else{
									
									if($("#contents").val()==""){
										
										alert("내용을 입력해주세요.");
										return false;
									}
								}
								
							})
								
							
							</script>





							<!-- 상품문의 -->
							<div class="product-section2">


								<div class="shop-info-title">상점정보</div>

								<!-- 수정중 -->

								<c:choose>
									<c:when test="${mdto.id==loginID}">
										<a href="/items/myPage">
											<div class="shop-info-div">
												<div class="info-left-div">
													<!-- <i class="fas fa-camera fa-1x"></i> -->
													<!-- 수정중 -->
													<img src="${mdto.profile_image}"
														style="max-width: 80px; max-height: 80px;">
												</div>
												<div class="info-right-div">
													<div class="right-div-title">${mdto.id}</div>
													<div class="right-div-contents">
														<span>상품 : ${detailICount} </span>| <span>팔로워 1</span>
													</div>
												</div>
											</div>
										</a>
									</c:when>
									<c:otherwise>
										<a href="/items/otherPage?id=${mdto.id}">
											<div class="shop-info-div">
												<div class="info-left-div">
													<!-- <i class="fas fa-camera fa-1x"></i> -->
													<!-- 수정중 -->
													<img src="${mdto.profile_image}"
														style="max-width: 80px; max-height: 80px;">
												</div>
												<div class="info-right-div">
													<div class="right-div-title">${mdto.id}</div>
													<div class="right-div-contents">
														<span>상품 : ${detailICount} </span>| <span>팔로워 1</span>
													</div>
												</div>
											</div>
										</a>

									</c:otherwise>
								</c:choose>


								<div class="follow-btn-div">
									<button type="button" id="followBtn" class="followBtn">
										<i class="fas fa-user-plus"></i> <span id="followInner">팔로우</span>
									</button>

									<input type=hidden id="mdtoid" value="${mdto.id}"> <input
										type=hidden id="loginid" value="${loginID}">
								</div>

								<script>
								/*수정중  */
								   
   $(document).ready(function(){
      let sellerID = $("#mdtoid").val();
		 let followingID = $("#loginid").val();
	   $.ajax({
           url:"/follow/detailFCheck",
           data:{sellerID:sellerID,followingID: followingID}
         }).done(function(resp){
	            if(resp==1){
	            	 $("#followInner").text("언팔로우");
	            	 $("#followBtn").css({"background-color":"#f8d200","border":"none"});
	            }else{
	            	 $("#followInner").text("팔로우");
	            	 $("#followBtn").css("background-color","#24a6a4");
	            }
	         });
      
   });
								</script>
								<script>	
								
								
								 $("#followBtn").on("click",function(){
									 
									if(${loginID ==null}){
										 alert("로그인후 사용 가능한 기능입니다.");
										 return false;
									 }else if(${loginID == ilist[0].sellerID}){
											alert("본인 아이디 입니다.");
											return false;
									 }else if(${loginID != ilist[0].sellerID}){
										 
									 let followInnerVal =  $("#followInner").text();
									 if(confirm(followInnerVal+" 하시겠습니까?")){
										 
										 let sellerID = $("#mdtoid").val();
										 console.log(sellerID);
										 let followingID = $("#loginid").val();
										 console.log(followingID);
										 
										 
										 $.ajax({
									            url:"/follow/detailFollow",
									            data:{sellerID:sellerID,followingID: followingID}
									         }).done(function(resp){
									            if(resp==2){
									            	 $("#followInner").text("언팔로우");
									            	 $("#followBtn").css({"background-color":"#f8d200","border":"none"});
									            }else{
									            	 $("#followInner").text("팔로우");
									            	 $("#followBtn").css("background-color","#24a6a4");
									            }

									         });								

									 }
										
									 }
									
									 })
								 
								      
								</script>


								<div class="shop-info-images">
									<c:forEach var="di" items="${detailIlist}" varStatus="statusDI">
										<c:forEach var="df" items="${detailFlist}"
											varStatus="statusDF">

											<c:if test="${di.iseq eq df.parentSeq }">
												<c:if test="${statusDI.index <3}">


													<a style="text-decoration: none;' "
														href="/items/itemsDetail?iseq=${di.iseq}"><img
														src="${df.sysName}"></a>
												</c:if>


											</c:if>
										</c:forEach>

									</c:forEach>

								</div>
								<br>
	
								<div class="more-btn-div">
								<a href="/items/otherPage?id=${mdto.id}">
									<button type="button" class="moreBtn">${detailICount}개의
										상품 더보기 ></button>
										</a>
										
								</div>
								
								<!-- <div class="shop-info-review">
									<div class="review-title-div">상점후기</div>
									<div class="review-title-contents">
										<div class="review-contents-left">
											등록된 후기가 없습니다.<br>첫 후기를 등록해보세요!
										</div>
										<div class="review-contents-right">
											<button type="button" class="reviewBtn">후기작성</button>
										</div>
									</div>
								</div> -->
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
			<span>만든이들 : 곽서호, 김동현 92, 김동현 93, 김동휘, 박시현, 배소현 </span><br> <span>CopyRight
				2022 @ ALL RIGHT RESERVED</span>
		</div>
	</footer>


</body>
</html>