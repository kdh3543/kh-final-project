<!DOCTYPE html>
<html lang="en">
<head>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>내 상점 </title>
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
    <link rel="stylesheet" href="/css/header_searchBar.css">
    <link rel="stylesheet" href="/css/footer.css">
    <!-- Custom styles for this template -->
    <link rel="stylesheet" href="/css/myPage.css">
    

</head>
<body>
      <!--  Header -->
      <header>
          <!-- 로그인 했을 때만 진입 가능 -->
        <div class="header_Container">
            <ul class="header_list">
                <li><a href="signIn" hidden>로그인</a></li>
                <li><a href="join">로그아웃</a></li>
            </ul>
        </div>
        <div class="div-wrap">
            <div class="nav_div">
                <div class="logo">
                    <i class="fas fa-seedling"></i>
                    <a href="/">00마켓</a>
                </div>
                <div class="searchBar">
                    <div class="input-group mb-3">
                        <input type="text" class="form-control"  placeholder="동네 이름, 물품명 등을 검색해 보세요!" aria-label="Recipient's username" aria-describedby="button-addon2">
                        <button class="btn btn-outline-secondary" type="button" id="button-addon2"><i class="fas fa-search fa-2x"></i></button>
                      </div>
                </div>
            </div>
        </div>
    </header>
    <main>
        <section class="section1">
        <div class="top-container">
            <div class="left-Container">
                <div class="img-Container">
                    <i class="fas fa-camera fa-3x"></i>
                    <button>내 상점 관리 </button>
                </div>
            </div>
            <div class="right-Container">
                아이디
            </div>
        </div>
        </section>
        <section class="section2"></section>

    </main>
     <!-- footer -->
     <footer>
        <div class="footer-box">
            <span>만든이들 : 곽서호, 김동현 92, 김동현 93, 김동휘, 박시현, 베소현 </span><br>
            <span>CopyRight 2022 @ ALL RIGHT RESERVED</span>
        </div>
    </footer>
</body>
</html>