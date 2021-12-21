<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
<link href="<%=request.getContextPath() %>/css/index/header.css" rel="stylesheet" />
<link href="<%=request.getContextPath() %>/css/index/footer.css" rel="stylesheet" />
<link href="<%=request.getContextPath() %>/css/index/search.css" rel="stylesheet" />
<link href="<%=request.getContextPath() %>/css/purchase/payApply.css" rel="stylesheet" />

<link rel="shortcut icon" type="image/x-icon"
	href="<%=request.getContextPath() %>/images/titlelogo.png" />
<title>결제하기</title>

<!-- fontawesome 주소 -->
<script src="https://kit.fontawesome.com/be3783bb1d.js" crossorigin="anonymous"></script>
<!--햄버거 제이쿼리-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
<!-- jquery 불러오기 -->
<script src="<%=request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
<!--결제API-->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript">
	$(document).ready(function(){
		var ship = Number($("#ship").text().replace(",","").replace("원",""));
		var totalPrice=0;
		$(".table_box tbody tr").each(function(){
			var onePrice = $(this).find(".price").text().replace(",","").replace("원","");
			totalPrice += Number(onePrice);
		});
		if(totalPrice > 50000){
			$("#ship").text("0원");
		}
		totalPrice += ship;
		$("input[name='payTotalPrice']").val(totalPrice);
		$("#totalSettlePrice").text(totalPrice.formatNumber());
		
		$("#check01").click(function() {
			if($("#check01").prop("checked"))
				$(".check_item").prop("checked", true);
			else $(".check_item").prop("checked", false);
		});
		
		$(".check_item").click(function() {
			var total = $(".check_item").length;
			var checked = $(".check_item:checked").length;
			
			if(total != checked) $("#check01").prop("checked", false);
			else $("#check01").prop("checked", true); 
		});
		
		console.log($("[name='cartIdxs']"));
		console.log($("[name='proIdx']"));
	});
	
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
				}else if(jibunAddr !== ''){
					document.getElementById("member_addr").value = jibunAddr;
				}
			}
		}).open();
	}
	function requestPay(){
		var agreeCheck = $("#check01").is(":checked");
		var form = $("[name='order_form']");
		
		if(agreeCheck==false){
			alert("필수 사항을 동의해야 합니다.");
		}else{
			if (form.find("[name='postName']").val()==""){
				alert("받으실분을 입력해 주십시오.");
				form.find("[name='postName']").focus();
				
			}else if(form.find("[name='postPhone']").val()==""){
				alert("받으실분의 연락처를 입력해 주십시오.");
				form.find("[name='postPhone']").focus();
				
			}else if(form.find("#member_post").val()==""){
				alert("우편번호를 입력해 주십시오.");
				$("#member_post").focus();
				
			}else if(form.find("#member_addr").val()==""){
				alert("도로명/지번주소를 입력해 주십시오.");
				$("#member_addr").focus();
				
			}else if(form.find("#member_detail_addr").val()==""){
				alert("상세주소를 입력해 주십시오.");
				$("#member_detail_addr").focus();
				
			}
		}
		if(document.getElementById('scard').checked) {
			//가맹점 식별코드
			IMP.init('imp85121355');
			IMP.request_pay({
				pg : 'kcp',
				pay_method : 'card',
				merchant_uid : 'merchant_' + new Date().getTime(),
				name : '상품1' , //결제창에서 보여질 이름
				amount : 100, //실제 결제되는 가격
				buyer_email : 'iamport@siot.do',
				buyer_name : '구매자이름',
				buyer_tel : '010-1234-5678',
				buyer_addr : '서울 강남구 도곡동',
				buyer_postcode : '123-456'
			}, function(rsp) {
				console.log(rsp);
				if ( rsp.success ) {
					var msg = '결제가 완료되었습니다.';
					msg += '고유ID : ' + rsp.imp_uid;
					msg += '상점 거래ID : ' + rsp.merchant_uid;
					msg += '결제 금액 : ' + rsp.paid_amount;
					msg += '카드 승인번호 : ' + rsp.apply_num;
				}else{
					var msg = '결제에 실패하였습니다.';
					msg += '에러내용 : ' + rsp.error_msg;
				}alert(msg);
			});
		}else if(document.getElementById('mootong').checked){
			form.submit();
		}
		
	}
	
	//주문자와 동일 버튼 눌렀을 때
	function sameShip(){
		var name = $("input[name='payName']").val();
		var phone = $("input[name='payPhone']").val();
		$("input[name='postName']").val(name);
		$("input[name='postPhone']").val(phone);
	}
	
	Number.prototype.formatNumber = function(){
		if(this==0) return 0;
		let regex = /(^[+-]?\d+)(\d{3})/;
		let nstr = (this + '');
		while (regex.test(nstr)) nstr = nstr.replace(regex, '$1' + ',' + '$2');
		return nstr;
	};
