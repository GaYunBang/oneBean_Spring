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
<link href="<%=request.getContextPath() %>/css/product/proDetail.css" rel="stylesheet" />

<link rel="shortcut icon" type="image/x-icon"
	href="<%=request.getContextPath() %>/images/titlelogo.png" />
<title>상품 상세페이지</title>

<!-- fontawesome 주소 -->
<script src="https://kit.fontawesome.com/be3783bb1d.js" crossorigin="anonymous"></script>
<!--햄버거 제이쿼리-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
<!-- jquery 불러오기 -->
<script src="<%=request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	function cartGO(idx) {
		var count = $(".select_option").find("option:selected").val();
		var cartPrice = $("#showPrice").text().replace("원","").replaceAll(",","");
	
		if (count == 0)
			{alert("수량을 선택해주세요");
			return;}
		else
			{
			if(confirm("장바구니에 담으시겠습니까?")){
				$.ajax({
					url:"<%=request.getContextPath() %>/Purchase/addCart.do",
					data:{"proIdx":idx,"cartCount":count,"cartPrice":cartPrice},
					success:function(data){
						if(confirm("확인을 클릭하시면 장바구니로 이동합니다.")){
							location.href="<%=request.getContextPath() %>/Purchase/cartList.do";
						}
					},
					error:function(){
						alert("error");
					}
				});
			}
		}
	}
	
	function orderGO(proIdx) {
		var count = $(".select_option").find("option:selected").val();
		var orderPrice = $("#showPrice").text().replace("원","").replaceAll(",","");
		if (count == 0){
			alert("수량을 선택해주세요");
			return;
		}else{
			if(confirm("주문하시겠습니까?")){
				location.href="<%=request.getContextPath() %>/Purchase/order.do?proIdx="+proIdx+"&orderCount="+count+"&orderPrice="+orderPrice;
			}
		}
	}
	
	function showPriceFn(proPrice,obj){
		var value = Number($(obj).find("option:selected").val());
		var proPrice = Number(proPrice);
		var totalPrice = value*proPrice;
		$("#showPrice").text(totalPrice.formatNumber()+"원");
	}
	
	Number.prototype.formatNumber = function(){
	    if(this==0) return 0;
	    let regex = /(^[+-]?\d+)(\d{3})/;
	    let nstr = (this + '');
	    while (regex.test(nstr)) nstr = nstr.replace(regex, '$1' + ',' + '$2');
	    return nstr;
	};
	$(document).ready(function(){
	});
</script>
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
	<div class="content pt-4 mb-5">
        <div class="container-xxl">
            <div class="row">
                <div class="col-12 col-md-4">
                    <img class="pt-0 p-sm-4" src="<%=request.getContextPath() %>${dto.proImg}" width="100%">
                </div>
                <div class="col-12 col-md-7">
                    <div>
                        <form name="list_to_orderAction" method="post">
                        <input type="hidden" name="proIdx" value="${dto.proIdx}">
                            <span class="goods_subject p-4">${dto.proName}</span>
                            <div class="price_box p-4">
                                <span class="price">판매가격 : </span>
                                <span class="discount-rate"><span class="discount-rate2"></span><span>10%</span></span>
                                <span><span class="price"><fmt:formatNumber value="${dto.proPrice2}" pattern="###,###,### 원" /></span></span>
                                <span class="consumer"><fmt:formatNumber value="${dto.proPrice2*1.1}" pattern="###,###,### 원" /></span>
                            </div>
                            <div class="op_box">
                                <div class="">
	                                  <div class="row col-12 p-4">
	                                    <pre class="op_title">${dto.proContents}</pre>	                                    
                                    </div>
                                </div>                                
                            </div>                                                        
                            <div class="btn_box">
                            <div class="row d-flex pt-3 justify-content-center">
                                <select class="select_option" name="cartCount" onchange="showPriceFn(${dto.proPrice2},this);">
                                    <option value="0">수량</option>
                                    <c:forEach var="i" begin="1" end="10">
                                    	<option value="${i}">${i } (+ ${dto.proPrice2*(i-1)})</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="text_right">
                            <span class="txt0">『</span>
                            <span class="txt1">총 상품 금액(수량) : </span><span name="cartPrice" id="showPrice" class="txt2"></span>
                            <span class="txt0">』</span></div>
                            <div class="row d-flex justify-content-evenly mt-3 pt-1"> <!--mt는 버튼 사이 간격/pt는 위아래 간겨-->
                                 <c:if test="${member == null}">
									<a href="<%=request.getContextPath() %>/Member/login.do" class="btn_ship">장바구니</a>
									<a href="<%=request.getContextPath() %>/Member/login.do" class="btn_shop">주문하기</a>
								</c:if>
								<c:if test="${member != null}">
                               		<a href="javascript:cartGO(${dto.proIdx })" class="btn_ship">장바구니</a>
                               		<a href="javascript:orderGO(${dto.proIdx })" class="btn_shop">주문하기</a>
                               	</c:if> 
                            </div>
                            </div>                          
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <img class="foot_img" src="<%=request.getContextPath() %>${dto.proDetailImg}">
</section>
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