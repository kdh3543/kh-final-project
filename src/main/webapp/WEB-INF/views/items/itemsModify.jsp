<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>index</title>
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
<!-- Custom CSS -->
<link rel="stylesheet" href="/css/items/itemsSell.css">
<!-- 주소 API -->
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

</head>
<body>

	
	<c:choose>
		<c:when test="${loginID !=null}">
			<header>
				<div class="header_Container">
					<ul class="header-list-after-login">
							<li><img src="${dto.profile_image}"
								style="max-width: 30px; max-height: 30px;"></li>

							<li>${loginID}</li>
							<!-- 수정중 -->
							<li><a href="/items/myPage?">마이페이지</a></li>
							<li><a href="/member/logout" id="logoutbtn">로그아웃</a></li>


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

		</c:when>
	</c:choose>

	<main>
		<div class="container-div">
			<!-- 네비바 -->
			<div class="top-div">
				<div class="div-wrap2">
					<div class="btn-group">
						<button type="button" class="btn btn-secondary-light"
							data-bs-toggle="dropdown" aria-expanded="false">
							<i class="fas fa-bars fa-2x"></i>
						</button>
						<ul class="dropdown-menu">

							<!-- Dropdown menu links -->
							<li>
								<h6 class="dropdown-header">전체 카테고리</h6>
							</li>
							<li><a class="dropdown-item" href="#" id="c01">여성의류</a>
								<div class="c01-content">
									<a class="dropdown-item" href="#">여성 상의</a> <a
										class="dropdown-item" href="#">여성 하의</a>
								</div></li>
							<li><a class="dropdown-item" href="#" id="c02">남성의류</a>
								<div class="c02-content">
									<a class="dropdown-item" href="#">남성 상의</a> <a
										class="dropdown-item" href="#">남성 하의</a>
								</div></li>
							<li><a class="dropdown-item" href="#" id="c03">신발</a>
								<div class="c03-content">
									<a class="dropdown-item" href="#">운동화</a> <a
										class="dropdown-item" href="#">슬리퍼</a>
								</div></li>
							<li><a class="dropdown-item" href="#" id="c04">가방</a></li>
							<li><a class="dropdown-item" href="#" id="c05">시계/쥬얼리</a></li>
							<li><a class="dropdown-item" href="#" id="c06">패션악세서리</a></li>
							<li><a class="dropdown-item" href="#" id="c07">디지털/가전</a></li>
							<li><a class="dropdown-item" href="#" id="c08">스포츠/레저</a></li>
							<li><a class="dropdown-item" href="#" id="c09">차량/오토바이</a></li>
							<li><a class="dropdown-item" href="#" id="c10">차량/오토바이</a></li>
							<li><a class="dropdown-item" href="#" id="c11">스타굿즈</a></li>
							<li><a class="dropdown-item" href="#" id="c12">키덜트</a></li>
						</ul>
					</div>
					<div class="rightList">

						<a href="productAdd" class="btn-sell"> <i
							class="fas fa-dollar-sign fa-2x"></i> 판매하기
						</a> | <a href="myPage" class="btn-myshop"> <i
							class="fas fa-store fa-2x"></i> 내상점
						</a> | <a href="talk" class="btn-talk"> <i
							class="fas fa-comment fa-2x"></i> 00톡
						</a> | <a href="board/boardList" class="btn-talk"> <i
							class="fas fa-edit fa-2x"></i>커뮤니티
						</a>


					</div>
				</div>
			</div>
			<div class="contents-div">
				<nav>
					<div class="nav nav-tabs" id="nav-tab" role="tablist">
						<button class="nav-link active" id="nav-add-tab"
							data-bs-toggle="tab" data-bs-target="#nav-add" type="button"
							role="tab" aria-controls="nav-add" aria-selected="true">상품수정</button>
						<!-- <button class="nav-link" id="nav-control-tab" data-bs-toggle="tab"
							data-bs-target="#nav-control" type="button" role="tab"
							aria-controls="nav-control" aria-selected="false">상품관리</button>
						<button class="nav-link" id="nav-purchase-tab"
							data-bs-toggle="tab" data-bs-target="#nav-purchase" type="button"
							role="tab" aria-controls="nav-purchase" aria-selected="false">????</button> -->
					</div>
				</nav>
				<div class="tab-content" id="nav-tabContent">
					<!-- 상품정보 -->
					<div class="tab-pane fade show active" id="nav-add" role="tabpanel"
						aria-labelledby="nav-add-tab">
						<div class="add-title">
							<div class="left-title">기본정보</div>
							<div class="right-title">*필수항목</div>
						</div>

						<!-- 상품등록하기 -->



						<form action="/items/itemsModifyProc" method="post"
							enctype="multipart/form-data" onsubmit="jbSubmit();">
							<div class="add-contents">
								<table class="contents-table">

									<tr>
										<td>상품이미지<br><br><br><br>기존이미지</td>

										<!-- 파일 넘기기 / 파일 미리보기  -->
										<td>
											<div id='att_zone'>
												  <label for =btnAtt><img src="/imgs/inputIMG.png"> </label>
												  <input type=file  id="btnAtt" class="btn btn-primary" name=file
													id="btnAtt" multiple style="display: none;" onchange="fileUpload(this)" > 
												

											</div> 
											<div id='att_zone2'>
											<c:forEach var="f" items="${flist}" varStatus="status">


													<div class = delImages style="display: inline-block; position: relative; width: 200px; height: 200px; margin: 5px; border: 1px solid #d5ffff; z-index: 1">
														<img style="width: 100%; height: 100%; z-index: none"
															src="${f.sysName}">
														
													</div>


												</c:forEach>
											</div>
											
											<input type =hidden name=countImg id= countImg > 
											
											<script>

											$("#btnAtt").on("click",function(){
											
										
												
												alert("주의!! 파일 재업로드시  기존이미지들은 사라집니다.");
													$(this).parent;
													
												
												
											});
											
											function jbSubmit(){
												
												let testfilelength = $('#btnAtt')[0].files.length ;
												
											    $("#countImg").val(testfilelength);
												
											}
											
											
											
											
											
											
									
											
											
											</script>
											
											<!--unclick  -->
										
											
											
											
											