</script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
<header class="fixed-top">
	<div class="top__banner">
		<a href="<%=request.getContextPath() %>/Regular/regularList.do"> 매주 월요일 신성한 원두로 홈카페! <span class="colchange">정기구독 하러 가기~♪</span></a>
	</div>
	<div class="titleLogo">
		<a href="<%=request.getContextPath() %>/"><img src="<%=request.getContextPath() %>/images/maintitle.png" /></a>
	</div>
	<nav class="navigation">
		<!--햄버거 설정 class="bar" / "fa-2x"->사이즈 조절-->
		<a href="#none" class="navbar_toggleBtn"> <span></span></a>
		<ul class="first_nav">
			<li class="change">
				<a class="eng" href="<%=request.getContextPath() %>/Etc/about.do">ABOUT</a>
				<a class="kor" href="<%=request.getContextPath() %>/Etc/about.do">회사소개</a>
			</li>
			<li class="change">
				<a class="eng" href="#none">SHOP</a>
				<a class="kor" href="#none">상품</a>
				<ul class="under_view">
					<li><a href="<%=request.getContextPath() %>/Product/proListAll.do">모든상품</a></li>
					<li><a href="<%=request.getContextPath() %>/Regular/regularList.do">정기구독</a></li>
					<li><a href="<%=request.getContextPath() %>/Product/coffeeProList.do">커피용품</a>
					<hr class="line"></li>
				</ul>
			</li>
			<li class="change">
				<a class="eng" href="#none">EVENT</a>
				<a class="kor" href="#none">이벤트</a>
				<ul class="under_view">
					<li><a href="<%=request.getContextPath() %>/Product/newProduct.do">새상품</a></li>
					<li><a href="<%=request.getContextPath() %>/Product/sampleBoxList.do">샘플BOX</a>
					<hr class="line"></li>
				</ul>
			</li>
			<li class="change">
				<a class="eng" href="#none">WHOLESALE</a>
				<a class="kor" href="#none">도매</a>
				<ul class="under_view">
					<c:if test="${member == null}">
						<li><a href="<%=request.getContextPath() %>/Member/login.do">납품신청</a></li>
					</c:if>
					<c:if test="${member != null}">
						<c:if test="${memberGrade == 1}">
							<li><a href="<%=request.getContextPath() %>/Buisness/deliveryApply.do">납품신청</a></li>
						</c:if>
						<c:if test="${memberGrade != 1}">
							<li><a href="<%=request.getContextPath() %>/Buisness/buisnessProductList.do">납품신청</a></li>
						</c:if>
					</c:if>
					<li><a href="<%=request.getContextPath() %>/Buisness/newShopQuestion.do">창업문의</a></li>
					<c:if test="${member == null }">
						<li><a href="<%=request.getContextPath() %>/Member/login.do">커피용품</a><hr class="line"></li>
					</c:if>
					<c:if test="${member != null }">
						<li><a href="<%=request.getContextPath() %>/Product/coffeeProList.do">커피용품</a><hr class="line"></li>
					</c:if>
				</ul>
			</li>
			<li><a href="#none">고객센터</a>
				<ul class="under_view">
					<!-- 로그인 안했을때 -->
					<c:if test="${member == null}">
						<li><a href="<%=request.getContextPath() %>/Etc/faq.do">Q&A</a></li>
						<li><a href="<%=request.getContextPath() %>/Member/login.do" title="">문의사항</a><hr class="line"></li>
					</c:if>
					<!-- 로그인 했을때 -->
					<c:if test="${member != null}">
						<li><a href="<%=request.getContextPath() %>/Etc/faq.do">Q&A</a></li>
						<li><a href="<%=request.getContextPath() %>/Question/list.do">문의사항</a><hr class="line"></li>
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
							<li><a href="<%=request.getContextPath() %>/Member/login.do" title="">로그인</a></li>
							<li><a href="<%=request.getContextPath() %>/Member/join.do" title="">회원가입</a></li>
						</c:if>
						<!-- 로그인 했을때 -->
						<c:if test="${member != null}">
							<li><b>${member.memberName}님</b></li>
							<li><a href="<%=request.getContextPath() %>/Member/logout.do" title="">로그아웃</a></li>
							<li><a href="<%=request.getContextPath() %>/Member/myPage.do" title="">마이페이지</a></li>
							<li><a href="<%=request.getContextPath() %>/Purchase/orderList.do" title="">주문조회</a></li>
						</c:if>
					</ul></li>
				<c:if test="${member == null}">
					<li class="icons"><a href="<%=request.getContextPath() %>/Member/login.do"><i class="bi bi-cart3"></i></a></li>
				</c:if>
				<c:if test="${member != null}">
					<li class="icons"><a href="<%=request.getContextPath() %>/Purchase/cartList.do"><i class="bi bi-cart3"></i></a></li>
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
	<img class="title_image" src="/images/주문결제.png">
	<form name="order_form" method="post" action="<%=request.getContextPath() %>/Purchase/accountPay.do" onsubmit="requestPay();return false;">
		<input type="hidden" name="payTotalPrice">
		<div class="content pt-4">
			<div class="container-xxl">
				<span class="d-flex shop_bow_subject2 mt-5 mb-3">주문 상품</span>
				<!-- 주문상품 상단 -->
				<table class="table_box">
				<thead>
					<tr class="shop_box">
						<th class="sum_box"></th>
						<th class="top_1 "><span>상품/옵션 정보</span></th>
						<th class="top_2"><span>수량</span></th>
						<th class="top_2"><span>상품금액</span></th>
					</tr>
				</thead>
				<tbody>
				<!-- 상품 부분 -->
				<c:forEach var="list" items="${list}">
				<c:if test="${list.cartIdx != 0 }">
					<input type="hidden" value="${list.cartIdx }" name="cartIdxs">
				</c:if>
				<input type="hidden" value="${list.proIdx }" name="proIdx">
				<tr class="shop_box2">
					<td class="sum_box">
						<img src="<%=request.getContextPath() %>${list.proImg }" width="80px">
					</td>
					<td class="con_box">
						<span class="pro">${list.proName }<br>${list.proContents }</span>
					</td>
					<td class="top_3">
						<span class="pro">${list.orderCount}</span><input type="hidden" name="payOneCount" value="${list.orderCount}">
					</td>
					<td class="top_3">
						<span class="pro price"><fmt:formatNumber value="${list.orderPrice}" pattern="###,###,### 원" /></span>
						<input type="hidden" name="payOnePrice" value="${list.orderPrice}">
					</td>
				</tr>
				</c:forEach>
				</tbody>
				</table>
				
				<span class="d-flex shop_bow_subject2 mt-5 mb-3">주문자 정보</span>
				<!-- 주문자 정보 -->
				<div class="shop_box mt-2 py-3">
					<div class="d-flex align-items-center pb-4">
						<span class="px-3 name_subject">주문자<span class="color_red">*</span></span>
						<input type="text" class="order_txt" name="payName" value="${member.memberName}">
					</div>
					<div class="d-flex align-items-center pb-4">
						<span class="px-3 name_subject">휴대폰<span class="color_red">*</span></span>
						<input type="text" class="order_txt" name="payPhone" value="${member.memberPhone}">
					</div>
					<div class="d-flex align-items-center">
						<span class="px-3 name_subject">이메일<span class="color_red">*</span></span>
						<input type="text" class="order_txt" name="payEmail" value="${member.memberEmail}">
					</div>
				</div>
				
				<span class="d-flex shop_bow_subject2 mt-5 mb-3">배송 정보</span>
				<!-- 배송 정보 -->
				<div class="shop_box mt-2 py-3">
					<div class="d-flex align-items-center pb-0 pb-sm-4 ms-sm-1 ms-0 row" style="position: relative;">
						<span class="px-4 px-sm-3 pb-2 px-sm-0 name_subject">[배송지 선택]</span>
						<div class="d-flex py-3 pt-0 pt-sm-3">
							<label class="pe-3 d-flex align-items-center"><input type="radio" name="ship" value="기본배송지" class="mx-2" checked>기본 배송지</label>
							<label class="pe-3 d-flex align-items-center"><input type="radio" name="ship" value="최근배송지" class="mx-2">최근 배송지</label>
							<label class="pe-3 d-flex align-items-center"><input type="radio" name="ship" value="직접입력" class="mx-2">직접 입력</label>
							<button type="button" class="ship_btn" onclick="sameShip();">주문자 동일</button>
						</div>
					</div>
					<div class="d-flex align-items-center pb-4">
						<span class="px-3 name_subject">받으실 분<span class="color_red">*</span></span>
						<input type="text" class="order_txt" name="postName">
					</div>
					<div class="d-flex align-items-center pb-4">
						<span class="px-2 ms-1 px-sm-3 ms-sm-0  name_subject">휴대폰번호<span class="color_red">*</span></span>
						<input type="text" class="order_txt" name="postPhone">
					</div>
					<div class="d-flex align-items-center pb-4 row">
						<span class="px-4 ms-sm-3 ms-0 px-sm-3 name_subject pb-2 pb-sm-0 onesell">받으실 곳<span class="color_red">*</span></span>
						<div class="d-flex justify-content-center flex-column mb_address">
							<div class="d-flex">
								<input type="button" value="우편번호 검색" onclick="findAddr();" class="btn_post_search">
							</div>
							<input id="member_post"  class="order_txt" name="postNum" type="text" placeholder="우편 번호" readonly value="${addr.memberPostNum }">
							<input id="member_addr" class="order_txt" name="postAddr" type="text" placeholder="도로명주소/지번주소" readonly value="${addr.memberAddr }"><br>
							<input id="member_detail_addr" class="order_txt" name="postDetailAddr" type="text" placeholder="상세 주소를 입력해주세요." value="${addr.memberDetailAddr}">
						</div>
					</div>
				</div>
				
				<span class="d-flex shop_bow_subject2 mt-5 mb-3">배송</span>
				<!-- 배송 선택 -->
				<div class="shop_box mt-2 py-3">
					<div class="d-flex align-items-center pb-4">
						<span class="px-3 name_subject">배송방법<span class="color_red">*</span></span>
						<span class="dv_ment1">배송비 <span id="ship">3,000원</span> | 5만원 이상 무료배송</span>
					</div>
					<div class="d-flex align-items-center">
						<span class="px-3 name_subject">배송메세지</span>
						<input type="text" class="order_txt" name="postMemo" placeholder="배송 메시지를 입력해 주세요.">
					</div>
				</div>
				
				<span class="d-flex shop_bow_subject2 mt-5 mb-3">결제수단 선택</span>
				<!-- 배송 선택 -->
				<div class="shop_box mt-2 py-3 mb-3">
					<div class="d-flex align-items-center">
						<span class="px-1 px-sm-3 name_subject">일반결제</span>
						<label class="pe-3 d-flex align-items-center"><input type="radio" name="payType" value="무통장입금" class="mx-2" id="mootong" checked> 무통장 입금</label>
						<label class="pe-3 d-flex align-items-center"><input type="radio" name="payType" value="신용카드" class="mx-2" id="scard"> 신용카드</label>
						<label class="pe-3 d-flex align-items-center"><input type="radio" name="payType" value="계좌이체" class="mx-2" id="eche"> 계좌이체</label>
					</div>
				</div>
				<div id="checkWrap">
					<label for="check01"><input type="checkbox" id="check01" />전체 동의합니다.</label>
					<label for="check02"><input type="checkbox" id="check02" class="check_item"/>(필수) 개인정보 제공 동의</label>
					<label for="check03"><input type="checkbox" id="check03" class="check_item"/>(필수) 주문 상품정보에 동의</label>
					<label for="check04"><input type="checkbox" id="check04" class="check_item"/>(필수) 결제대행 서비스 이용을 위한 개인정보 제3자 제공 및 위탁동의</label>
				</div>
				<button class="order_main_btn"><span id="totalSettlePrice"></span> 원 결제하기</button>
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
					       통신판매업 신고 2020-용인기흥-1464호 &nbsp;&nbsp;&nbsp;<a href="#none">[사업자정보확인]</a><br>
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
<script src="<%=request.getContextPath() %>/js/hamber.js"></script>
</body>
</html>