<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            <a class="talk-list-btn" href="#">              
              <div class="talk-list-left">
                <i class="fas fa-camera fa-2x"></i>
              </div>
              <div class="talk-list-right">
                <div class="talk-name">이름</div>
                <div class="talk-last-conversation">안녕</div>
              </div>
            </a>
          </div>
          <c:forEach var="list" items="${list}">
            <div class="talk-list" pid="${list.productId}">
              <a class="talk-list-btn" href="/chat/moveChatRoom?sellerId=${list.sellerId}&productId=${list.productId}&productName=${list.productName}&roomId=${list.roomId}">
                <div class="talk-list-left">
                  <img src='/imgs/t-shirt.jpeg'>
                </div>
                <div class="talk-list-right">
                  <div class="talk-name">${list.roomId}</div>
                  <div class="talk-last-conversation">${list.productId}
                    <input type=hidden value="${list.roomId }" id="hiddenRoomId">
                    <input type=hidden value="${list.productId }" id="productId">
                  </div>
                </div>              
              </a>
            </div>
          </c:forEach>

        </div>

        <div class="talk-right">
          <div class="right-top">
            <div class="right-title-left">
              <div class="title-img">
                <i class="fas fa-camera fa-2x"></i>
              </div>

              <div class="title-name">
                ${productName}
                <input type=hidden value="sellerID" id="hiddenSellerId" name="sellerId">
                <input type=hidden value="${productId}" id="hiddenProductId" name="productId">
                <input type=hidden value="${productName}" id="hiddenProductName" name="productName">
              </div>

            </div>
            <div class="right-title-right">
              <div class="title-alarms"></div>
            </div>
          </div>
          <div class="right-middle">
            대화내용
            <c:forEach var="cList" items="${contentsList}">
              <div class="line">
                ${cList.buyerId}: ${cList.chatContents}
              </div>
            </c:forEach>
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
      let hiddenSellerId = $("#hiddenSellerId");
      let productName = $("#productName");
      let productId = $("#productId");
      let hiddenRoomId = $("#hiddenRoomId");
      let hiddenProductId = $("#hiddenProductId");
      let hiddenProductName = $("#hiddenProductName");

      // 메세지를 받았을 때
      let anker = $("<a>");
      let talkList = $("<div>");
      let talkConverse = $("<div>");
      let talkLeft = $("<div>");
      let talkRight = $("<div>");
      let talkName = $("<div>");
      talkConverse.addClass("talkConverse");
      ws.onmessage = function (e) {
        let jsonObject = JSON.parse(event.data);
        let userID = jsonObject.id;
        let message = jsonObject.message;
        let sellerID = jsonObject.sellerID;
        let productName = jsonObject.productName;
        let jsonProductId = jsonObject.productId;
        let jsonRoomId = jsonObject.roomId;
        console.log(jsonRoomId);
        console.log(jsonObject);
        // $.ajax({
        //     url: "/chat/chatContents2",
        //     data: {message:message},
        //     dataType: "json"
        //   }).done(function(resp){
        //     console.log(resp.data);
        //     $(".talk-last-conversation").html;
        //   })

          console.log($(".talk-list[pid=" + jsonProductId + "]").length);
        if ($(".talk-list[pid=" + jsonProductId + "]").length == 0) {
          anker.addClass("talk-list-btn");
         
          
          talkList.addClass("talk-list");
          talkList.attr("pid", jsonProductId);
          
          talkLeft.addClass("talk-list-left");
          talkLeft.append("<img src='/imgs/t-shirt.jpeg'>");

          talkRight.addClass("talk-list-right");

          talkName.append(sellerID + "(" + productName + ")");
          talkConverse.append(message);
          talkRight.append(talkName);
          talkRight.append(talkConverse);

          anker.append(talkLeft);
          anker.append(talkRight);

          talkList.append(anker);

          $(".talk-left").append(talkList);
          $(".talk-list-btn").attr("href","/chat/moveChatRoom?sellerId="+hiddenSellerId.val()
          +"&productName="+hiddenProductName.val()
          +"&productId="+hiddenProductId.val()+"&roomId="+jsonRoomId);
        } else {
          $(".talkConverse").html(message);
        }
        let line = $("<div>");
        line.addClass("line");
        line.append(userID + ": " + message);
        rightMiddle.append(line);
        rightMiddle.stop().animate({
          scrollTop: rightMiddle[0].scrollHeight
        }, 1000);


      }

      //전송하기 버튼을 클릭했을 때
      send.on("click", function () {
        if (chatMessage.html() == "") {
          return false;
        }
        let text = chatMessage.html();
        chatMessage.html("");
        chatMessage.focus();
        console.log(hiddenSellerId);
        ws.send(text + '<br>' + hiddenSellerId.val() + '<br>' + hiddenProductName.val() + '<br>' + hiddenProductId.val());

        rightMiddle.stop().animate({
          scrollTop: rightMiddle[0].scrollHeight
        }, 1000);
      });

      //전송하기 버튼 엔터를 눌렀을 때
      rightBottom.on("keypress", function (e) {
        if (e.keyCode == 13 && e.shiftKey == false) {
          if (chatMessage.html() == "") {
            return false;
          }
          let text = chatMessage.html();
          chatMessage.html("");
          chatMessage.focus();

          ws.send(text + '<br>' + hiddenSellerId.val() + '<br>' + hiddenProductName.val() + '<br>' + hiddenProductId.val());

          rightMiddle.stop().animate({
            scrollTop: rightMiddle[0].scrollHeight
          }, 1000);

          return false;

        }
      });

      // 대화목록 리스트 중 하나를 클릭했을 때
        
        //productId를 가지고 넘겼을 때 해당하는 내용을 불러와서 채팅내용을 뿌려줘야 됨(페이지 이동)  

        // $.ajax({
        //   url: "/chat/chatContents",
        //   data: { roomID: hiddenRoomId.val() },
        //   dataType: "json"
        // }).done(function (resp) {
        //   rightMiddle.html("대화내용");

        //   for (let i = 0; i < resp.length; i++) {
        //     let line = $("<div>");
        //     line.addClass("line");
        //     console.log(resp[i].buyerId);
        //     console.log(resp[i].sellerId);
        //     if (resp[i].sellerId == hiddenSellerId.val()) {
        //       line.append(resp[i].sellerId + ": " + resp[i].chatContents);
        //     } else {
        //       line.append(resp[i].buyerId + ": " + resp[i].chatContents);
        //     }

        //     rightMiddle.append(line);
        //     rightMiddle.stop().animate({
        //       scrollTop: rightMiddle[0].scrollHeight
        //     }, 1000);
        //   }
        // });
      

    </script>
  </body>

  </html>