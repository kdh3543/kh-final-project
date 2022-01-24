<!DOCTYPE html>
<html lang="en">
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
    <link rel="stylesheet" href="/css/member/findInfo.css">
    <style>
    	#signIn:hover{
    		background-color:#24A6A4;
    	}
    	#findMyInfo:hover{
    		background-color:#24A6A4;
    	}
    </style>
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
                    <i class="fas fa-seedling"></i>
                    <a href="/">00마켓</a>
                </div>
            </div>
        </div>
    </header>
    <main>
       <div class="join-wrap">
            
         <c:choose>
         <c:when test="${result >0 }">
         <div class="mb-3">
            <label for="deallocation" class="form-label">고객님의 아이디는</label>
           	<span>${dto.id }입니다</span>
          </div>
         </c:when>
         <c:otherwise>
         <div class="mb-3">
            <label for="deallocation" class="form-label">고객님의 아이디를 찾지 못했습니다. 정확한 정보를 입력해주세요</label>	
          </div>
         </c:otherwise>
         </c:choose>
         
          
           <div class="buttons" id="btns">
                    <button id="signIn" class=" btn btn-lg btn-light" type="button">로그인하러 가기</button>
                    <button id="findMyInfo" class=" btn btn-lg btn-light" type="button">아이디/비밀번호 찾기</button>
                </div>
                </div>
          
          
          
    </main>
    <footer>
        <div class="footer-box">
            <span>만든이들 : 곽서호, 김동현 92, 김동현 93, 김동휘, 박시현, 베소현 </span><br>
            <span>CopyRight 2022 @ ALL RIGHT RESERVED</span>
        </div>
    </footer>
    <script>
  	$("#signIn").on("click",function(){
  		location.href="/signIn";
  	})
  	$("#findMyInfo").on("click",function(){
  		location.href="/findInfo";
  	})

    </script>
</body>
</html>