<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
          <link rel="stylesheet" href="/css/header_searchBar.css">
          <link rel="stylesheet" href="/css/footer.css">
          <!-- Custom styles for this template -->
          <link rel="stylesheet" href="/css/talk.css">
        

    </head>
    <script>
      let test;

    </script>

    <body>
      <header>
        <div class="header_Container">
          <c:choose>
            <c:when test="${loginID != null}">
              <ul class="header-list-after-login">
                <li>이미지 부분 : ${dto.profile_image}</li>
                <li>${loginID}님안녕하세요</li>

                <li><a href="/items/myPage">마이페이지</a></li>
                <li><a href="/member/logout" id="logoutbtn">로그아웃</a></li>

              </ul>
            </c:when>
          </c:choose>
        </div>
        <div class="div-wrap">
          <div class="nav_div">
            <div class="logo">
              <i class="fas fa-seedling"></i> <a href="/">00마켓</a>
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
            <!-- 관리자 챗봇에 대한 div -->
            <!-- <c:forEach var="chatBot" items="${chatBot}">
              <div class="talk-list">
                <a class="talk-list-btn"
                  href="/chat/moveChatRoom?sellerId=${chatBot.sellerId}&productId=${chatBot.productId}&productName=${chatBot.productName}&roomId=${chatBot.roomId}">
                  <div class="talk-list-left">
                    <i class="fas fa-camera fa-2x"></i>
                  </div>
                  <div class="talk-list-right">
                    <div class="talk-name">${chatBot.sellerId}</div>
                    <div class="talk-last-conversation">${chatBot.roomId}</div>
                  </div>
                </a>
              </div>
            </c:forEach> -->

            <div class="talk-list">
              <a class="talk-list-btn" href="#">
                <div class="talk-list-left">
                  <i class="fas fa-camera fa-2x"></i>
                </div>
                <div class="talk-list-right">
                  <div class="talk-name">관리자 챗봇입니다.</div>
                  <div class="talk-last-conversation">관리자 챗봇</div>
                </div>
              </a>
            </div>
            <!-- 생성된 대화방에 대한 div -->
            <c:forEach var="list" items="${list}" varStatus="delCount">
              <div class="talk-list" pid="${list.productId}" id="delNo${delCount.count}">
                <a class="talk-list-btn" pid=${list.roomId}
                  href="/chat/moveChatRoom?sellerId=${list.sellerId}&productId=${list.productId}&productName=${list.productName}&roomId=${list.roomId}">
                  <div class="talk-list-left">
                    <img src='/imgs/t-shirt.jpeg'>
                  </div>
                  <c:choose>
                    <c:when test="${list.sellerId eq id}">
                      <div class="talk-list-right">
                        <div class="talk-name">${list.buyerId}(${list.productName})(${list.latestDate})</div>
    
                        <div class="talk-last-conversation" >
                          (${list.roomId})${list.lastMessage}
    
                          <input type=hidden value="${list.roomId }" id="hiddenRoomId" class="hiddenRoomId${delCount.count}"
                            pid=${list.productId}>
                          <input type=hidden value="${list.productId }" id="hiddenProductId" >
                          <input type=hidden value="${list.sellerId}" id="hiddenSellerId" class="hiddenSellerId${delCount.count}">
                          <input type=hidden value="${list.productName}" id="hiddenProductName" class="hiddenProductName${delCount.count}">
                          <input type=hidden value="${list.buyerId}" id="hiddenBuyerId" class="hiddenBuyerId${delCount.count}">
                          <input type=hidden value="${id}" id="hiddenId">
                        </div>
                      </div>
                    </c:when>
                    <c:otherwise>
                      <div class="talk-list-right" pid=${list.roomId}>
                        <div class="talk-name">${list.sellerId}(${list.productName})(${list.latestDate})</div>
    
                        <div class="talk-last-conversation" pid=${list.roomId}>
                          (${list.roomId})${list.lastMessage}
    
                          <input type=hidden value="${list.roomId }" id="hiddenRoomId" class="hiddenRoomId${delCount.count}"
                            pid=${list.productId}>
                          <input type=hidden value="${list.productId }" id="hiddenProductId" >
                          <input type=hidden value="${list.sellerId}" id="hiddenSellerId" class="hiddenSellerId${delCount.count}">
                          <input type=hidden value="${list.productName}" id="hiddenProductName" class="hiddenProductName${delCount.count}">
                          <input type=hidden value="${list.buyerId}" id="hiddenBuyerId" class="hiddenBuyerId${delCount.count}">
                          <input type=hidden value="${id}" id="hiddenId">
                        </div>
                      </div>
                    </c:otherwise>
                  </c:choose>
                  
                  <div>
                    <!-- <input type="button" id="chatDelBtn${delCount.count}" value="X"> -->
                    <button type="button" id="chatDelBtn${delCount.count}" value="${list.roomId}" pid=${list.roomId} class="delBtnClass">X</button>
                    
                  </div>
                </a>

              </div>

              <script>
                
                test = $("#chatDelBtn${delCount.count}").val()
                $("#chatDelBtn${delCount.count}").on("click", function () {

                  console.log("id값은: " +hiddenSellerId.val());
                  console.log("상품이름은: " +hiddenProductName.val());
                  if (confirm("정말 채팅방을 나가시겠습니까?")) {
                    
                    let hiddenSellerId = $(".hiddenSellerId${delCount.count}");
                    let hiddenRoomId = $("#hiddenRoomId");
                    let hiddenProductId = $("#hiddenProductId");
                    let hiddenProductName = $(".hiddenProductName${delCount.count}");
                    let productId = $("#productId");
                    let hiddenBuyerId = $(".hiddenBuyerId${delCount.count}");
                    let hiddenId = $("#hiddenId").val();

                    let url = window.location.href;
                    
                    let urlParams = new URLSearchParams(url);
                    
                    console.log("id값은: " +hiddenSellerId.val());
                    console.log("상품이름은: " +hiddenProductName.val());

                    let roomId = urlParams.get('roomId');
                    if (roomId == 0) {
                      roomId = $("#roomId").val();
                      ws.send("상대방이 채팅방에서 나갔습니다. 더 이상 내용을 작성하실 수 없습니다." + '<br>' + hiddenSellerId.val() + '<br>' + hiddenProductName.val() + '<br>' + productId.val() + '<br>' + roomId);
                    } else {
                      ws.send("상대방이 채팅방에서 나갔습니다. 더 이상 내용을 작성하실 수 없습니다." + '<br>' + hiddenSellerId.val() + '<br>' + hiddenProductName.val() + '<br>' + productId.val() + '<br>' + roomId);
                    }
                    

                    alert("채팅방 내용이 모두 삭제되었습니다.");
                    
                    $.ajax({
                      url: "/chat/delChatRoom",
                      data: {
                        roomId: $("#chatDelBtn${delCount.count}").val()
                      }
                    }).done(function (resp) {
                      if (resp > 0) {
                        location.href = "/chat/delSuccess?roomId=0";
                      }
                    })
                  }

                })
              </script>
            </c:forEach>

          </div>

          <c:choose>
            <c:when test="${roomId == 0}">
              <div class="talk-right">
                <div class="right-top">
                  <div class="right-title-left">
                    <div class="title-img">
                      <i class="fas fa-camera fa-2x"></i>
                    </div>
                    <div class="title-name">
                      00톡 첫페이지입니다
                    </div>
                  </div>
                  <div class="right-title-right">
                    <div class="title-alarms"></div>
                  </div>
                </div>
                <div class="right-middle">
                  <div class="initial-page">
                    <div class="initial-page-line">
                      00톡 첫페이지입니다.<br>
                      판매자 및 구매자와 연락하고 싶으시면<br>
                      왼쪽 채팅방을 클릭한 뒤<br>
                      채팅을 시작해주세요
                    </div>
                  </div>
                </div>

                <div class="right-bottom">
                  <input type=text placeholder="이 페이지는 입력할 수 없는 페이지입니다." id="preventInput" disabled>
                  <button type="button">전송불가</button>

                </div>
            </c:when>
            <c:otherwise>
              <div class="talk-right">
                <div class="right-top">
                  <div class="right-title-left">
                    <div class="title-img">
                      <i class="fas fa-camera fa-2x"></i>
                    </div>

                    <div class="title-name">
                      ${productName}
                      <input type=hidden value="${productId}" id="productId">
                    </div>

                  </div>
                  <div class="right-title-right">
                    <div class="title-alarms"></div>
                  </div>
                </div>
                <div class="right-middle">

                  대화내용
                  <c:forEach var="cList" items="${cList}">
                    <c:choose>
                      <c:when test="${cList.roomId==0}">
                        <div class="left-line" id="chatBot-Left">
                          <div class="line">
                            관리자 챗봇입니다. 무엇을 도와드릴까요?
                          </div>
                        </div>
                        <div class="right-line" id="chatBot-Right">
                          <div class="line">
                            <input type="radio" name=select id=1번>1번 항목<br>
                            <input type="radio" name=select id=2번>2번 항목<br>
                            <input type="radio" name=select id=3번>3번 항목<br>
                            <input type="radio" name=select id=4번>4번 항목


                          </div>
                        </div>
                      </c:when>
                      <c:otherwise>

                        <c:choose>
                          <c:when test="${id eq cList.buyerId}">
                            <div class="right-line">
                              <div class="chatTime">
                                <div class="chatRead">
                                  
                                </div>
                                <div class="time">
                                  ${cList.formDate }
                                </div>

                              </div>
                              <div class="line">
                                ${cList.chatContents}
                              </div>
                            </div>
                          </c:when>

                          <c:otherwise>
                            <div class="left-line">
                              <div class="line">
                                ${cList.chatContents}
                              </div>
                              <div class="chatTime">
                                <div class="chatRead">

                                </div>
                                <div class="time">
                                  ${cList.formDate }
                                </div>
                              </div>
                            </div>
                          </c:otherwise>
                        </c:choose>
                      </c:otherwise>

                    </c:choose>
                  </c:forEach>

                </div>

                <div class="right-bottom">
                  <div contenteditable="true" id="message"></div>

                  <button id="send">전송하기</button>
                  <input type=hidden value="${roomId}" id="roomId">
                  
                </div>

            </c:otherwise>
          </c:choose>

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
        let hiddenRoomId = $("#hiddenRoomId");
        let hiddenProductId = $("#hiddenProductId");
        let hiddenProductName = $("#hiddenProductName");
        let productId = $("#productId");
        let hiddenBuyerId = $("#hiddenBuyerId");
        let hiddenId = $("#hiddenId").val();

        rightMiddle.scrollTop(rightMiddle[0].scrollHeight);

        // 메세지 읽음 카운터
        let readCount = 1;

        // 메세지를 받았을 때
        let anker = $("<a>");
        let talkList = $("<div>");
        let talkConverse = $("<div>");
        let talkLeft = $("<div>");
        let talkRight = $("<div>");
        let talkName = $("<div>");
        talkConverse.addClass("talk-last-conversation");
        ws.onmessage = function (e) {
          let alpha = e.data;
          console.log(e.data);
          let time = new Date();
          let hours = time.getHours();
          let minutes = time.getMinutes();
          let seconds = time.getSeconds();
          let jsonObject = JSON.parse(event.data);
          let userId = jsonObject.id;
          let message = jsonObject.message;
          let sellerId = jsonObject.sellerId;
          let productName = jsonObject.productName;
          let jsonProductId = jsonObject.productId;
          let jsonRoomId = jsonObject.roomId;
          
          $("#hiddenRoomId[pid=" + jsonProductId + "]").val(jsonRoomId);
          if(userId == hiddenId){
            $(".talk-last-conversation[pid=" + jsonRoomId + "]").html(message);
          }else{
            $(".talk-last-conversation[pid=" + jsonRoomId + "]").html(message + readCount);
            readCount++;
          }
          
          if(message == "상대방이 채팅방에서 나갔습니다. 더 이상 내용을 작성하실 수 없습니다."){
            chatMessage.attr("contenteditable","false");
            console.log("확인완료");
            document.onkeydown = function(e){
              if(e.keyCode==116){
                location.href="/chat/delSuccess?roomId=0";
              }
            }
            console.log("들어온 roomId값은: "+jsonRoomId);
            $(".talk-list-btn[pid="+jsonRoomId+"]").on("click",function(){
              $(".talk-list-btn[pid="+jsonRoomId+"]").attr("href","/chat/delSuccess?roomId=0");
            })
            
          }
          let url = window.location.href;
          console.log(url);
          let urlParams = new URLSearchParams(url);
          console.log(urlParams);

          let roomId = urlParams.get('roomId');

          if (roomId == jsonRoomId) {
            if (userId == hiddenId) {
              let rightLine = $("<div>");
              rightLine.addClass("right-line");
              let chatTime = $("<div>");
              chatTime.addClass("chatTime");
              let chatRead = $("<div>");
              chatRead.addClass("chatRead");
              let time = $("<div>");
              time.addClass("time");
              // chatRead.append(1);
              chatTime.append(chatRead);
              chatTime.append(time);

              let line = $("<div>");
              line.addClass("line");
              line.append(message);
              if (hours < 10 && minutes >= 10) {
                time.append("0" + hours + ":" + minutes);
              } else if (minutes < 10 && hours >= 10) {
                time.append(hours + ":0" + minutes);
              } else if (hours < 10 && minutes < 10) {
                time.append("0" + hours + ":0" + minutes);
              } else {
                time.append(hours + ":" + minutes);
              }

              rightLine.append(chatTime);
              rightLine.append(line);
              rightMiddle.append(rightLine);
            } else {
              let leftLine = $("<div>");
              leftLine.addClass("left-line");
              let chatTime = $("<div>");
              chatTime.addClass("chatTime");
              let chatRead = $("<div>");
              chatRead.addClass("chatRead");
              let time = $("<div>");
              time.addClass("time");
              // chatRead.append(1);
              chatTime.append(chatRead);
              chatTime.append(time);

              let line = $("<div>");
              line.addClass("line");
              line.append(message);
              leftLine.append(line);
              if (hours < 10 && minutes >= 10) {
                time.append("0" + hours + ":" + minutes);
              } else if (minutes < 10 && hours >= 10) {
                time.append(hours + ":0" + minutes);
              } else if (hours < 10 && minutes < 10) {
                time.append("0" + hours + ":0" + minutes);
              } else {
                time.append(hours + ":" + minutes);
              }
              leftLine.append(chatTime);
              rightMiddle.append(leftLine);
            }
          }

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

          let url = window.location.href;
          console.log(url);
          let urlParams = new URLSearchParams(url);
          console.log(urlParams);

          let roomId = urlParams.get('roomId');
          if (roomId == 0) {
            roomId = $("#roomId").val();
            ws.send(text + '<br>' + hiddenSellerId.val() + '<br>' + hiddenProductName.val() + '<br>' + productId.val() + '<br>' + roomId);
          } else {
            ws.send(text + '<br>' + hiddenSellerId.val() + '<br>' + hiddenProductName.val() + '<br>' + productId.val() + '<br>' + roomId);
          }

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

            let url = window.location.href;
            console.log(url);
            let urlParams = new URLSearchParams(url);
            console.log(urlParams);

            let roomId = urlParams.get('roomId');
            if (roomId == 0) {
              roomId = $("#roomId").val();
              ws.send(text + '<br>' + hiddenSellerId.val() + '<br>' + hiddenProductName.val() + '<br>' + productId.val() + '<br>' + roomId);
            } else {
              ws.send(text + '<br>' + hiddenSellerId.val() + '<br>' + hiddenProductName.val() + '<br>' + productId.val() + '<br>' + roomId);
            }

            rightMiddle.stop().animate({
              scrollTop: rightMiddle[0].scrollHeight
            }, 1000);

            return false;

          }
        });

        /*  ws.onclose = function(){
            console.log("ws 닫힘");
            ws = null;
  
            setTimeout(function(){
              <sec:authorize access="hasAndRole('ROLE_ADMIN','ROLE_USER','ROLE_SUPER','ROLE_STOP')">
                connect();
              </sec:authorize>
            },100)
          }  */
      </script>
    </body>

    </html>