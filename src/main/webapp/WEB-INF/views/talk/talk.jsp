<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
      <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>유즈톡</title>
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
 

    <body>
      <header>
        <div class="header_Container">
          <c:choose>
            <c:when test="${loginID != null}">
              <ul class="header-list-after-login">
                <li>${loginID}</li>
                <li><a href="/items/myPage">마이페이지</a></li>
                <li><a href="/member/logout" id="logoutbtn">로그아웃</a></li>

              </ul>
            </c:when>
          </c:choose>
        </div>
        <div class="div-wrap">
					<div class="nav_div">
						<div class="logo">
							<a href="/"><img src="/imgs/sideLogo2.png" class="logoImg"></a>
						</div>
					</div>
				</div>
       
      </header>
      <main>
        <div class="talk-container">
          <div class="talk-left">

            <div class="talk-title">대화목록</div>
            <div class="talk-list">
              <a class="talk-list-btn" href="/chat/toChatBot?roomId=-1">
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

                <a class="talk-list-btn" pid="${list.roomId}"
                  href="/chat/moveChatRoom?sellerId=${list.sellerId}&productId=${list.productId}&productName=${list.productName}&roomId=${list.roomId}&sysName=${list.chatImg}">

                  <c:choose>
                    <c:when test="${list.sellerId eq id}">
                      <div class="talk-list-left">
                        <img src="${list.myProfile }">
                      </div>
                      <div class="talk-list-right">
                        <div class="talk-name">
                          <div class="talk-name-div">${list.buyerId}(${list.productName})</div>
                          <div class="talk-time">(${list.latestDate})</div>

                        </div>


                        <div class="talk-last-conversation" pid=${list.roomId}>
                          ${list.lastMessage}

                          <input type=hidden value="${list.roomId }" id="hiddenRoomId"
                            class="hiddenRoomId${delCount.count}" pid=${list.productId}>
                          <input type=hidden value="${list.productId }" id="hiddenProductId">
                          <input type=hidden value="${list.sellerId}" id="hiddenSellerId"
                            class="hiddenSellerId${delCount.count}">
                          <input type=hidden value="${list.productName}" id="hiddenProductName"
                            class="hiddenProductName${delCount.count}">
                          <input type=hidden value="${list.buyerId}" id="hiddenBuyerId"
                            class="hiddenBuyerId${delCount.count}">
                          <input type=hidden value="${id}" id="hiddenId">
                        </div>
                      </div>
                    </c:when>
                    <c:otherwise>
                      <div class="talk-list-left">
                        <img src="${list.otherProfile }">
                      </div>
                      <div class="talk-list-right" pid=${list.roomId}>
                        <div class="talk-name">
                          <div class="talk-name-div">${list.sellerId}(${list.productName})</div>
                          <div class="talk-time">(${list.latestDate})</div>

                        </div>

                        <div class="talk-last-conversation" pid=${list.roomId}>
                          ${list.lastMessage}

                          <input type=hidden value="${list.roomId }" id="hiddenRoomId"
                            class="hiddenRoomId${delCount.count}" pid=${list.productId}>
                          <input type=hidden value="${list.productId }" id="hiddenProductId">
                          <input type=hidden value="${list.sellerId}" id="hiddenSellerId"
                            class="hiddenSellerId${delCount.count}">
                          <input type=hidden value="${list.productName}" id="hiddenProductName"
                            class="hiddenProductName${delCount.count}">
                          <input type=hidden value="${list.buyerId}" id="hiddenBuyerId"
                            class="hiddenBuyerId${delCount.count}">
                          <input type=hidden value="${id}" id="hiddenId">

                        </div>
                      </div>
                    </c:otherwise>
                  </c:choose>

                  <div>
                    <!-- <input type="button" id="chatDelBtn${delCount.count}" value="X"> -->
                    <div class="btn-group">
                      <button type="button" class="btn btn-secondary-light" data-bs-toggle="dropdown"
                        aria-expanded="false">
                        <i class="fas fa-ellipsis-v"></i>
                      </button>
                      <ul class="dropdown-menu">

                        <!-- Dropdown menu links -->
                        <li>
                          <button type="button" id="chatDelBtn${delCount.count}" value="${list.roomId}"
                            pid="${list.roomId}" class="delBtnClass">삭제</button>
                        </li>
                      </ul>
                    </div>
                  </div>
                </a>

              </div>

              <script>

                test = $("#chatDelBtn${delCount.count}").val()
                $("#chatDelBtn${delCount.count}").on("click", function () {

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
                    <!-- <div class="title-img">
                      <i class="fas fa-camera fa-2x"></i>
                    </div> -->
                    <div class="title-name">00톡 첫페이지입니다</div>
                  </div>
                  <div class="right-title-right">
                    <div class="title-alarms"></div>
                  </div>
                </div>
                <div class="right-middle">
                  <div class="initial-page">
                    <div class="initial-page-line">
                      00톡 첫페이지입니다.<br> 판매자 및 구매자와 연락하고 싶으시면<br> 왼쪽 채팅방을 클릭한
                      뒤<br> 채팅을 시작해주세요
                    </div>
                  </div>
                </div>

                <div class="right-bottom">
                  <input type=text placeholder="이 페이지는 입력할 수 없는 페이지입니다." id="preventInput" disabled>
                  <button type="button">전송불가</button>
                </div>
            </c:when>


            <c:when test="${roomId==-1}">
              <div class="talk-right">
                <div class="right-top">
                  <div class="right-title-left">
                    <!-- <div class="title-img">
                      <i class="fas fa-camera fa-2x"></i>
                    </div> -->
                    <div class="title-name">챗봇 페이지입니다.</div>
                  </div>
                  <div class="right-title-right">
                    <div class="title-alarms"></div>
                  </div>
                </div>
                <div class="right-middle">
                  <div class="right-middle-title">챗봇</div>
                  <div class="right-line">
                    <div class="line">
                      챗봇 페이지입니다.
                    </div>
                  </div>
                  <div class="right-line">
                    <div class="line">
                      궁금하신 사항에 대해 선택해주시면 답변해드립니다.
                    </div>
                  </div>
                  <div class="right-line">
                    <div class="line">
                      <input type="radio" value="q1" name="selectQuestion">1번 구매방법<br>
                      <input type="radio" value="q2" name="selectQuestion">2번 판매방법<br>
                      <input type="radio" value="q3" name="selectQuestion">3번 검색방법<br>
                      <input type="radio" value="q4" name="selectQuestion">4번 팔로잉방법<br>
                      <input type="radio" value="q5" name="selectQuestion">5번 게시판 이용방법
                    </div>
                  </div>

                </div>

                <div class="right-bottom">
                  <input type=text placeholder="이 페이지는 입력할 수 없는 페이지입니다." id="preventInput" disabled>
                  <button type="button">전송불가</button>
                </div>
                <script>


                  $(document).ready(function () {
                    $("input:radio[name='selectQuestion']").click(function () {
                      if ($(this).val() == 'q1') {
                        let chatLeftDiv = $("<div>");
                        chatLeftDiv.addClass("left-line");
                        let chatLine = $("<div>");
                        chatLine.addClass("line");

                        chatLine.append("구매방법<br>")
                        chatLine.append("1. 바로구매" + "<br>");
                        chatLine.append("원하는 상품 페이지에서 '바로구매' 버튼 클릭 후 계좌이체를 통해 결제가 가능합니다." + "<br>");
                        chatLine.append("2. 연락하기를 통한 거래" + "<br>");
                        chatLine.append("원하는 상품 페이지에서 '연락하기' 버튼 클릭 후 판매자와 연락한 후에 직거래로 거래하시면 됩니다.");

                        chatLeftDiv.append(chatLine);
                        $(".right-middle").append(chatLeftDiv);
                      } else if ($(this).val() == 'q2') {
                        let chatLeftDiv = $("<div>");
                        chatLeftDiv.addClass("left-line");
                        let chatLine = $("<div>");
                        chatLine.addClass("line");

                        chatLine.append("판매방법<br>");
                        chatLine.append("메인 페이지에서 '판매하기'버튼 클릭 후 원하는 상품 등록 및 관련 정보 입력 후에 등록하시면 됩니다.");

                        chatLeftDiv.append(chatLine);
                        $(".right-middle").append(chatLeftDiv);
                      } else if ($(this).val() == 'q3') {
                        let chatLeftDiv = $("<div>");
                        chatLeftDiv.addClass("left-line");
                        let chatLine = $("<div>");
                        chatLine.addClass("line");

                        chatLine.append("검색방법<br>");
                        chatLine.append("1. 상품검색<br>");
                        chatLine.append("메인페이지에서 원하는 상품에 대해서 검색하시면 해당 검색어가 포함된 상품리스트가 나옵니다.<br>");
                        chatLine.append("2. 상점검색<br>");
                        chatLine.append("메인페이지에서 검색어 앞에 @를 붙여서 검색하면 해당 검색어가 포함된 상점들 리스트가 나옵니다.");
                        chatLeftDiv.append(chatLine);
                        $(".right-middle").append(chatLeftDiv);
                      } else if ($(this).val() == 'q4') {
                        let chatLeftDiv = $("<div>");
                        chatLeftDiv.addClass("left-line");
                        let chatLine = $("<div>");
                        chatLine.addClass("line");

                        chatLine.append("팔로잉 방법<br>");
                        chatLine.append("내가 자주 이용하거나 마음에 든 상점이 있으면 '팔로잉' 버튼을 누르시면 해당 상점에 대한 팔로잉을 할 수 있으며 좀 더 쉽게 상점을 찾을 수 있습니다.");

                        chatLeftDiv.append(chatLine);
                        $(".right-middle").append(chatLeftDiv);
                      } else if ($(this).val() == 'q5') {
                        let chatLeftDiv = $("<div>");
                        chatLeftDiv.addClass("left-line");
                        let chatLine = $("<div>");
                        chatLine.addClass("line");

                        chatLine.append("게시판 이용방법<br>");
                        chatLine.append("메인페이지에서 '커뮤니티'버튼을 누르시면 게시판 화면으로 이동하고 게시물을 확인하실 수 있고 원하는 게시물을 작성하실 수 있습니다.");
                        chatLeftDiv.append(chatLine);
                        $(".right-middle").append(chatLeftDiv);
                      }
                    })
                  });

                  // let chatRightDiv = $("<div>");
                  // chatRightDiv.addClass("right-line");
                  // chatRightDiv.append(chatLine);
                  // $(".right-middle").append(chatRightDiv);
                </script>
            </c:when>

            <c:otherwise>
              <div class="talk-right">
                <div class="right-top">

                  <div class="right-title-left">
                    <div class="title-img">
                      <img src="${sysName}" style="height: 40px; width: 40px;">
                    </div>

                    <div class="title-name">
                      ${productName} <input type=hidden value="${productId}" id="productId">
                    </div>

                  </div>
                  <div class="right-title-right">
                    <div class="title-alarms"></div>
                  </div>
                </div>
                <div class="right-middle">
                  <div class="right-middle-title">대화가 시작되었습니다.</div>
                  <div class="right-line">

                    <div class="line">
                      <a href="/items/itemsDetail?iseq=${productId}">
                        <img src="${sysName}" style="height: 80px; width: 80px;">
                        <span>제품 상세보기</span>
                      </a>
                    </div>
                  </div>
                  <c:forEach var="cList" items="${cList}">
                    <c:choose>
                      <c:when test="${id eq cList.buyerId}">
                        <div class="right-line">
                          <div class="chatTime">
                            <div class="chatRead"></div>
                            <div class="time">${cList.formDate }</div>

                          </div>
                          <div class="line">${cList.chatContents}</div>
                        </div>
                      </c:when>

                      <c:otherwise>
                        <div class="left-line">
                          <div class="line">${cList.chatContents}</div>
                          <div class="chatTime">
                            <div class="chatRead"></div>
                            <div class="time">${cList.formDate }</div>
                          </div>
                        </div>
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
          <span>만든이들 : 곽서호, 김동현 92, 김동현 93, 김동휘, 박시현, 베소현 </span><br> <span>CopyRight
            2022 @ ALL RIGHT RESERVED</span>
        </div>
      </footer>

      <script>
        let ws = new WebSocket("ws://localhost///chatProgram");
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
        // let readCount = 1;

        // 메세지를 받았을 때
        let anker = $("<a>");
        let talkList = $("<div>");
        let talkConverse = $("<div>");
        let talkLeft = $("<div>");
        let talkRight = $("<div>");
        let talkName = $("<div>");
        talkConverse.addClass("talk-last-conversation");
        ws.onmessage = function (e) {

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
          $(".talk-last-conversation[pid=" + jsonRoomId + "]").html(message);

          if (message == "상대방이 채팅방에서 나갔습니다. 더 이상 내용을 작성하실 수 없습니다.") {
            chatMessage.attr("contenteditable", "false");
            console.log("확인완료");
            document.onkeydown = function (e) {
              if (e.keyCode == 116) {
                location.href = "/chat/delSuccess?roomId=0";
              }
            }
            console.log("들어온 roomId값은: " + jsonRoomId);
            $(".talk-list-btn[pid=" + jsonRoomId + "]").on("click", function () {
              $(".talk-list-btn[pid=" + jsonRoomId + "]").attr("href", "/chat/delSuccess?roomId=0");
            })

            history.pushState(null, null, "http://localhost/chat/delSuccess?roomId=0");
            window.onpopstate = function (event) {
              history.go(1);
            };
            $(".talk-list-btn[pid=" + jsonRoomId + "]").on("click", function () {
              alert("삭제된 채팅방입니다.");
              return false;
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
            let arrayData = {
              text: text, hiddenSellerId: hiddenSellerId.val(),
              hiddenProductName: hiddenProductName.val(),
              hiddenProductId: hiddenProductId.val(), roomId: roomId
            };
            ws.send(JSON.stringify(arrayData));
          } else {
            let arrayData = {
              text: text, hiddenSellerId: hiddenSellerId.val(),
              hiddenProductName: hiddenProductName.val(),
              hiddenProductId: hiddenProductId.val(), roomId: roomId
            };
            ws.send(JSON.stringify(arrayData));
          }


          // if (roomId == 0) {
          //   roomId = $("#roomId").val();
          //   ws.send(text + '<br>' + hiddenSellerId.val() + '<br>' + hiddenProductName.val() + '<br>' + productId.val() + '<br>' + roomId);
          // } else {
          //   ws.send(text + '<br>' + hiddenSellerId.val() + '<br>' + hiddenProductName.val() + '<br>' + productId.val() + '<br>' + roomId);
          // }

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

            // var chatList = new Array();
            // var chatData = new Object();
            // chatData.text = text;
            // chatData.hiddenSellerId = hiddenSellerId.val();
            // chatData.hiddenProductName = hiddenProductName.val();
            // chatData.productId = productId.val();
            // chatData.roomId = roomId;
            // chatList.push(chatData);

            if (roomId == 0) {
              roomId = $("#roomId").val();
              let arrayData = {
                text: text, hiddenSellerId: hiddenSellerId.val(),
                hiddenProductName: hiddenProductName.val(),
                hiddenProductId: hiddenProductId.val(), roomId: roomId
              };
              ws.send(JSON.stringify(arrayData));
            } else {
              let arrayData = {
                text: text, hiddenSellerId: hiddenSellerId.val(),
                hiddenProductName: hiddenProductName.val(),
                hiddenProductId: hiddenProductId.val(), roomId: roomId
              };
              ws.send(JSON.stringify(arrayData));
            }


            // if (roomId == 0) {
            //   roomId = $("#roomId").val();
            //   ws.send(text + '<br>' + hiddenSellerId.val() + '<br>'
            //    + hiddenProductName.val() + '<br>' + productId.val()
            //     + '<br>' + roomId);
            // } else {
            //   ws.send(text + '<br>' + hiddenSellerId.val() + '<br>' + hiddenProductName.val() + '<br>' + productId.val() + '<br>' + roomId);
            // }

            rightMiddle.stop().animate({
              scrollTop: rightMiddle[0].scrollHeight
            }, 1000);

            return false;

          }
        });


      </script>
    </body>

    </html>