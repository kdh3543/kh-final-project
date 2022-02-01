<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>관리자페이지</title>
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
<!-- chart.js -->
<script
	src=https://cdn.jsdelivr.net/npm/chart.js@3.7.0/dist/chart.min.js></script>
<!-- CSS -->
<link rel="stylesheet" href="/css/font.css">
<link rel="stylesheet" href="/css/header.css">
<link rel="stylesheet" href="/css/footer.css">
<link rel="stylesheet" href="/css/admin/adminIndex.css">
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
	</header>
	<main>
		<div class="main-container">
			<div class="main-left-container">
				<div class="top-div">관리자페이지</div>
				<div class="middle-div">
					<button type="button" class="control-btn">회원관리</button>
					<button type="button" class="question-btn">1:1문의</button>
					<button type="button" class="report-btn">신고관리</button>
					<button type="button" class="sell-statics-btn">회원통계</button>
					<button type="button" class="sell-statics-btn">판매통계</button>
				</div>
			</div>
			<div class="main-right-container">
				<div class="control-page">
					<div class="control-top-div">회원관리</div>
					<div class="control-contents-div">
						<table>
							<tr>
								<th><input type="checkbox" id="checkAll">
								<th>번호
								<th>아이디
								<th>이름
								<th>우편번호
								<th>주소
								<th>상세주소
								<th>연락처
								<th>이메일
								<th>거래희망지역
							</tr>
						<c:forEach var="list" items="${list}" varStatus="status">
							<tr>
								<td><input type="checkbox" name="checkbox[]" class="checkbox${status.count}" value="${list.seq}">
								<td>${list.seq }
								<td>${list.id }
								<td>${list.name }
								<td>${list.zipcode }
								<td>${list.address1 }
								<td>${list.address2 }
								<td>${list.phone }
								<td>${list.email }
								<td>${list.prefer_location }
							</tr>
						</c:forEach>
						<tr>
							<td colspan="10">
							<button	 type="button" class="deleteBtn">회원탈퇴</button>
							<button   type="button" class="updateBtn">회원정보수정</button>
						</tr>
						</table>
					</div>
				</div>
				<div class="question-page">
					<div class="question-top-div">1:1문의 관리 페이지</div>
					<div class="question-contents-div">
						<table>
							<tr>
								<th>글번호
								<th>글제목
								<th>글쓴이
							</tr>
						</table>
					</div>
				</div>
				<div class="report-page">
					<div class="report-top-div">신고 페이지</div>
					<div class="report-contents-div">신고내용</div>
				</div>
				<div class="statistics-page">
					<div class="statistics-top-div">회원 통계</div>
					<div class="statistics-contents-div">
						<canvas id="myChart" width="300" height="300">가입추이</canvas>
						<script>
							const ctx = document.getElementById('myChart')
									.getContext('2d');
							const myChart = new Chart(ctx, {
								type : 'bar',
								data : {
									labels : [ 'Red', 'Blue', 'Yellow',
											'Green', 'Purple', 'Orange' ],
									datasets : [ {
										label : '# of Votes',
										data : [ 12, 19, 3, 5, 2, 3 ],
										backgroundColor : [
												'rgba(255, 99, 132, 0.2)',
												'rgba(54, 162, 235, 0.2)',
												'rgba(255, 206, 86, 0.2)',
												'rgba(75, 192, 192, 0.2)',
												'rgba(153, 102, 255, 0.2)',
												'rgba(255, 159, 64, 0.2)' ],
										borderColor : [
												'rgba(255, 99, 132, 1)',
												'rgba(54, 162, 235, 1)',
												'rgba(255, 206, 86, 1)',
												'rgba(75, 192, 192, 1)',
												'rgba(153, 102, 255, 1)',
												'rgba(255, 159, 64, 1)' ],
										borderWidth : 1
									} ]
								},
								options : {
									scales : {
										y : {
											beginAtZero : true
										}
									}
								}
							});
						</script>

					</div>
				</div>
			</div>
		</div>

	</main>
	<footer>
		<div class="footer-box">
			<span>만든이들 : 곽서호, 김동현 92, 김동현 93, 김동휘, 박시현, 베소현 </span><br> <span>CopyRight
				2022 @ ALL RIGHT RESERVED</span>
		</div>
	</footer>
	<script>
	
	// 페이지 변경 스크립트
		$(".control-btn").on("click", function() {
			$(".control-page").css("display", "block");
			$(".question-page").css("display", "none");
			$(".report-page").css("display", "none");
			$(".statistics-page").css("display", "none");
		})
		$(".question-btn").on("click", function() {
			$(".control-page").css("display", "none");
			$(".report-page").css("display", "none");
			$(".question-page").css("display", "block");
			$(".statistics-page").css("display", "none");
		});
		$(".report-btn").on("click", function() {
			$(".control-page").css("display", "none");
			$(".question-page").css("display", "none");
			$(".report-page").css("display", "block");
			$(".statistics-page").css("display", "none");
		})
		$(".sell-statics-btn").on("click", function() {
			$(".control-page").css("display", "none");
			$(".question-page").css("display", "none");
			$(".report-page").css("display", "none");
			$(".statistics-page").css("display", "block");
			
			
		})
		
	// checkbox 스크립트
	$("#checkAll").on("click",function(){
		if($(this).prop('checked')){
			$("input[type=checkbox]").prop("checked",true);
		}else{
			$("input[type=checkbox]").prop("checked",false);
		}
	})
	
	// 회원 탈퇴
	
	$(".deleteBtn").on("click",function(){
		$("input[name='checkbox[]']:checked").each(function(){
				var checkVal = $(this).val();
				
				if(checkVal != null){
					$.ajax({
						url:"/admin/leave",
						data:{seqNum:checkVal}
						
					}).done(function(resp){
						console.log(resp);
					});
				}
		})
	})
	// 회원 정보 수정 
	$(".updateBtn").on("click",function(){
		$("input[name='checkbox[]']:checked").each(function(){
			var checkVal = $(this).val();
			
			if(checkVal != null){
				$.ajax({
					url:"/admin/update",
					data:{seqNum:checkVal}
					
				}).done(function(resp){
					console.log(resp);
				});
			}
	})
	})
	</script>
</body>
</html>