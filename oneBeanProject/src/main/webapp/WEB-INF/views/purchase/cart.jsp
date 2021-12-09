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
<link href="/css/index/header.css" rel="stylesheet" />
<link href="/css/index/footer.css" rel="stylesheet" />
<link href="/css/index/search.css" rel="stylesheet" />
<link href="/css/purchase/cart.css" rel="stylesheet" />

<link rel="shortcut icon" type="image/x-icon"
	href="/images/titlelogo.png" />
<title>장바구니</title>

<!-- fontawesome 주소 -->
<script src="https://kit.fontawesome.com/be3783bb1d.js" crossorigin="anonymous"></script>
<!--햄버거 제이쿼리-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
<!-- jquery 불러오기 -->
<script src="/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#cartAllCheck").click(function(){
			if($("#cartAllCheck").prop("checked"))
				$(".check_item").prop("checked", true);
			else $(".check_item").prop("checked", false);
		});
		
		$(".check_item").click(function() {
			var total = $(".check_item").length;
			var checked = $(".check_item:checked").length;
			
			if(total != checked) $("#cartAllCheck").prop("checked", false);
			else $("#cartAllCheck").prop("checked", true); 
		});
		
		var totalSum = 0;
		var shipPrice = 3000;
		var payPrice = 0;
		$(".cart_table tbody tr").each(function(){
			var count = $(this).find("option:selected").val();
			var price = $(this).find(".onePrice");
			var price_text = Number(price.text());
			price.text((price_text*count).formatNumber()+"원");
			totalSum += Number(price.text().replace("원","").replaceAll(",",""));
		});
		if(totalSum > 50000){
			shipPrice = 0;
		}
		payPrice = totalSum + shipPrice;
		$("#totalSum").text(totalSum.formatNumber()+"원");
		$("#shipPrice").text(shipPrice.formatNumber()+"원");
		$("#payPrice").text(payPrice.formatNumber()+"원");
		/*
		$(".select_option").on("change",function(){
			var count = $(this).find("option:selected").val();
			var price = $(this).parent().next().find(".onePrice")
			var price_text = Number(price.text().replace("원","").replaceAll(",","").trim());
			
			for (var i=1;i<=10;i++){
				if(count == i){
					alert(count);
					price.text((price_text*i).formatNumber()+"원");
				}
			}.
			if(count == 1){
				price.text((price_text+8000).formatNumber()+"원");
			}else if(count == 2){
				price = price+8000;
			}else if(count == 3){
				alert("ss")
			}
		});*/
	});
	function changeCount(price,obj) {
		var count = $(obj).find("option:selected").val(); 
		var priceSpan = $(obj).parent().next().find(".onePrice");
		for (var i=1;i<=10;i++){
			if(count == i){
				alert(count);
				priceSpan.text((price*i).formatNumber()+"원");
			}
		}
		var totalSum = 0;
		$(".cart_table tr").each(function(){
			totalSum += Number($(this).find(".onePrice").text().replace("원","").replaceAll(",",""));
		});
		$("#totalSum").text(totalSum);
	}
	function cartButtonDelete(cartIdx,obj) {
		$.ajax({
			url:"cartButtonDelete.do",
			data:"cartIdx="+cartIdx,
			success:function(data){
				var test = $(obj);
				test.parent().parent().remove();
				var allCount = $("#allCount").text();
				$("#allCount").text(allCount-1);
			},
			error:function(){
				alert("error");
			}
		});
	}
	
	function delAllItem(midx){
		$.ajax({
			url:"cartAllDelete.do",
			data:"midx="+midx,
			success:function(data){
				var allCount = $("#allCount").text();
				$("#allCount").text(0);
				$(".orderform").remove();
				var str = "<h2 class='cart_header'>장바구니</h2><div class='cartNoItem'>";
					str +="<div class='cartNoItem2'></div>";
					str +="<div class='cartNoItem3'>";
					str +="<i class='bi bi-exclamation-circle exclamation'></i><br>";
					str +="장바구니에 담겨 있는 상품이 없습니다.</div></div>";
				$("h2").html(str);
			},
			error:function(){
				alert("error");
			}
		});
	}
	
	Number.prototype.formatNumber = function(){
	    if(this==0) return 0;
	    let regex = /(^[+-]?\d+)(\d{3})/;
	    let nstr = (this + '');
	    while (regex.test(nstr)) nstr = nstr.replace(regex, '$1' + ',' + '$2');
	    return nstr;
	};
