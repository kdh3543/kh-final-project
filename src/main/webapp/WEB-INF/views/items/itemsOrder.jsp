<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>아이디/비밀번호 찾기</title>
    <!-- fontawesome-->
    <script src="https://kit.fontawesome.com/7d7ec2f3ed.js" crossorigin="anonymous"></script>
    <!-- Jquery-->
    <script src="https://code.jquery.com/jquery-3.6.0.js"
        integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    <!-- bootstrap-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
    <!-- CSS -->
    <link rel="stylesheet" href="/css/font.css">
    <link rel="stylesheet" href="/css/header.css">
    <link rel="stylesheet" href="/css/footer.css">
      <!-- Custom styles for this template -->
    <link rel="stylesheet" href="/css/items/itemsOrder.css">
</head>
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
		<div class="container-div">

			<div class="back-div">
				<button type="button" id="back">
					<i class="fas fa-undo">돌아가기</i>
				</button>
			</div>
			<div class="items-div">
				<div class="img-container">
				<img src="/imgs/200Pic.png">
				</div>
				<div class="items-contents">
					<div>상품가격</div>
					<div>상품명</div>
				</div>
			</div>

			<div class="point-div">
				<div class="point-title-div">00 포인트</div>
				<div class="point-contents">
					<input type="text" placeholder="0">
					<button type="button">전액사용</button>
				</div>
				<span>사용 가능한 00 포인트</span>


			</div>
			<div class="order-div">
			<div class="order-title">결제금액 </div>
			<div class="order-contents">
				<div class="itemsprice-div">
					<div>상품금액</div>
					<div>70000원</div>
				</div>
				<div class="fees-div">
					<div>정산 수수료</div>
					<div>
					<span>70000</span>
					<span>원</span>
					</div>
				</div>
				<div class="payprice-div">
					<div>결제 금액</div>
					<div>
					<span>70000</span>
					<span>원</span>
					</div>
				</div>
				<div class="usingpoint-div">
					<div>포인트 사용</div>
					<div>
					<span>70000</span>
					<span>원</span>
					</div>
				</div>
				<div class="final-div">
					<div> 총 결제 금액</div>
					<div>
					<span>70000</span>
					<span>원</span>
					</div>
				</div>
			</div>
			</div>
				<div class="payment-div">
				<div class="paymemnt-title-div">결제수단</div>
					<div class="payment-contents-div">
					<input type="radio"> 계좌이체
					</div>
				</div>
					<div class="button-div">
					<input type="button" value="결제하기">
				</div>

		</div>
	</main>
	<footer>
		<div class="footer-box">
			<span>만든이들 : 곽서호, 김동현 92, 김동현 93, 김동휘, 박시현, 베소현 </span><br> <span>CopyRight
				2022 @ ALL RIGHT RESERVED</span>
		</div>
	</footer>
</body>
</html>