<!--미리보기 script -->											
 <script>
( /* att_zone : 이미지들이 들어갈 위치 id, btn : file tag id */
  imageView = function imageView(att_zone, btn){



	  /* 함수의 매개변수로 전달된 id값을 사용하여 각각 attZone, btnAtt 객체를 생성한 뒤,
	  첨부된 파일의 목록을 저장할 sel_files 변수를 배열로 지정함.	   */
    var attZone = document.getElementById(att_zone);
    var btnAtt = document.getElementById(btn)
    var sel_files = [];
    
    // 이미지와 체크 박스를 감싸고 있는 div 속성
    var div_style = 'display:inline-block;position:relative;'
                  + 'width:200px;height:200px;margin:5px;border:1px solid #d5ffff;;z-index:1';
    // 미리보기 이미지 속성
    var img_style = 'width:100%;height:100%;z-index:none';
    // 이미지안에 표시되는 체크박스의 속성
    var chk_style = 'width:30px;height:30px;position:absolute;font-size:24px;'
                  + 'right:0px;bottom:0px;z-index:999;border:1px ; background-color:#c4ffff;color:#FF8383';
  
    btnAtt.onchange = function(e){
      var files = e.target.files;
      var fileArr = Array.prototype.slice.call(files)
      for(f of fileArr){
        imageLoader(f);
      }
    }  
    
  
    // 탐색기에서 드래그앤 드롭 사용
    attZone.addEventListener('dragenter', function(e){
      e.preventDefault();
      e.stopPropagation();
    }, false)
    
    attZone.addEventListener('dragover', function(e){
      e.preventDefault();
      e.stopPropagation();
      
    }, false)
  
    attZone.addEventListener('drop', function(e){
      var files = {};
      e.preventDefault();
      e.stopPropagation();
      var dt = e.dataTransfer;
      files = dt.files;
      for(f of files){
        imageLoader(f);
      }
      
    }, false)
    

    
    /*첨부된 이미리들을 배열에 넣고 미리보기 */
    imageLoader = function(file){
      sel_files.push(file);
      var reader = new FileReader();
      reader.onload = function(ee){
        let img = document.createElement('img')
        img.setAttribute('style', img_style)
        img.src = ee.target.result;
        attZone.appendChild(makeDiv(img, file));
      }
      
      reader.readAsDataURL(file);
    }
    
    /*첨부된 파일이 있는 경우 checkbox와 함께 attZone에 추가할 div를 만들어 반환 */
    makeDiv = function(img, file){
      var div = document.createElement('div')
      div.setAttribute('style', div_style)
      
      var btn = document.createElement('input')
      btn.setAttribute('type', 'button')
      btn.setAttribute('value', 'x')
      btn.setAttribute('delFile', file.name);
      btn.setAttribute('style', chk_style);
      btn.onclick = function(ev){
        var ele = ev.srcElement;
        var delFile = ele.getAttribute('delFile');
        for(var i=0 ;i<sel_files.length; i++){
          if(delFile== sel_files[i].name){
            sel_files.splice(i, 1);      
          }
        }
        
        dt = new DataTransfer();
        for(f in sel_files) {
          var file = sel_files[f];
          dt.items.add(file);
        }
        btnAtt.files = dt.files;
        var p = ele.parentNode;
        attZone.removeChild(p)
      }
      div.appendChild(img)
      div.appendChild(btn)
      return div
    }
  }
)('att_zone', 'btnAtt')

