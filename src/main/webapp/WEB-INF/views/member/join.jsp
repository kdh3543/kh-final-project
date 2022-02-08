<!DOCTYPE html>
<html lang="en">
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입</title>
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
<link rel="stylesheet" href="/css/header.css">
<link rel="stylesheet" href="/css/footer.css">
<!-- Custom styles for this template -->
<link rel="stylesheet" href="/css/member/join.css">
<!-- 주소 API -->
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
img {
	width: 100px;
	height: 100px;
}

/* input Type password 보이게 하는 거  */
input[type=password] {
	font-family: "굴림";
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
					<a href="/"><img src="/imgs/sideLogo2.png" class="logoImg"></a>
				</div>
			</div>
		</div>
		<div class="div-wrap3"></div>
	</header>
	<main>
		<form action="/member/signup" method="post"
			enctype="multipart/form-data">
			<div class="join-wrap">
				<div class="join-title">회원가입</div>
				<hr>
				<div class="mb-3">
					<label for="imgfile" class="del-button img-up"> 
					<input type="file" id=imgfile name="file" required
						accept=".jpg, .png, .jpeg, .gif" style="display: none;"> <img
						src="/imgs/회원가입2 (2).png" id="profile"> 프로필 사진 등록 
						<a class="esential-a">*필수항목</a>

					</label>
				</div>




				<div class="mb-3">
					<label for="inputId" class="form-label">아이디</label> <input
						type="text" class="form-control" id="inputId" name="id"
						placeholder="영문대소문자,숫자 조합의 6~15자리" pattern="^([A-Za-z0-9]){6,15}$"
						required> <span id="checkid"></span>
				</div>
				<div class="mb-3">
					<label for="inputPw" class="form-label">비밀번호</label> <input
						type="password" class="form-control" id="inputPw" name="pw"
						placeholder="최소 한개의 문자, 한개의 숫자 , 한개의 특수 문자를 포함한 8~20자리"
						pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,20}$"
						required>
				</div>

				<div class="mb-3">
					<label for="inputPwAgain" class="form-label">비밀번호 확인</label> <input
						type="password" class="form-control" id="inputPwAgain"
						placeholder="비밀번호를 다시 입력하세요" required> <span id="checkpw"></span>
				</div>

				<div class="mb-3">
					<label for="inputName" class="form-label">이름</label> <input
						type="text" class="form-control" id="inputName" name="name"
						placeholder="이름을 입력하세요" pattern="^[가-힣]{2,5}$" required>
				</div>


				<div class="addressDiv mb-3">
					<label for="inputAddress1" class="form-label">주소</label> <input
						type="text" class="form-control mb-2" id="inputAddress1"
						name="address1" placeholder="" required>
					<button type="button" class="btn btn-primary mb-1" id="findAddress">주소찾기</button>
				</div>
				<div class="mb-3">
					<label for="inputZipcode" class="form-label">우편번호</label> <input
						type="text" class="form-control" id="inputZipcode" name="zipcode"
						placeholder="우편번호를 검색하세요." required>
				</div>
				<div class="mb-3">
					<label for="inputAddress2" class="form-label">상세주소</label> <input
						type="text" class="form-control" id="inputAddress2"
						name="address2" placeholder="상세주소를 입력하세요" required>
				</div>
				<div class="mb-3">
					<label for="inputPhone" class="form-label">연락처</label> <input
						type="text" class="form-control" id="inputPhone" name="phone"
						placeholder="연락처를 입력하세요 01x-xxxx-xxxx"
						pattern="^01(0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$" required>
				</div>
				<div class="mb-3">
					<label for="inputEmail" class="form-label">이메일</label> <input
						type="email" class="form-control" id="inputEmail" name="email"
						placeholder="example@xxxxx.com"
						pattern="^[a-z0-9_+.-]+@([a-z0-9-]+\.)+com$" required>
				</div>
				<div class="mb-3">
					<label for="deallocation" class="form-label">거래희망지역</label> <input
						type="text" class="form-control" id="location"
						name="prefer_location" placeholder="선호하는 거래 지역이 있다면 선택해주세요"
						required>
				</div>
				<hr class="mb-4">
				<div class="custom-control custom-checkbox">
					<input type="checkbox" class="custom-control-input" id="aggrement"
						required> <label class="custom-control-label"
						for="aggrement">개인정보 수집 및 이용에 동의합니다.</label>
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
			<span>만든이들 : 곽서호, 김동현 92, 김동현 93, 김동휘, 박시현, 배소현 </span><br> <span>CopyRight
				2022 @ ALL RIGHT RESERVED</span>
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
    //id 중복 확인 & 사용가능 여부 확인
    $(function(){
        $("#inputId").on("input",function(){
             let id = document.getElementById("inputId").value;
                let idregex = /^([A-Za-z0-9]){6,15}$/;
                let result = idregex.test(id);
                if(!result){
                   $("#checkid").css("color","red");
                 $("#checkid").text("잘못된 ID 입니다.");
                   
                   return false;
                }else{
                     $("#checkid").css("color","blue");
                      $("#checkid").text("사용가능한 ID형식 입니다.");
                }
           $.ajax({
              url:"/member/idCheck",
              data:{id:$("#inputId").val()}
           }).done(function(resp){
              console.log(resp);
              if(resp == "1"){
                 $("#checkid").css("color","pink");
                 $("#checkid").text("이미 사용중인 ID 입니다.");
              }else{
                 $("#checkid").css("color","green");
                 $("#checkid").text("사용 가능한 ID 입니다.");
              }
           });
        });
     })
      
      

         
      
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
      
      //이미지 삽입 후 바뀜
$(document).ready(function(){
   $("#imgfile").change(function(event){
      var tmppath=URL.createObjectURL(event.target.files[0]);
      $('#profile').attr('src',tmppath);
   });
})
     // 뒤로가기 버튼
     $("#backBtn").on("click",function(){
    	window.history.back(); 
     });
    
	// 아이디 검사
    $("#joinBtn").on("click",function(){
        let id = $("#checkid").text();
        if(id=="사용 가능한 ID 입니다."){
           return true;
        }else{
           alert("사용불가능한 아이디입니다.");
           return false;
        }
     });
	// 사진 업로드 
	$(".form-control").on("click",function(){
        var imgfile = $('#imgfile').val();
         var fileForm = /(.*?)\.(jpg|jpeg|png|gif|bmp|pdf)$/;

         if($('#imgfile').val() == "") {
            alert("프로필사진은 필수입니다");
             $("#imgfile").focus();
             return false;
         }

         if(imgfile != "" && imgfile != null) {
            
             
             if(!imgfile.match(fileForm)) {
                alert("이미지 파일만 업로드 가능");
                 return false;
             }
         }

     });
     
</script>
</body>
</html>