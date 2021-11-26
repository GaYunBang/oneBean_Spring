<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" />

<title>로그인</title>
<link rel="shortcut icon" type="image/x-icon"
	href="/images/titlelogo.png" />

<script src="https://kit.fontawesome.com/be3783bb1d.js"
	crossorigin="anonymous">
	
</script>

<!--햄버거 제이쿼리-->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>

<!-- 스타일 -->
<link href="/css/index/header.css" rel="stylesheet" />
<link href="/css/index/footer.css" rel="stylesheet" />
<link href="/css/index/search.css" rel="stylesheet" />
<link href="/css/purchase/cart.css" rel="stylesheet" />
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
			<a href="#none" class="navbar_toggleBtn"> <span></span>
			</a>
			<ul class="first_nav">
				<li class="change"><a class="eng" href="/Etc/about.do">ABOUT</a>
					<a class="kor" href="/Etc/about.do">회사소개</a></li>
				<li class="change"><a class="eng" href="#none">SHOP</a>
					<a class="kor" href="#none">상품</a>
					<ul class="under_view">
						<li><a href="/Product/proListAll.do">모든상품</a></li>
						<li><a href="/Regular/regularList.do">정기구독</a></li>
						<li><a href="/Product/coffeeProList.do">커피용품</a>
							<hr class="line"></li>
					</ul></li>
				<li class="change"><a class="eng" href="#none">EVENT</a>
					<a class="kor" href="#none">이벤트</a>
					<ul class="under_view">
						<li><a href="/Product/newProduct.do">새상품</a></li>
						<li><a href="/Product/sampleBoxList.do">샘플BOX</a>
							<hr class="line"></li>
					</ul></li>
				<li class="change"><a class="eng" href="#none">WHOLESALE</a>
					<a class="kor" href="#none">도매</a>
					<ul class="under_view">
						<li><a href=".do">납품신청</a></li>
						<li><a href=".do">창업문의</a></li>
						<li><a href=".do">커피용품</a>
							<hr class="line"></li>
					</ul></li>
				<li><a href="#none">고객센터</a>
					<ul class="under_view">
						<li><a href="/Etc/faq.do">Q&A</a></li>
						<li><a href=".do">문의사항</a>
							<hr class="line"></li>
					</ul></li>
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
							<li>${member.memId}님</li>
							<li><a href="/" title="">로그아웃</a></li>
							<li><a href="" title="">마이페이지</a></li>
							<li><a href="" title="">주문조회</a></li>
						</c:if>
					</ul></li>
				<li class="icons"><a href=".do"><i class="bi bi-cart3"></i></a></li>
				<li class="search_box">
                    <input type="text" class="search_txt" name="keyword" placeholder="Type to search" maxlength="20">
				    <button class="icons search_btn"><i class="bi bi-search"></i></button>
                </li>
			</ul>
			</form>
		</nav>
	</header>
	<section>
		 <form name="orderform" id="orderform" method="post" class="orderform" action="/Page" onsubmit="return false;">
            
            <input type="hidden" name="cmd" value="order">
            <div class="basketdiv" id="basket">
                <div id="mark_area">Home > Basket</div>
                <div class="row head">
                    <div class="subdiv">
                        <div class="check">선택</div>
                        <div class="img">이미지</div>
                        <div class="pname">상품명</div>
                    </div>
                    <div class="subdiv">
                        <div class="basketprice">가격</div>
                        <div class="num">수량</div>
                        <div class="sum">합계</div>
                    </div>
                    <div class="subdiv">
    
                        <div class="basketcmd">삭제</div>
                    </div>
                    <div class="split"></div>
                </div>
        
                <div class="row data">
                    <div class="subdiv">
                        <div class="check"><input type="checkbox" name="buy" value="260" checked="" onclick="javascript:basket.checkItem();">&nbsp;</div>    
                        <div class="img"><img src="/images/상품1.png" width="60"></div>
                        <div class="pname">
                            <span>커피용품</span>
                        </div>
                    </div>
                    <div class="subdiv">
                        <div class="basketprice"><input type="hidden" name="p_price" id="p_price1" class="p_price" value="20000">20,000원</div>
                        <div class="num">
                            <div class="updown">
                                <input type="text" name="p_num1" id="p_num1" size="2" maxlength="4" class="p_num" value="2" onkeyup="javascript:basket.changePNum(1);">
                                <span onclick="javascript:basket.changePNum(1);"><i class="fas fa-arrow-alt-circle-up up"></i></span>
                                <span onclick="javascript:basket.changePNum(1);"><i class="fas fa-arrow-alt-circle-down down"></i></span>
                            </div>
                        </div>
                        <div class="sum">40,000원</div>
                    </div>
                    <div class="subdiv">
                        <div class="basketcmd"><a href="javascript:void(0)" class="abutton" onclick="javascript:basket.delItem();">삭제</a></div>
                    </div>
                </div>
                <div class="row data">
                    <div class="subdiv">
                        <div class="check"><input type="checkbox" name="buy" value="261" checked="" onclick="javascript:basket.checkItem();">&nbsp;</div>
                        <div class="img"><img src="/images/상품1.png" width="60"></div>
                        <div class="pname">
                            <span>커피콩</span>
                        </div>
                    </div>
                    <div class="subdiv">
                        <div class="basketprice"><input type="hidden" name="p_price" id="p_price2" class="p_price" value="19000">19,000원</div>
                        <div class="num">
                            <div class="updown">
                                <input type="text" name="p_num2" id="p_num2" size="2" maxlength="4" class="p_num" value="1" onkeyup="javascript:basket.changePNum(2);">
                                <span onclick="javascript:basket.changePNum(2);"><i class="fas fa-arrow-alt-circle-up up"></i></span>
                                <span onclick="javascript:basket.changePNum(2);"><i class="fas fa-arrow-alt-circle-down down"></i></span>
                            </div>
                        </div>
                        <div class="sum">19,000원</div>
                    </div>
                    <div class="subdiv">
                        <div class="basketcmd"><a href="javascript:void(0)" class="abutton" onclick="javascript:basket.delItem();">삭제</a></div>
                    </div>
                </div>
                <div class="row data">
                    <div class="subdiv">
                        <div class="check"><input type="checkbox" name="buy" value="262" checked="" onclick="javascript:basket.checkItem();">&nbsp;</div>
                        <div class="img"><img src="/images/상품1.png" width="60"></div>
                        <div class="pname">
                            <span>커피포트</span>
                        </div>
                    </div>
                    <div class="subdiv">
                        <div class="basketprice"><input type="hidden" name="p_price" id="p_price3" class="p_price" value="15200">15,200원</div>
                        <div class="num">
                            <div class="updown">
                                <input type="text" name="p_num3" id="p_num3" size="2" maxlength="4" class="p_num" value="1" onkeyup="javascript:basket.changePNum(3);">
                                <span onclick="javascript:basket.changePNum(3);"><i class="fas fa-arrow-alt-circle-up up"></i></span>
                                <span onclick="javascript:basket.changePNum(3);"><i class="fas fa-arrow-alt-circle-down down"></i></span>
                            </div>
                        </div>
                        <div class="sum">15,200원</div>
                    </div>
                    <div class="subdiv">
                        <div class="basketcmd"><a href="javascript:void(0)" class="abutton" onclick="javascript:basket.delItem();">삭제</a></div>
                    </div>
                </div>
        
            </div>
            
            <div class="right-align basketrowcmd">
                <a href="javascript:void(0)" class="abutton" onclick="javascript:basket.delCheckedItem();">선택상품삭제</a>
                <a href="javascript:void(0)" class="abutton" onclick="javascript:basket.delAllItem();">장바구니비우기</a>
            </div>
    
            <div class="bigtext right-align sumcount" id="sum_p_num">상품갯수: 4개</div>
            <div class="bigtext right-align box blue summoney" id="sum_p_price">합계금액: 74,200원</div>
    
            <div id="goorder" class="">                
                <div class="buttongroup1 right-align cmd1">
                  <a href="#">계속 쇼핑하기</a>
                </div>
                <div class="buttongroup center-align cmd">
                    <a href="#">선택한 상품 주문</a>
                </div>
            </div>
        </form>
	</section>
	<br><br><br>
	
	<!--메인 하단/ 회사소개 css는 style.css에 458줄 확인-->
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
						<p>
							상호 (주)원빈커피&nbsp;&nbsp;&nbsp; 대표 홍길동&nbsp;&nbsp;&nbsp; 사업자등록번호
							11111111<br> 통신판매업 신고 2020-용인기흥-1464호 &nbsp;&nbsp;&nbsp;<a
								href="#">[사업자정보확인]</a><br> 주소 전라북도 전주시 덕진구 백제대로 572 5층 503호<br>
							개인정보관리책임자 아무개 (ezen@ezen.com)<br> 전화 063.245.1324
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
					<div class="copyright_content">고객님은 안전거래를 위해 결제시 저희 쇼핑몰에서 가입한
						구매안전 서비스를 이용하실 수 있습니다</div>
				</div>
			</div>
		</div>
	</footer>
	<!-- Bootstrap core JS-->
	<!--끝-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"
		integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"
		integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13"
		crossorigin="anonymous"></script>
	<script src="/js/hamber.js"></script>
	<!-- Core theme JS-->
	<script src="/js/scripts.js"></script>
	
</body>
</html>