</script>
										</td>

									</tr>



									<!-- ilist 뿌리기 -->
									<c:forEach var="i" items="${ilist}" varStatus="status">
										<tr>
											<td>제목</td>
											<td><input type="text" placeholder="상품제목을 입력하세요."
												class="inputTitle" name="name" value="${i.name }" required></td>

											<!-- 상품번호도 히든으로 넘기기 -->
											<td><input type="hidden" placeholder="상품번호"
												class="inputTitle" name="iseq" value="${i.iseq }"></td>
												
											
											<td><input type="hidden" placeholder="상품판매자"
												class="inputTitle" name="sellerID" value="${i.sellerID }"></td>
															<tr>
											<td>카테고리</td>
											<td><select name="category">
													<option>카테고리 설정</option>
													<option value="여성의류"
														<c:if test ="${i.category eq '여성의류' }">selected</c:if>>여성의류</option>
													<option value="남성의류"
														<c:if test ="${i.category eq '남성의류' }">selected</c:if>>남성의류</option>
													<option value="신발"
														<c:if test ="${i.category eq '신발' }">selected</c:if>>신발</option>
													<option value="가방"
														<c:if test ="${i.category eq '가방' }">selected</c:if>>가방</option>
													<option value="시계/주얼리"
														<c:if test ="${i.category eq '시계/주얼리' }">selected</c:if>>시계/주얼리</option>
													<option value="패션악세서리"
														<c:if test ="${i.category eq '패션악세서리' }">selected</c:if>>패션악세서리</option>
													<option value="디지털/가전"
														<c:if test ="${i.category eq '디지털/가전' }">selected</c:if>>디지털/가전</option>
													<option value="스포츠/레저"
														<c:if test ="${i.category eq '스포츠/레저' }">selected</c:if>>스포츠/레저</option>
													<option value="차량/오토바이"
														<c:if test ="${i.category eq '차량/오토바이' }">selected</c:if>>차량/오토바이</option>
													<option value="스타굿즈"
														<c:if test ="${i.category eq '스타굿즈' }">selected</c:if>>스타굿즈</option>
													<option value="키덜트"
														<c:if test ="${i.category eq '키덜트' }">selected</c:if>>키덜트</option>
											</select></td>
										</tr>
										<tr>
											<td>거래지역</td>
											<td>
												<button>내위치</button>
												<button>최근지역</button>
												<button type="button" id="findAddress">주소검색</button>
												<button>지역설정안함</button> <br> <input type="text"
												placeholder="주소" id="input-address" name="exarea"
												value="${i.exarea}" required>

											</td>
										</tr>
										<tr>
											<td>상품 상태</td>
											<td><input type="radio" name="condition" value="상"
												<c:if test ="${i.condition eq '상' }">checked</c:if>>상
												<input type="radio" name="condition" value="중"
												<c:if test ="${i.condition eq '중' }">checked</c:if>>중
												<input type="radio" name="condition" value="하"
												<c:if test ="${i.condition eq '하' }">checked</c:if>>하</td>
										</tr>
										<tr>
											<td>교환여부</td>
											<td><input type="radio" name="refundable" value="불가능"
												<c:if test ="${i.refundable eq '불가능' }">checked</c:if>>불가능
												<input type="radio" name="refundable" value="가능"
												<c:if test ="${i.refundable eq '가능' }">checked</c:if>>가능</td>
										</tr>
										<tr>
											<td>가격</td>
											<td><input type="number" placeholder="숫자만 입력하세요"
												name="price" value="${i.price}" required> 원</td>
										</tr>

										<tr>
											<td>상품 소개</td>
											<td><textarea rows="5" cols="55"
													placeholder="상품설명을 입력해주세요." name="info" required>${i.info }</textarea></td>
										</tr>
										<tr>
											<td>연관태그</td>
											<td><input type="text" placeholder="연관태그를 입력하세요."
												class="inputTag" name="tag" value="${i.tag}" required></td>
										</tr>
										<tr>
											<td>수량</td>
											<td><input type="number" placeholder="수량을 입력하세요"
												class="inputNumber" name="cnt" value=1 disabled required> 개</td>
										</tr>

									</c:forEach>
								</table>

								<!-- 숨겨진 값 -->
								<!-- 셀러id -->
								<input type="hidden" name="sellerID">
								<!-- 구매자 id  -->
								<input type="hidden" name="buyerID">
								<!-- 거래  상태 디폴트N-->
								<input type="hidden" name="deal">
								<!-- 좋아요 개수 -->
								<input type="hidden" name="like_cnt" value=0>
								<!-- 사진 저장  -->

								<!-- 조회수-->

								<input type="hidden" name="view_cnt" value=0>




								<div class="add-btns-div">
									<input type="submit" class="btn btn-outline-secondary"
										id="productAddBtn" value="수정하기">
									<a href="/items/myPage">
									<button class="btn btn-outline-secondary" id="resetBtn" type="button">돌아가기</button></a>
								</div>
							</div>
						</form>
						<!-- 상품등록하기 끝 -->

					</div>
					 <!-- 판매내역-->
					 
				<!-- 	<div class="tab-pane fade" id="nav-control" role="tabpanel"
						aria-labelledby="nav-control-tab">
						<div class="control-title">
							<div class="left-title">상품관리</div>
						</div>
						<div class="control-contents">
							<div class="control-search-input">
								<input type="text" placeholder="상품명을 입력하세요">
								<button type="button" class="searchBtn">검색</button>
							</div>
							<div class="control-search-div">
								<table class="control-search-table">
									<tr>
										<th>사진
										<th>판매상태
										<th>상품명
										<th>가격
										<th>찜/댓글
										<th>최근수정일
										<th>기능
									</tr>


									<tr>
										<td>ㅇㅇ
										<td>판상
										<td>상품명
										<td>ㅁㅇㄴ
										<td>ㅁㅇㅁㄴㅇㄴㅁㄴㅇ
										<td>ㅁㅇㄴㅁㄴㅇ
										<td>ㅁㅇㄴ
									</tr>
									
									<tr>
										<td colsapn="7">표시할 내용이 없습니다.
									</tr> 
									
								</table>
							</div>
						</div>
					</div>  -->
					<!-- 구매내역 -->
					<!-- <div class="tab-pane fade" id="nav-purchase" role="tabpanel"
						aria-labelledby="nav-purchase-tab">페이지3</div> -->
				</div>
			</div>
	</main>
	<!-- footer -->
	<footer>
		<div class="footer-box">
			<span>만든이들 : 곽서호, 김동현 92, 김동현 93, 김동휘, 박시현, 배소현 </span><br> <span>CopyRight
				2022 @ ALL RIGHT RESERVED</span>
		</div>
	</footer>
	<script>
		//주소지 값 자동 추가해주는 함수
		document.getElementById("findAddress").onclick = function() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							document.getElementById('input-address').value = data.roadAddress;
						}
					}).open();
		}
	
	</script>
	
</body>
</html>