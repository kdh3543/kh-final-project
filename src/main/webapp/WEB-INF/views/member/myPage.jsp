<!DOCTYPE html>
<html lang="ko">
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
        <link rel="stylesheet" href="/css/mypage.css">

      

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
                        <input type="text" class="form-control" placeholder="동네 이름, 물품명 등을 검색해 보세요!"
                            aria-label="Recipient's username" aria-describedby="button-addon2">
                        <button class="btn btn-outline-secondary" type="button" id="button-addon2"><i
                                class="fas fa-search fa-2x"></i></button>
                    </div>
                </div>
            </div>
        </div>
    </header>
   <main>
        <div class="mypage-container">
        <section class="section1">
            <div class="top-Container">
                <div class="left-Container">
                    <div class="img-Container">
                        <i class="fas fa-camera fa-3x"></i>
                        <button class="btn btn-lg btn-light" id="myShopBtn">내 상점 관리 </button>
                    </div>
                </div>
                <div class="right-Container">
                    <div class="right-id">아이디</div>
                    <div class="right-info">
                        <div>상점오픈일</div>
                        <div>상점방문수</div>
                        <div>상품판매</div>
                        <div>택배발송</div>
                    </div>
                    <div class="right-introduce">소개글</div>
                </div>
            </div>
        </section>
        <section class="section2">
            <nav>
                <div class="nav nav-tabs" id="nav-tab" role="tablist">
                    <button class="nav-link active" id="nav-profile-tab" data-bs-toggle="tab"
                        data-bs-target="#nav-profile" type="button" role="tab" aria-controls="nav-profile"
                        aria-selected="true">회원정보수정</button>
                    <button class="nav-link" id="nav-sell-tab" data-bs-toggle="tab" data-bs-target="#nav-sell"
                        type="button" role="tab" aria-controls="nav-sell" aria-selected="false">판매내역</button>
                    <button class="nav-link" id="nav-purchase-tab" data-bs-toggle="tab" data-bs-target="#nav-purchase"
                        type="button" role="tab" aria-controls="nav-purchase" aria-selected="false">구매내역</button>
                    <button class="nav-link" id="nav-like-tab" data-bs-toggle="tab" data-bs-target="#nav-like"
                        type="button" role="tab" aria-controls="nav-like" aria-selected="false">찜</button>
                    <button class="nav-link" id="nav-following-tab" data-bs-toggle="tab" data-bs-target="#nav-following"
                        type="button" role="tab" aria-controls="nav-following" aria-selected="false">팔로잉 ?</button>
                    <button class="nav-link" id="nav-follower-tab" data-bs-toggle="tab" data-bs-target="#nav-follower"
                        type="button" role="tab" aria-controls="nav-follower" aria-selected="false">팔로워 ?</button>
                </div>
            </nav>
            <div class="tab-content" id="nav-tabContent">
                <!-- 회원정보 수정 -->
                <div class="tab-pane fade show active" id="nav-profile" role="tabpanel"
                    aria-labelledby="nav-profile-tab">
                    <div class="profile-top">회원정보수정</div>
                    <div class="profile-content">
                        <div class="profile-img">
                            <div class="profile-top-left"><i class="fas fa-camera fa-3x"></i></div>
                            <div class="profile-top-right">
                                <button type="button" class="btn btn-lg btn-light" id="imgChange">사진변경</button>
                                사진 수정을 원하시면 사진변경 버튼을 눌러주세요.
                            </div>
                        </div>
                        <div class="profile-content-section">
                            <table class="profile-table">
                                <tr>
                                    <td>아이디</td>
                                    <td><input type="text" class="inputId" disabled></td>
                                </tr>
                                <tr>
                                    <td>비밀번호</td>
                                    <td><input type="text" class="inputPw">
                                        <button type="button" class=" btn btn-lg btn-light" id="pwChange">비밀번호
                                            변경</button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>이름</td>
                                    <td><input type="text" class="inputName" disabled></td>
                                </tr>
                                <tr>
                                    <td>전화번호</td>
                                    <td><input type="text" class="inputPhone">
                                        <button type="button" class=" btn btn-lg btn-light" id="phoneChange">전화번호
                                            변경</button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>우편변호</td>
                                    <td><input type="text" class="inputZipcode">
                                        <button type="button" class=" btn btn-lg btn-light" id="seachAddress">주소
                                            검색</button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>주소1</td>
                                    <td><input type="text" class="inputAddress1" disabled></td>
                                </tr>
                                <tr>
                                    <td>주소2</td>
                                    <td><input type="text" class="inputAddress2" disabled></td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <button type="submit" class=" btn btn-lg btn-light"
                                            id="updateInfo">정보수정</button>
                                        <button type="button" class=" btn btn-lg btn-light"
                                            id="deleteInfo">회원탈퇴</button>
                                    <td>
                                </tr>
                            </table>

                        </div>
                    </div>
                </div>
                <!-- 판매내역-->
                <div class="tab-pane fade" id="nav-sell" role="tabpanel" aria-labelledby="nav-sell-tab">
                    <div class="sell-top">판매내역 1건</div>
                    <div class="sell-section">
                        <table>
                            <tr>
                                <th>사진</th>
                                <th>거래상태</th>
                                <th>상품명</th>
                                <th>가격</th>
                                <th>찜 수</th>
                                <th>댓글 수</th>
                                <th>최근 수정일</th>
                            </tr>
                            <tr>
                                <td><i class="fas fa-camera fa-3x"></i></td>
                                <td>
                                    <select>
                                        <option>판매중</option>
                                        <option>거래완료</option>
                                    </select>
                                </td>
                                <td>귤</td>
                                <td>35000원</td>
                                <td>1</td>
                                <td>1</td>
                                <td>2022-01-22</td>
                            </tr>
                        </table>
                    </div>
                </div>
                <!-- 구매내역 -->
                <div class="tab-pane fade" id="nav-purchase" role="tabpanel" aria-labelledby="nav-purchase-tab">
                    <div class="purchase-top">구매내역 1건 </div>
                    <div class="purchase-section">
                        <table>
                            <tr>
                                <th>사진</th>
                                <th>구매상태</th>
                                <th>상품명</th>
                                <th>가격</th>
                                <th>후기</th>
                            </tr>
                            <tr>
                                <td><i class="fas fa-camera fa-3x"></i></td>
                                <td>구매완료</td>
                                <td>귤</td>
                                <td>35000원</td>
                                <th>
                                    <button class=" btn btn-lg btn-light" id="writeReviewBtn">후기작성</button>
                                    <button class=" btn btn-lg btn-light" id="readReviewBtn" hidden>후기작성완료</button>
                                </th>
                            </tr>
                        </table>
                    </div>
                </div>
                 <!-- 찜 내역 -->
                <div class="tab-pane fade" id="nav-like" role="tabpanel" aria-labelledby="nav-like-tab">
                    <div class="like-top">찜 내역 </div>
                    <div class="like-section">
                        <div class="like-left">
                            <div class="like-img">
                                <i class="fas fa-camera fa-3x"></i>
                            </div>
                        </div>
                        <div class="like-middle">
                            <div class="like-title">상품명</div>
                            <div class="like-seller">판매자</div>
                            <div class="like-price">가격</div>
                        </div>
                        <div class="like-right">
                            <div class="like-close"><i class="fas fa-times fa-2x"></i></div>
                        </div>
                    </div>
                </div>
            <!-- 팔로잉  -->
            <div class="tab-pane fade" id="nav-following" role="tabpanel" aria-labelledby="nav-following-tab">
                <div class="following-top">팔로잉 수 1 </div>
                <div class="following-section">
                    <div class="following-left">
                        <div class="following-img">
                            <i class="fas fa-camera fa-2x"></i>
                        </div>
                    </div>
                    <div class="following-middle">
                        판매자명
                    </div>
                    <div class="following-right">
                        <button class=" btn btn-lg btn-light" id="unfollowBtn">팔로잉</button>
                    </div>
                </div>
            </div>
            <!-- 팔로워 -->
            <div class="tab-pane fade" id="nav-follower" role="tabpanel" aria-labelledby="nav-follower-tab">
                <div class="follower-top">팔로워 수 1 </div>
                <div class="follower-section">
                    <div class="follower-left">
                        <div class="follower-img">
                            <i class="fas fa-camera fa-2x"></i>
                        </div>
                    </div>
                    <div class="follower-middle">
                        판매자명
                    </div>
                    <div class="follower-right">
                        <button class=" btn btn-lg btn-light" id="isFollowing">팔로잉</button>
                    </div>
                </div>
            </div>
            </div>
        </section>
    </div>
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