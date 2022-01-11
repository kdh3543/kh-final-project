<!DOCTYPE html>
<html lang="en">
<head>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
    <link rel="stylesheet" href="/css/findInfo.css">
</head>
<body>
    <header>
        <div class="header_Container">
            <ul class="header_list">
                <li><a href="signin.jsp">로그인</a></li>
                <li><a href="join.jsp">회원가입</a></li>
            </ul>
        </div>
        <div class="div-wrap">
            <div class="nav_div">
                <div class="logo">
                    <i class="fas fa-seedling"></i>
                    <a href="index.jsp">00마켓</a>
                </div>
            </div>
        </div>
    </header>
    <main>
        <div class="main-wrap">
            <nav>
                <div class="nav nav-tabs" id="nav-tab" role="tablist">
                  <button class="nav-link active" id="nav-home-tab" data-bs-toggle="tab" data-bs-target="#nav-home" type="button" role="tab" aria-controls="nav-home" aria-selected="true">아이디 찾기</button>
                  <button class="nav-link" id="nav-profile-tab" data-bs-toggle="tab" data-bs-target="#nav-profile" type="button" role="tab" aria-controls="nav-profile" aria-selected="false">비밀번호 찾기</button>
                </div>
              </nav>
              <div class="tab-content" id="nav-tabContent">
                <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">

                    <div class="form-floating">
                        <input type="email" class="form-control" id="floatingInput">
                        <label for="floatingInput"> 가입할 때 입력했던 이메일 주소를 입력하세요.</label>
                    </div>
                    <div class="form-floating">
                        <input type="text" class="form-control" id="floatingPhone">
                        <label for="floatingPhone">가입할 때 입력했던 전화번호를 입력하세요.</label>
                    </div>
                    <div class="findIdBtn">
                        <button id="findId" class=" btn btn-lg btn-light" type="submit">찾기</button>
                    </div>
                </div>
                <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
                    <div class="form-floating">
                        <input type="text" class="form-control" id="inputId" placeholder="name@example.com">
                        <label for="inputId">가입한 아이디를 입력하세요.</label>
                    </div>
                    <div class="form-floating">
                        <input type="email" class="form-control" id="inputEamil" placeholder="Password">
                        <label for="inputEamil">가입할 때 입력했던 이메일 주소를 입력하세요.</label>
                    </div>
                    <div class="findPwBtn">
                        <button id="findPw" class=" btn btn-lg btn-light" type="submit">인증번호 전송</button>
                    </div>
                    <!-- hidden 부분-->
                    <div class="form-floating" id="codeDiv">
                        <input type="text" class="form-control" id="inputCode" placeholder="Password">
                        <label for="inputCode">전송된 인증번호를 입력하세요.</label>
                        <button id="checkCode" class=" btn btn-lg btn-light" type="submit">인증번호 확인</button>
                    </div>
                </div>
                
              </div>
        </div>
    </main>
    <footer>
        <div class="footer-box">
            <span>만든이들 : 곽서호, 김동현 92, 김동현 93, 김동휘, 박시현, 베소현 </span><br>
            <span>CopyRight 2022 @ ALL RIGHT RESERVED</span>
        </div>
    </footer>
</body>
</html>