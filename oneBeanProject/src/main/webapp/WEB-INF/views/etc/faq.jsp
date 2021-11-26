<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.ezen.vo.*"%>
<!DOCTYPE html>
<html lang="kr">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" />


<title>ONEBEAN</title>
<link rel="shortcut icon" type="image/x-icon"
	href="/images/titlelogo.png" />

<script src="https://kit.fontawesome.com/be3783bb1d.js"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>

<!-- 스타일css 링크추가 -->
<link href="/css/index/header.css" rel="stylesheet" />
<link href="/css/index/footer.css" rel="stylesheet" />
<link href="/css/index/search.css" rel="stylesheet" />
<link href="/css/etc/faq.css" rel="stylesheet" />
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
							<li>${member.memberId}님</li>
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
		<div class="subject">FAQ</div>

    <!--NAV바 부분-->
    <section class="contents">
    <ul class="nav nav-tabs" id="myTab" role="tablist">
        <li class="nav-item" role="presentation">
          <button class="nav-link active" id="first-tab" data-bs-toggle="tab" data-bs-target="#first" type="button" role="tab" aria-controls="home" aria-selected="true">배송 / 교환 / 취소</button>
        </li>
        <li class="nav-item" role="presentation">
          <button class="nav-link" id="second-tab" data-bs-toggle="tab" data-bs-target="#second" type="button" role="tab" aria-controls="second" aria-selected="false">회원가입 / 정보</button>
        </li>
        <li class="nav-item" role="presentation">
          <button class="nav-link" id="third-tab" data-bs-toggle="tab" data-bs-target="#third" type="button" role="tab" aria-controls="third" aria-selected="false">상품문의</button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link" id="forth-tab" data-bs-toggle="tab" data-bs-target="#forth" type="button" role="tab" aria-controls="forth" aria-selected="false">주문 / 결제</button>
          </li>
      </ul>

      <div class="tab-content" id="myTabContent">

                 <!--1번탭-->
        <div class="tab-pane fade show active" id="first" role="tabpanel" aria-labelledby="first-tab">
            <!--Accordion부분-->
            <div class="sub1">배송/교환/취소</div> 
            <div class="accordion" id="accordionExample">

                <div class="accordion-item">
                <h2 class="accordion-header" id="headingOne">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
                    당일출고 택배 마감 시간은 몇시인가요?
                    </button>
                </h2>
                <div id="collapseOne" class="accordion-collapse collapse" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
                    <div class="accordion-body">
                        평일기준  <strong>13시 이전 결제완료 주문건까지는 당일 출고</strong>됩니다.<br>
                        (주말/공휴일 제외)<br>
                        13시 이후 급하신 고객님들의 경우 고객센터로 연락주시면 확인 후 늦게까지 택배 발주 도와드리고 있습니다.
                        <br><br>
                        *택배사 물량에 따라 배송이 지연될 수 있으며, 미리 재고 파악하시어 선주문 바랍니다.
                    </div>
                </div>
                </div>

                <div class="accordion-item">
                <h2 class="accordion-header" id="headingTwo">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                    방문수령 가능한가요?
                    </button>
                </h2>
                <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
                    <div class="accordion-body">
                        네 가능합니다. 직접 오셔서 매장 결제도 가능합니다.<br>
                        포장 시간이 있어 방문 전 고객센터로 연락바랍니다.
                        <br><br>
                        온라인 결제 시 요청사항에 '방문수령'으로 기재 바랍니다.
                        <br><br>
                        고객센터 : 070-0000-0000 / 매장 : 070-0000-0000
                        <br><br>
                        방문수령지 : 전북 전주시 덕진구 백제대로 이젠IT아카데미 5층
                    </div>
                </div>
                </div>

                <div class="accordion-item">
                <h2 class="accordion-header" id="headingThree">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                        배송비는 얼마인가요?
                    </button>
                </h2>
                <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
                    <div class="accordion-body">
                        기본 배송비는 <strong>3,000원이며, 4만원 이상 구매 시 무료배송</strong></strong>입니다.<br>
                        도서산간 지역은 추가 운임비를 지불하셔야 하는 경우가 있습니다.
                    </div>
                </div>
                </div>

                <div class="accordion-item">
                <h2 class="accordion-header" id="headingFour">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
                        발송 전 주문 취소 또는 변경은 어떻게 하나요?
                    </button>
                </h2>
                <div id="collapseFour" class="accordion-collapse collapse" aria-labelledby="headingFour" data-bs-parent="#accordionExample">
                    <div class="accordion-body">
                        13시 이후에는 변경사항은 게시판 문의는 처리가 늦어질 수 있으니<br>
                        꼭 <strong>고객센터(070-0000-0000)</strong>로 연락 후 변경 바랍니다.
                        <br><br>
                        제품이 발송된 후에는 취소나 주소변경이 불가하오니 이 점 양해바랍니다.
                    </div>
                </div>
                </div>

                <div class="accordion-item">
                <h2 class="accordion-header" id="headingFive">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
                    원두 교환/환불은 어떻게 하나요?
                 </button>
                </h2>
                <div id="collapseFive" class="accordion-collapse collapse" aria-labelledby="headingFive" data-bs-parent="#accordionExample">
                    <div class="accordion-body">
                        원두커피는 제조식품으로 <strong>(고객 단순 변심/원두 분쇄도 착각/기타사유 등)교환/반품/환불이 불가</strong>합니다.
                    </div>
                </div>
                </div>

                <div class="accordion-item">
                <h2 class="accordion-header" id="headingSix">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseSix" aria-expanded="false" aria-controls="collapseSix">
                        용품 교환/환불은 어떻게 하나요?
                    </button>
                </h2>
                <div id="collapseSix" class="accordion-collapse collapse" aria-labelledby="headingSix" data-bs-parent="#accordionExample">
                    <div class="accordion-body">
                        커피 용품은 <strong>개봉 또는 상품가치가 훼손된 경우 교환/반품이 불가능</strong>합니다.

                        제품의 이상으로 인한 제품에 대해서는 저희쪽에서 책임지며,
                        배송완료 후 7일 이내에 고객센터(070-0000-0000)로 문의바랍니다.
                    </div>
                </div>
                </div>
            </div>                        
            <!--Accordion부분-->
        </div>
                                                    <!--1번탭-->

                <!--2번탭-->
        <div class="tab-pane fade" id="second" role="tabpanel" aria-labelledby="second-tab">
             <!--Accordion부분-->
             <div class="sub1">회원가입/정보</div>
             <div class="accordion" id="accordionExample">

                <div class="accordion-item">
                <h2 class="accordion-header" id="headingOne">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
                        회원가입 시 어떤 혜택이 있나요?
                    </button>
                </h2>
                <div id="collapseOne" class="accordion-collapse collapse" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
                    <div class="accordion-body">
                        회원 가입과 동시에 <strong>적립금 2,000원과 무료배송 쿠폰</strong>이 자동 발급됩니다.<br>
                        쿠폰은 발급일 기준 14일 이내 사용이 가능하며, 동시 사용은 불가합니다.
                    </div>
                </div>
                </div>

                <div class="accordion-item">
                <h2 class="accordion-header" id="headingTwo">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                        사업자 등록은 어떻게 하나요?
                    </button>
                </h2>
                <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
                    <div class="accordion-body">
                        회원 가입 후 사업자 메뉴로의 접근을 통해 뜨는 등록페이지의 하단에서<br>
                        사업자 번호 등록을 해주시면 확인 후 세부 메뉴 접근 가능하도록 도와드리고 있습니다.
                        <br><br>
                        <link src="">사업자 등록페이지 바로가기
                    </div>
                </div>
                </div>

                <div class="accordion-item">
                <h2 class="accordion-header" id="headingThree">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                        고객센터 운영 시간이 어떻게 되나요?
                    </button>
                </h2>
                <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
                    <div class="accordion-body">
                        고객센터 : 070-0000-0000
                        <br><br>
                        평일 : 09:00-18:00/점심: 13:00-14:00<br>
                        (주말/공휴일 휴무)
                    </div>
                </div>
                </div>

            </div>                        
            <!--Accordion부분-->   
        </div>
                                        <!--2번탭-->

              <!--3번탭-->
        <div class="tab-pane fade" id="third" role="tabpanel" aria-labelledby="third-tab">
            <!--Accordion부분-->
            <div class="sub1">원두/상품문의</div>
            <div class="accordion" id="accordionExample">

                <div class="accordion-item">
                <h2 class="accordion-header" id="headingOne">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
                        커피 원두는 어떻게 보관하나요?
                    </button>
                </h2>
                <div id="collapseOne" class="accordion-collapse collapse" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
                    <div class="accordion-body">
                        공기가 들어가지 않도록 밀봉 또는 밀폐 용기에 담아 서늘한 그늘에 보관합니다.
                        <br><br>
                        하우트 커피에서는 로스팅 후 15일 안에 드시는 것을 권장하며,<br>
                        소량 씩 구입해 빨리 소진하는 것이 가장 신선한 맛과 향을 즐길 수 있는 방법입니다.
                        <br><br>
                        *홀빈이 아닌 분쇄되어 포장된 원두는 가스와 함께 성분도 빨리 날아가고,<br>
                        신선도가 급격히 떨어지므로 받으신 후 일주일 이내에 드시는 것을 추천드립니다.
                        <br><br>
                        -(홀빈)원두의 유통기한은 얼마나 되나요?<br>
                        시간이 지나면 맛과 향이 서서히 변하기 시작하기 때문에<br>
                        로스팅 후 15일 안에 드시는 것을 권장합니다.
                        <br><br>
                        최대 한 달 이내로 소비하는 것을 권장합니다.
                    </div>
                </div>
                </div>

                <div class="accordion-item">
                <h2 class="accordion-header" id="headingTwo">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                        (홀빈)원두의 유통기한은 얼마나 되나요?
                    </button>
                </h2>
                <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
                    <div class="accordion-body">
                        시간이 지나면 맛과 향이 서서히 변하기 시작하기 때문에<br>
                        로스팅 후 15일 안에 드시는 것을 권장합니다.
                        <br><br>
                        최대 한 달 이내로 소비하는 것을 권장합니다.
                    </div>
                </div>
                </div>

                <div class="accordion-item">
                <h2 class="accordion-header" id="headingThree">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                        (분쇄)원두의 유통기한은 얼마나 되나요?
                    </button>
                </h2>
                <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
                    <div class="accordion-body">
                        분쇄된 원두는 산소와 만나는 접촉면이 넓어져, 향미가 빨리 사라지거나<br>
                        변질되기 쉽기 때문에 7일 이내에 소비하시는 것을 권장합니다.
                    </div>
                </div>
                </div>

            </div>                        
            <!--Accordion부분-->
            </div>
                                        <!--3번탭-->

                <!--4번탭-->
        <div class="tab-pane fade" id="forth" role="tabpanel" aria-labelledby="forth-tab">
            <!--Accordion부분-->
            <div class="sub1">주문/결제</div> 
            <div class="accordion" id="accordionExample">

                <div class="accordion-item">
                <h2 class="accordion-header" id="headingOne">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
                        세금계산서 신청을 어떻게 하나요?
                    </button>
                </h2>
                <div id="collapseOne" class="accordion-collapse collapse" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
                    <div class="accordion-body">
                        무통장입금, 실시간 계좌이체 결제 시 신청 가능하며,<br>
                        '주문서 작성'또는 '마이페이지 > 주문내역조회 > 주문번호 > 상세하단'에서 신청 가능합니다.
                        <br><br>
                        *부가가치세법 제 54조에 의거하여 세금계산서는<br>
                        배송완료일로부터 다음달 10일 까지만 요청하실 수 있습니다.
                    </div>
                </div>
                </div>

                <div class="accordion-item">
                <h2 class="accordion-header" id="headingTwo">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                        세금계산서를 상품과 동봉해주세요
                    </button>
                </h2>
                <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
                    <div class="accordion-body">
                        전자세금계산서 발급 의무화에 따라 이메일로만 발급되게 됩니다.<br>
                        기재하신 이메일을 통해 국세청에서 발급한 전자 세금 계산서 출력이 가능합니다.
                    </div>
                </div>
                </div>

                <div class="accordion-item">
                <h2 class="accordion-header" id="headingThree">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                        거래명세서 출력 가능한가요?
                    </button>
                </h2>
                <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
                    <div class="accordion-body">
                        마이페이지 > 주문상세조회 > 하단> 거래명세서 출력 가능합니다.<br>
                        (비회원 주문 시 주문번호 입력 후 > 주문상세조회 > 하단 > 거래명세서 출력 가능합니다.)
                    </div>
                </div>
                </div>

                <div class="accordion-item">
                <h2 class="accordion-header" id="headingFour">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
                        견적서 출력 가능한가요?
                    </button>
                </h2>
                <div id="collapseFour" class="accordion-collapse collapse" aria-labelledby="headingFour" data-bs-parent="#accordionExample">
                    <div class="accordion-body">
                        견적서 출력은 아래의 순서로 진행하시면 됩니다.
                        <br><br>
                        1.견적서 출력할 상품을 장바구니에 담은 후<br>
                        2.장바구니 하단에 견적서 출력 버튼 클릭
                        <br><br>
                        파일 다운로드 또는 견적서를 출력하실 수 있습니다.
                    </div>
                </div>
                </div>

            </div>                        
            <!--Accordion부분-->
        </div>
                                <!--4번탭-->

        </div>
      </section>
    <!--NAV바 부분-->
</div>
	</section>
	<!--footer-->
	<footer class="footer">
			<div class="row text-center">
				<div>
					<div class="copyright_content">고객님은 안전거래를 위해 결제시 저희 쇼핑몰에서 가입한
						구매안전 서비스를 이용하실 수 있습니다</div>
				</div>
			</div>
	</footer>
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
	<script src="../resources/js/hamber.js"></script>

</body>
</html>