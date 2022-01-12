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
        <link rel="stylesheet" href="/css/join.css">
        <!-- 주소 API -->
         <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

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
    <form action="/" method="get">
        <div class="join-wrap">
            <div class="join-title">회원가입</div>
            <hr>
        <div class="mb-3">
            <label for="inputId" class="form-label">아이디</label>
            <input type="text" class="form-control" id="inputId" placeholder="영문대소문자,숫자 조합의 6~15자리" pattern="^([A-Za-z0-9]){6,15}$" required>
            <span id="checkid"></span>
          </div>
          <div class="mb-3">
            <label for="inputPw" class="form-label">비밀번호</label>
            <input type="password" class="form-control" id="inputPw" placeholder="최소 하나의 문자, 하나의 숫자 및 하나의 특수 문자를 포함한 8~20자리"pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,20}$" required>
          </div>
          <form class="row g-3">
            <div class="mb-3">
            <label for="inputPwAgain" class="form-label">비밀번호 확인</label>
              <input type="password" class="form-control" id="inputPwAgain" placeholder="비밀번호를 다시 입력하세요" required>
            </div>
          </form>
          <div class="mb-3">
            <label for="inputName" class="form-label">이름</label>
            <input type="text" class="form-control" id="inputName" placeholder="이름을 입력하세요" pattern="^[가-힣]{2,5}$" required>
          </div>
          <div class="mb-3">
            <label for="inputZipcode" class="form-label">우편번호</label>
            <input type="text" class="form-control" id="inputZipcode" placeholder="우편번호를 검색하세요." required>
          </div>
          <div class="addressDiv mb-3">
            <label for="inputAddress1" class="form-label">주소</label>
            <input type="text" class="form-control mb-2" id="inputAddress1" placeholder="" required>
            <button type="button" class="btn btn-primary mb-1" id="findAddress">주소찾기</button>
        </div>
          <div class="mb-3">
            <label for="inputAddress2" class="form-label">상세주소</label>
            <input type="text" class="form-control" id="inputAddress2" placeholder="상세주소를 입력하세요" required>
          </div>
          <div class="mb-3">
            <label for="inputPhone" class="form-label">연락처</label>
            <input type="text" class="form-control" id="inputPhone" placeholder="연락처를 입력하세요 01x-xxxx-xxxx" pattern="^01(0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$" required>
          </div>
          <div class="mb-3">
            <label for="inputEmail" class="form-label">이메일</label>
            <input type="email" class="form-control" id="inputEmail" placeholder="name@example.com" pattern="^[a-z0-9_+.-]+@([a-z0-9-]+\.)+com$" required>
          </div>
          <div class="btnDiv">
            <button id="joinBtn" class="btn btn-lg btn-light" type="submit">회원가입</button>
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
    //주소지 값 자동 추가해주는 함수
    document.getElementById("findAddress").onclick = function(){
        new daum.Postcode({
            oncomplete: function(data) {
                document.getElementById('inputZipcode').value = data.zonecode;
                	document.getElementById("inputAddress1").value = data.roadAddress;
                	 document.getElementById("inputAddress1").value = data.jibunAddress;
            }  
        }).open();
    }
    
    $(function(){
        $("#inputId").on("input",function(){
             let id = document.getElementById("inputId").value;
                let idregex = /^([A-Za-z0-9]){6,15}$/;
                let result = idregex.test(id);
                if(!result){
                   $("#checkid").css("color","red");
                 $("#checkid").text("잘못된 ID 입니다.");
                   
                   return false;
                }
           $.ajax({
              url:"/member/idCheck",
              data:{id:$("#inputId").val()}
           }).done(function(resp){
              if(resp == "true"){
                 $("#checkid").css("color","pink");
                 $("#checkid").text("이미 사용중인 ID 입니다.");
              }else{
                 $("#checkid").css("color","green");
                 $("#checkid").text("사용 가능한 ID 입니다.");
              }
           });
        });
     })
      
      //닉네임 중복확인
      $(function(){
        $("#nickname").on("input",function(){
            let nickname = document.getElementById("nickname").value;
                let nickregex = /^[ㄱ-ㅎ|가-힣|a-z|A-Z|0-9|]{3,10}$/;
                let result = nickregex.test(nickname);
                if(!result){
                   $("#checkResultN").css("color","red");
                 $("#checkResultN").text("잘못된 닉네임 입니다.");
                   
                   return false;
                }
           $.ajax({
              url:"/nicknameCheck.mem",
              data:{nn:$("#nickname").val()}
           }).done(function(resp){
              if(resp == "true"){
                 $("#checkResultN").css("color","pink");
                 $("#checkResultN").text("이미 사용중인 닉네임 입니다.");
              }else{
                 $("#checkResultN").css("color","dodgerblue");
                 $("#checkResultN").text("사용 가능한 닉네임 입니다.");
              }
           });
        });
     })
      

         
      
     //비밀번호확인
      $("#cpw").on("keyup",function(){
         if($("#pw").val()==$("#cpw").val()){
            $("#checkpw").css("color","green");
            $("#checkpw").text("비밀번호가 일치합니다");
         }else{
            $("#checkpw").css("color","pink");
            $("#checkpw").text("비밀번호가 틀립니다.");
         }
      })
        $("#input-file").on("change",function(){
        let file = this.files[0];
        if (file) {
            $("#pho").html("<img class='w-20 h-20' viewBox='0 0 20 20' src = "+URL.createObjectURL(file)+">");
          }
        })

    
</script>
</body>
</html>