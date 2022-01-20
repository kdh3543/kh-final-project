<!DOCTYPE html>
<html lang="en">

<head>
  <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>00톡 </title>
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
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Dongle&display=swap" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link rel="stylesheet" href="/css/talk.css">

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
    <div class="talk-container">
      <div class="talk-left">
        <div class="talk-search">
          <input type="text" placeholder="검색할 목록" class="inputTalk">
        </div>
        <div class="talk-title">
          대화목록
        </div>
        <div class="talk-list">
          <button class="talk-list-btn">
            <div class="talk-list-left">
              <i class="fas fa-camera fa-2x"></i>
            </div>
            <div class="talk-list-right">
              <div class="talk-name">이름</div>
              <div class="talk-last-conversation">안녕</div>
            </div>
          </button>
        </div>
      </div>
      <div class="talk-right">
        <div class="right-top">
          <div class="right-title-left">
            <div class="title-img">
              <i class="fas fa-camera fa-2x"></i>
            </div>
            <div class="title-name">${id}<input type=hidden value=${id } id="titleName"></div>
          </div>
          <div class="right-title-right">
            <div class="title-alarms"></div>
          </div>
        </div>
        <div class="right-middle">
          대화내용
        </div>
        <div class="right-bottom">
          <div contenteditable="true" id="message"></div>

          <button id="send">전송하기</button>
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

  <script>
    let ws = new WebSocket("ws://localhost/chatProgram");
    let chatMessage = $("#message");
    let rightMiddle = $(".right-middle");
    let rightBottom = $(".right-bottom");
    let send = $("#send");
    let titleName = $("#titleName");

    let curDate = new Date();
    let curTime = curDate.getFullYear() + "-" + (curDate.getMonth() + 1) + "-" + curDate.getDate() + " "
      + curDate.getHours() + ":" + curDate.getMinutes();

    ws.onmessage = function (e) {
      let jsonObject = JSON.parse(event.data);
      let userID = jsonObject.id;
      let message = jsonObject.message;
      let sellerID = jsonObject.sellerID;
      console.log(sellerID);

      let line = $("<div>");
      line.addClass("line");
      let button = $("<button>");
      let talkConverse = $("<div>");
      talkConverse.addClass("talkConverse");
      if ($(".line").text() == "") {
        console.log("null값");

        button.addClass("talk-list-btn");

        let talkList = $("<div>");
        talkList.addClass("talk-list");

        let talkLeft = $("<div>");
        talkLeft.addClass("talk-list-left");
        talkLeft.append("<img src='1.img'>");

        let talkRight = $("<div>");
        talkRight.addClass("talk-list-right");

        let talkName = $("<div>");

        talkName.append(titleName.val());
        talkConverse.append(message);
        talkRight.append(talkName);
        talkRight.append(talkConverse);

        button.append(talkLeft);
        button.append(talkRight);

        talkList.append(button);

        $(".talk-left").append(talkList);
      } else {
        $(".talkConverse").html(message);
      }

      line.append(userID + ": " + message);
      rightMiddle.append(line);
      rightMiddle.stop().animate({
        scrollTop: rightMiddle[0].scrollHeight
      }, 1000);

      button.one("click", function () {

        $.ajax({
          url: "/chat/chatContents",
          data: { sellerID: sellerID },
          dataType: "json"
        }).done(function (resp) {
          rightMiddle.html("대화내용");


          for (let i = 0; i < resp.length; i++) {
            let line = $("<div>");
            line.addClass("line");
            console.log(resp[i].buyerId);
            console.log(resp[i].sellerId);
            if (resp[i].sellerId == titleName.val()) {
              line.append(resp[i].sellerId + ": " + resp[i].chatContents);
            } else {
              line.append(resp[i].buyerId + ": " + resp[i].chatContents);
            }

            rightMiddle.append(line);
            rightMiddle.stop().animate({
              scrollTop: rightMiddle[0].scrollHeight
            }, 1000);
          }
        });

      })
    }

    send.on("click", function () {
      if (chatMessage.html() == "") {
        return false;
      }
      let text = chatMessage.html();
      chatMessage.html("");
      chatMessage.focus();
      console.log(titleName);
      ws.send(text + '<br>' + titleName.val());

      rightMiddle.stop().animate({
        scrollTop: rightMiddle[0].scrollHeight
      }, 1000);
    });

    rightBottom.on("keypress", function (e) {
      if (e.keyCode == 13 && e.shiftKey == false) {
        if (chatMessage.html() == "") {
          return false;
        }
        let text = chatMessage.html();
        chatMessage.html("");
        chatMessage.focus();

        ws.send(text + '<br>' + titleName.val());

        rightMiddle.stop().animate({
          scrollTop: rightMiddle[0].scrollHeight
        }, 1000);
        return false;
      }
    });


  </script>
</body>

</html>