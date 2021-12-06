<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.ezen.vo.*"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html lang="kr">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
	  integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" />

<!-- 스타일css 링크추가 -->
<link href="/css/index/header.css" rel="stylesheet" />
<link href="/css/index/footer.css" rel="stylesheet" />
<link href="/css/index/search.css" rel="stylesheet" />
<link href="/css/purchase/payApply.css" rel="stylesheet" />

<link rel="shortcut icon" type="image/x-icon"
	href="/images/titlelogo.png" />
<title>결제하기</title>

<!-- fontawesome 주소 -->
<script src="https://kit.fontawesome.com/be3783bb1d.js" crossorigin="anonymous"></script>
<!--햄버거 제이쿼리-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
<!-- jquery 불러오기 -->
<script src="/js/jquery-3.6.0.min.js"></script>
<script>
      function findAddr(){
        new daum.Postcode({
              oncomplete: function(data) {
                
                console.log(data);
                
                  // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
                  // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                  // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                  var roadAddr = data.roadAddress; // 도로명 주소 변수
                  var jibunAddr = data.jibunAddress; // 지번 주소 변수
                  // 우편번호와 주소 정보를 해당 필드에 넣는다.
                  document.getElementById('member_post').value = data.zonecode;
                  if(roadAddr !== ''){
                      document.getElementById("member_addr").value = roadAddr;
                  } 
                  else if(jibunAddr !== ''){
                      document.getElementById("member_addr").value = jibunAddr;
                  }
              }
          }).open();
      }
      </script>
      
      <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
<header class="fixed-top">
	<div class="top__banner">
		<a href="/Regular/regularList.do"> 매주 월요일 신성한 원두로 홈카페! <span class="colchange">정기구독 하러 가기~♪</span></a>
	</div>
	<div class="titleLogo">
		<a href="/"><img src="/images/maintitle.png" /></a>
	</div>
	<nav class="navigation">
		<!--햄버거 설정 class="bar" / "fa-2x"->사이즈 조절-->
		<a href="#none" class="navbar_toggleBtn"> <span></span></a>
		<ul class="first_nav">
			<li class="change">
				<a class="eng" href="/Etc/about.do">ABOUT</a>
				<a class="kor" href="/Etc/about.do">회사소개</a>
			</li>
			<li class="change">
				<a class="eng" href="#none">SHOP</a>
				<a class="kor" href="#none">상품</a>
				<ul class="under_view">
					<li><a href="/Product/proListAll.do">모든상품</a></li>
					<li><a href="/Regular/regularList.do">정기구독</a></li>
					<li><a href="/Product/coffeeProList.do">커피용품</a>
					<hr class="line"></li>
				</ul>
			</li>
			<li class="change">
				<a class="eng" href="#none">EVENT</a>
				<a class="kor" href="#none">이벤트</a>
				<ul class="under_view">
					<li><a href="/Product/newProduct.do">새상품</a></li>
					<li><a href="/Product/sampleBoxList.do">샘플BOX</a>
					<hr class="line"></li>
				</ul>
			</li>
			<li class="change">
				<a class="eng" href="#none">WHOLESALE</a>
				<a class="kor" href="#none">도매</a>
				<ul class="under_view">
					<c:if test="${member == null}">
						<li><a href="/Member/login.do">납품신청</a></li>
					</c:if>
					<c:if test="${member != null}">
						<c:if test="${memberGrade == 1}">
							<li><a href="/Buisness/deliveryApply.do">납품신청</a></li>
						</c:if>
						<c:if test="${memberGrade != 1}">
							<li><a href="/Buisness/buisnessProductList.do">납품신청</a></li>
						</c:if>
					</c:if>
					<li><a href="/Buisness/newShopQuestion.do">창업문의</a></li>
					<c:if test="${member == null }">
						<li><a href="/Member/login.do">커피용품</a><hr class="line"></li>
					</c:if>
					<c:if test="${member != null }">
						<li><a href="/Product/coffeeList.do">커피용품</a><hr class="line"></li>
					</c:if>
				</ul>
			</li>
			<li><a href="#none">고객센터</a>
				<ul class="under_view">
					<!-- 로그인 안했을때 -->
					<c:if test="${member == null}">
						<li><a href="/Member/login.do" title="">Q&A</a></li>
						<li><a href="/Member/login.do" title="">문의사항</a><hr class="line"></li>
					</c:if>
					<!-- 로그인 했을때 -->
					<c:if test="${member != null}">
						<li><a href="/Etc/faq.do">Q&A</a></li>
						<li><a href="/Question/list.do">문의사항</a><hr class="line"></li>
					</c:if>
				</ul>
			</li>
		</ul>
		<form class="search_form" name="frm" action="" method="get">
			<ul id="right_nav">
				<li class="icon"><a href="#none"><i class="bi bi-person" style="font-size: 30px;"></i></a>
					<ul class="under_view">
						<!-- 로그인 안했을때 -->
						<c:if test="${member == null}">
							<li><a href="/Member/login.do" title="">로그인</a></li>
							<li><a href="/Member/join.do" title="">회원가입</a></li>
						</c:if>
						<!-- 로그인 했을때 -->
						<c:if test="${member != null}">
							<li><b>${member.memberName}님</b></li>
							<li><a href="/Member/logout.do" title="">로그아웃</a></li>
							<li><a href="/Member/myPage.do" title="">마이페이지</a></li>
							<li><a href="/Purchase/orderList.do" title="">주문조회</a></li>
						</c:if>
					</ul></li>
				<c:if test="${member == null}">
					<li class="icons"><a href="/Member/login.do"><i class="bi bi-cart3"></i></a></li>
				</c:if>
				<c:if test="${member != null}">
					<li class="icons"><a href="/Purchase/cartList.do"><i class="bi bi-cart3"></i></a></li>
				</c:if>
				<li class="search_box">
					<input type="text" class="search_txt" name="keyword" placeholder="Type to search" maxlength="20">
					<button class="icons search_btn"><i class="bi bi-search"></i></button>
				</li>
			</ul>
		</form>
	</nav>
