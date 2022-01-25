<!DOCTYPE html>
<html lang="en">
<head>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>회원가입</title>
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
        <link rel="stylesheet" href="/css/join.css">
        <!-- 주소 API -->
         <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
      <style>
         img{
         width:100px;
         height:100px;
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
        <div class="div-wrap3">
        </div>
    </header>
    <main>
    <form action="/member/updatePw" method="get" >
        <div class="join-wrap">
            <div class="join-title">비밀번호 변경</div>
            <hr>
            아이디 : <input type=text name="id" value="${inputID }" readonly>
          <div class="mb-3">
            <label for="inputPw" class="form-label">새 비밀번호</label>
            <input type="text" class="form-control" id="inputPw" name="pw" placeholder="최소 한개의 문자, 한개의 숫자 , 한개의 특수 문자를 포함한 8~20자리"pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,20}$" required>
          </div>
          
            <div class="mb-3">
            <label for="inputPwAgain" class="form-label">새 비밀번호 확인</label>
              <input type="text" class="form-control" id="inputPwAgain" placeholder="비밀번호를 다시 입력하세요" required>
              <span id="checkpw"></span>
            </div>
          
          <div class="btnDiv">
            <button id="joinBtn" class="btn btn-lg btn-light" type="submit">변경완료</button>
            <button id="backBtn" class="btn btn-lg btn-light" type="button">뒤로가기</button>
          </div>
        </div>
        </form>
    </main>
    <footer>
        <div class="footer-box">
            <span>만든이들 : 곽서호, 김동현 92, 김동현 93, 김동휘, 박시현, 배소현 </span><br>
            <span>CopyRight 2022 @ ALL RIGHT RESERVED</span>
        </div>
    </footer>
    



<script>
     //비밀번호 일치 확인
      $("#inputPwAgain").on("keyup",function(){
         if($("#inputPw").val()==$("#inputPwAgain").val() && $("#inputPw").val()!=""){
            $("#checkpw").css("color","green");
            $("#checkpw").text("비밀번호가 일치합니다");
         }else if($("#inputPw").val()==""){
            $("#checkpw").css("color","red");
             $("#checkpw").text("비밀번호를 입력해주세요");
         }else if($("#inputPwAgain").val()==""){
            $("#checkpw").css("color","red");
             $("#checkpw").text("비밀번호확인을 입력해주세요");
         }
         else{
            $("#checkpw").css("color","pink");
            $("#checkpw").text("비밀번호가 틀립니다.");
         }
      })
       $("#inputPw").on("keyup",function(){
         if($("#inputPw").val()==$("#inputPwAgain").val()){
            $("#checkpw").css("color","green");
            $("#checkpw").text("비밀번호가 일치합니다");
         }else{
            $("#checkpw").css("color","pink");
            $("#checkpw").text("비밀번호가 틀립니다.");
         }
      }) 
      $("#backBtn").on("click",function(){
         location.href = "/member/findInfo";
      })
      
</script>
</body>
</html>