</script>
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
						<li><a href="/Product/coffeeProList.do">커피용품</a><hr class="line"></li>
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
<h2 class="cart_header">장바구니</h2>
<c:if test="${list.size()==0}">
	<div class="cartNoItem">
		<div class="cartNoItem2"></div>
		<div class="cartNoItem3">
			<i class="bi bi-exclamation-circle exclamation"></i><br>
			장바구니에 담겨 있는 상품이 없습니다.
		</div>
	</div>
	<div class="center_align">
		<button class="buttongroup1 but_col2" onclick="location.href='/Product/proListAll.do'">쇼핑하기</button>
		<button class="buttongroup1 but_col2" onclick="history.back()">돌아가기</button>
	</div>
</c:if>
<c:if test="${list.size() != 0}">
	<form name="orderform" id="orderform" method="post" class="orderform" action="order.do">
		
		<table class="cart_table">
			<thead>
			<tr>
				<th style="width: 8%;" class="check"><input id="cartAllCheck" type="checkbox" checked></th>
				<th style="width: 20%;">이미지</th>
				<th style="width: 21%;">상품명</th>
				<th style="width: 18%;">수량</th>
				<th style="width: 24%;">가격</th>
				<th style="width: 9%;">삭제</th>
			</tr>
			</thead>
			<tbody>
			<c:forEach var="list" items="${list}">
			<input type="hidden" name="proIdx" value="${list.proIdx }">
				<tr>
					<td class="check"><input class="check_item" type="checkbox" checked value="${list.cartIdx}" name="cartIdxs"></td>
					<td class="cartImg"><img src="${list.proImg}"/></td>
					<td>${list.proName}</td>
					<td>
						<select class="select_option" name="orderCount" onchange="changeCount(${list.proPrice},this)">
							<option value="${list.cartCount}" selected>${list.cartCount}</option>
							<% for (int i=1;i<=10;i++) {%>
								<option value="<%=i%>"><%=i%></option>
							<%}%>
						</select>
					</td>
					<td><span style="font-size:13px; font-weight:bold;" class="onePrice" name="orderPrice">${list.proPrice}</span></td>
					<td><button class="cartSmallButton" onclick="cartButtonDelete(${list.cartIdx},this)">삭제</button></td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
		<div class="right_align">
			<button class="buttongroup">선택 상품 삭제</button>
			<button class="buttongroup" onclick="delAllItem(${member.midx});">장바구니 비우기</button>
		</div>

		<div class="right_align">
			<span><b style="font-size: 15px">상품 수 : </b></span><span class="val1" id="allCount">${count }</span>
		</div><br>
		<table class="totalBox">
			<tr>
				<th class="font_st">합계</th>
				<th></th>
				<th class="font_st">배송비</th>
				<th></th>
				<th class="font_st">결제금액</th>
			</tr>
			<tr>
				<td id="totalSum"></td>
				<td><i class="fas fa-plus-circle"></i></td>
				<td id="shipPrice"></td>
				<td><i class="fas fa-pause-circle aa"></i></td>
				<td id="payPrice"></td>
			</tr>
		</table>
		<div class="center_align">
			<input type="submit" class="buttongroup1 but_col1 cmd" value="선택 상품 주문">
			
			<input class="buttongroup1 but_col2 cmd1" value="계속 쇼핑하기" onclick="location.href='/Product/proListAll.do'">
		</div>
	</form>
</c:if>
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
</body>
</html>