</header>
<section>
	<form name="order_form" method="post" action ="" onsubmit="return check2();">
            <div class="content pt-4">
                <div class="container-xxl">                                            
                            <!-- 제목 -->
                            <div class="d-flex align-items-center">
                                <span class="shop_bow_subject">주문/결제</span>
                            </div>
                                <span class="d-flex shop_bow_subject2 mt-5 mb-3">주문 상품</span>
                                <!-- 주문상품 상단 -->
                                <div class="shop_box mt-2 py-3 d-flex align-items-center">
                                    <div class="d-flex align-items-center top_1 justify-content-center ps-3"><span>상품/옵션 정보</span></div>
                                    <div class="d-flex align-items-center top_3 justify-content-center"><span>수량</span></div>
                                    <div class="d-flex align-items-center top_3 justify-content-center mb_hide"><span>상품금액</span></div>
                                    <div class="d-flex align-items-center top_2 justify-content-center"><span>합계금액</span></div>
                                    <div class="d-flex align-items-center top_3 justify-content-center"><span>배송비</span></div>
                                </div>                                
                                <!-- 상품 부분 -->
                                <div class="shop_box2 d-flex align-items-center">
                                    <div class="d-flex align-self-start top_1 py-3">
                                        <div class="d-flex align-items-center ps-1 ps-lg-3 sum_box">
                                            <img src="" width="80px">
                                        </div>
                                        <div class="d-flex align-items-center con_box">
                                            <span class="pro"></span>
                                            <input type="hidden" name="pidx" value="">
                                        </div>
                                    </div>
                                    <div class="d-flex align-items-center justify-content-center flex-column top_3">
                                        <span class="pro d-flex align-items-center"></span>
                                            <input type="hidden" name="cvol" value="">
                                    </div>
                                    <div class="d-flex align-items-center justify-content-center flex-column top_3 mb_hide">
                                        <span class="pro d-flex align-items-center"></span>
                                    </div>
                                    <div class="d-flex align-items-center justify-content-center flex-column top_2">
                                        <span class="pro d-flex align-items-center"></span>
                                            <input type="hidden" name="omoney" value="">
                                    </div>
                                    <div class="d-flex align-items-center justify-content-center flex-column top_3">
                                        <span class="pro d-flex align-items-center">0원</span>
                                    </div>
                                </div>                                        
                                <span class="d-flex shop_bow_subject2 mt-5 mb-3">주문자 정보</span>
                                <!-- 주문자 정보 -->
                                <div class="shop_box mt-2 py-3">
                                    <div class="d-flex align-items-center pb-4"><span class="px-3 name_subject">주문자<span class="color_red">*</span></span><input type="text" name="oname" value=""></div>
                                    <div class="d-flex align-items-center pb-4"><span class="px-3 name_subject">휴대폰<span class="color_red">*</span></span><input type="text" name="otell" value=""></div>
                                    <div class="d-flex align-items-center"><span class="px-3 name_subject">이메일<span class="color_red">*</span></span><input type="text" name="omail" value=""></div>
                                </div>
        
                                <span class="d-flex shop_bow_subject2 mt-5 mb-3">배송 정보</span>
                                <!-- 배송 정보 -->
                                <div class="shop_box mt-2 py-3">
                                    <div class="d-flex align-items-center pb-0 pb-sm-4 ms-sm-1 ms-0 row" style="position: relative;">
                                        <span class="px-4 px-sm-3 pb-2 px-sm-0 name_subject">[배송지 선택]</span>
                                        <div class="d-flex py-3 pt-0 pt-sm-3">
                                            <label class="pe-3 d-flex align-items-center"><input type="radio" name="ship" value="기본배송지" class="mx-2">
                                            기본 배송지</label>
                                            <label class="pe-3 d-flex align-items-center"><input type="radio" name="ship" value="최근배송지" class="mx-2">최근 배송지</label>
                                            <label class="pe-3 d-flex align-items-center"><input type="radio" name="ship" value="직접입력" class="mx-2">
                                            직접 입력</label>
                                            <a class="ship_btn">배송지 관리</a>
                                        </div>
                                    </div>
                                    <div class="d-flex align-items-center pb-4"><span class="px-3 name_subject">받으실 분<span class="color_red">*</span></span>
                                    <input type="text" name="ooname" value=""></div>
                                    <div class="d-flex align-items-center pb-4"><span class="px-2 ms-1 px-sm-3 ms-sm-0  name_subject">휴대폰번호<span class="color_red">*</span></span>
                                    <input type="text" name="ootell" value=""></div>
                                    <div class="d-flex align-items-center pb-4 row"><span class="px-4 ms-sm-3 ms-0 px-sm-3 name_subject pb-2 pb-sm-0 onesell">받으실 곳<span class="color_red">*</span></span>
                                        <div class="d-flex justify-content-center flex-column mb_address">
                                            <div class="d-flex">                                                
                                                <input type="button" value="우편번호 검색" onclick="findAddr();" class="btn_post_search">
                                            </div>                                            
                                                <input id="member_post"  name="roadAddrPart1" type="text" placeholder="우편 번호" readonly value="">
                                                <input id="member_addr" name="roadAddrPart2" type="text" placeholder="도로명주소/지번주소" readonly value=""> <br>
                                                <input id="member_detail_addr" name="addrDetail" type="text" placeholder="상세 주소를 입력해주세요." value="">                       
                                        </div>
                                    </div>                                    
                                </div>        
                                <span class="d-flex shop_bow_subject2 mt-5 mb-3">배송 선택</span>
                                <!-- 배송 선택 -->
                                <div class="shop_box mt-2 py-3">
                                    <div class="d-flex align-items-center pb-4">
                                        <span class="px-3 name_subject">배송방법<span class="color_red">*</span></span>                                   
                                        <span class="dv_ment1">배송비 3,000원 | 5만원 이상 무료배송</span>
                                    </div>
                                    <div class="d-flex align-items-center"><span class="px-3 name_subject">배송메세지</span>
                                        <input type="text" name="dv_ment" placeholder="배송 메시지를 선택해 주세요.">
                                    </div>
                                </div>
        
                                <span class="d-flex shop_bow_subject2 mt-5 mb-3">결제수단 선택</span>
                                <!-- 배송 선택 -->
                                <div class="shop_box mt-2 py-3 mb-3">
                                    <div class="d-flex align-items-center">
                                        <span class="px-1 px-sm-3 name_subject">일반결제</span>
                                        <label class="pe-3 d-flex align-items-center"><input type="radio" name="pay" value="기본배송지" class="mx-2" checked> 무통장 입금</label>
                                        <label class="pe-3 d-flex align-items-center"><input type="radio" name="pay" value="기본배송지" class="mx-2" checked> 신용카드</label>
                                        <label class="pe-3 d-flex align-items-center"><input type="radio" name="pay" value="기본배송지" class="mx-2" checked> 계좌이체</label>
                                    </div>
                                </div>                                
                                <div id="checkWrap">
                                  <label for="cheeck01"><input type="checkbox" id="cheeck01" />전체 동의합니다.</label>
                                  <label for="cheeck02"><input type="checkbox" id="cheeck02" />(필수) 개인정보 제공 동의</label>
                                  <label for="cheeck03"><input type="checkbox" id="cheeck03" />(필수) 주문 상품정보에 동의</label>
                                  <label for="cheeck04"><input type="checkbox" id="cheeck04" />(필수) 결제대행 서비스 이용을 위한 개인정보 제3자 제공 및 위탁동의</label>
                                </div>                                
                                <button class="order_main_btn" type="button"  onclick="requestPay()">
                                    <span id="totalSettlePrice"></span>원 결제하기
                                </button>
                        </div>                                                
                    </div>                            
        </form>
    </section>
