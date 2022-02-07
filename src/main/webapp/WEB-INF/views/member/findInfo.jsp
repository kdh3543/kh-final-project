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
        <div class="main-wrap">
            <nav>
                <div class="nav nav-tabs" id="nav-tab" role="tablist">
                  <button class="nav-link active" id="nav-home-tab" data-bs-toggle="tab" data-bs-target="#nav-home" type="button" role="tab" aria-controls="nav-home" aria-selected="true">아이디 찾기</button>
                  <button class="nav-link" id="nav-profile-tab" data-bs-toggle="tab" data-bs-target="#nav-profile" type="button" role="tab" aria-controls="nav-profile" aria-selected="false">비밀번호 변경</button>
                </div>
              </nav>
              <div class="tab-content" id="nav-tabContent">
                <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
               <form action="/member/findID" method=get>
                    <div class="form-floating">
                        <input type="email" class="form-control" id="floatingInput" name="email" required>
                        <label for="floatingInput"> 가입할 때 입력했던 이메일 주소를 입력하세요.</label>
                    </div>
                    <div class="form-floating">
                        <input type="text" class="form-control" id="floatingPhone" name="phone" required>
                        <label for="floatingPhone">가입할 때 입력했던 전화번호를 입력하세요.</label>
                    </div>
                    <div class="findIdBtn">
                        <button id="findId" class=" btn btn-lg btn-light" type="submit">찾기</button><span>${dto.id }</span>
                    </div>
                    </form>
                </div>
                <c:choose>
                   <c:when test="${temp !=null }">
                        <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
                   <form action="/member/findPw" method="get">
                    <div class="form-floating">
                        <input type="text" class="form-control" name="inputID" value="${inputID }" readonly>
                        <label for="inputId">가입한 아이디를 입력하세요.</label>
                    </div>
                    <div class="form-floating">
                        <input type="email" class="form-control" value="${inputEmail }" readonly>
                        <label for="inputemail">가입할 때 입력했던 이메일 주소를 입력하세요.</label>
                    </div>
                  
                    
                    <!-- hidden 부분-->
                    
                    <div class="form-floating" id="codeDiv">
                        <input type="text" class="form-control" id="inputCode" placeholder="Password">
                        <label for="inputCode">전송된 인증번호를 입력하세요.</label>
                        <input type=hidden id="tempM" value="${temp }">
                        <button id="checkCode" class=" btn btn-lg btn-light" type="button">인증번호 확인</button>
                        <span id="changePw" style="visibility:hidden"><button id="changePw" class=" btn btn-lg btn-light" type="submit">비밀번호 변경하러 가기</button></span>
                    </div>
                    </form>
                    
                </div>
                   </c:when>
                   <c:otherwise>
                     <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
                <form action="/member/changePw" method=get>
                    <div class="form-floating">
                        <input type="text" class="form-control" name="inputID" placeholder="name@example.com" required>
                        <label for="inputId">가입한 아이디를 입력하세요.</label>
                    </div>
                    <div class="form-floating">
                        <input type="email" class="form-control" name="inputEmail" placeholder="" required>
                        <label for="inputemail">가입할 때 입력했던 이메일 주소를 입력하세요.</label>
                    </div>
                    <div class="findPwBtn">
                        <button id="findPw" class=" btn btn-lg btn-light" type="submit">인증번호 전송</button>
                    </div>
                    </form>
           
                    
                </div>
                   </c:otherwise>
                </c:choose>
                
              </div>
        </div>
    </main>
    <footer>
        <div class="footer-box">
            <span>만든이들 : 곽서호, 김동현 92, 김동현 93, 김동휘, 박시현, 배소현 </span><br>
            <span>CopyRight 2022 @ ALL RIGHT RESERVED</span>
        </div>
    </footer>
    <script>
    //ID찾기
    
   // 인증하기 버튼 눌렀을 때
   $("#checkCode").on("click",function(){
      
      
      
      
      if($("#inputCode").val() ==$("#tempM").val() ){ // 암호화된 키값과 입력한 값이 같을 때,
         
      $("#changePw").css("visibility","visible");
      //   location.href="/member/findPw";
      }else{
         alert("인증번호를 다시 확인해주세요.");
         
      }
   });
    </script>
</body>
</html>