<footer class="footer">
	<div class="container">
		<div class="row text-center frist_footer">
			<div class="col-lg-4 col-md-3 col-sm-12 col-xs-12">
				<div>
					<p class="cs_title">C/S</p>
					<p class="comnum">063.245.1324</p>
					<p>AM 09:00 - PM 17:00</p>
				</div>
			</div>
			<div class="col-lg-5 col-md-6 col-sm-12 col-xs-12">
				<div>
					<p class="cs_title">COMPANY</p>
					<p>상호 (주)원빈커피&nbsp;&nbsp;&nbsp; 대표 홍길동&nbsp;&nbsp;&nbsp; 사업자등록번호 11111111<br>
					       통신판매업 신고 2020-용인기흥-1464호 &nbsp;&nbsp;&nbsp;<a href="#">[사업자정보확인]</a><br>
					       주소 전라북도 전주시 덕진구 백제대로 572 5층 503호<br>
					       개인정보관리책임자 아무개 (ezen@ezen.com)<br>
					       전화 063.245.1324
					</p>
				</div>
			</div>
			<div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
				<div>
					<p class="cs_title">BANK</p>
					<p>카카오뱅크 333-44444444-12-45</p>
					<p>예금주 원빈커피</p>
				</div>
			</div>
		</div>
		<div class="row text-center">
			<div>
				<div class="copyright_content">고객님은 안전거래를 위해 결제시 저희 쇼핑몰에서 가입한 구매안전 서비스를 이용하실 수 있습니다</div>
			</div>
		</div>
	</div>
</footer>
<!-- 위치 옮기지 않기 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"
		integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB"
		crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"
		integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13"
		crossorigin="anonymous"></script>
<script src="/js/hamber.js"></script>
<script src="/js/payApply.js"></script>
</body>
</html>