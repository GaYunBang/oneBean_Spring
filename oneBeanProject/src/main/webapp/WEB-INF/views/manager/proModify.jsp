<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.ezen.vo.*"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품수정</title>
<style type="text/css">
	.box{
		width: 200px;
		height: 200px;
	}
</style>
<script src="/js/jquery-3.6.0.min.js"></script>
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
<form name="form1" method="post" action="proModify.do" enctype="multipart/form-data">
<input type="hidden" value="${product.proIdx}" name="proIdx">
상품이름 : <input type="text" value="${product.proName}" name="proName"><br>
상품가격 : <input type="text" value="${product.proPrice}" name="proPrice"><br>
사업자 상품 가격 : <input type="text" value="${product.proPrice2}" name="proPrice2"><br>
재고 : <input type="text" value="${product.proStock}" name="proStock"><br>
<div>상품타입
	<select name="proType">
		<option value="${proType}" selected>${product.proType}</option>
		<option value="일반">일반상품</option>
		<option value="사업자">사업자상품</option>
		<option value="샘플박스">샘플박스상품</option>
		<option value="이벤트">이벤트</option>
	</select>
</div>
내용 <textarea name="proContents" id="proContents">${product.proContents}</textarea><br>
<hr>이미지 자리<br>
<div class="inputArea">
 <label for="proImg">상품이미지</label>
 	<input type="file" id="file" name="file" />
	 <div class="select_img">
	  <img src="${product.proImg}" class="box"/>
	  <input type="hidden" name="file" value="${product.proImg}" />
	 </div>
	 <label for="proDetailImg">상품상세이미지</label>
	 <input type="file" id="detailFile" name="detailFile" />
	 <div class="select_img2">
	  <img src="${product.proDetailImg}" class="box"/>
	  <input type="hidden" name="detailFile" value="${product.proDetailImg}" /> 
	 </div>
 
 <script>
  $("#file").change(function(){
   if(this.files && this.files[0]) {
    var reader = new FileReader;
    reader.onload = function(data) {
     $(".select_img img").attr("src", data.target.result).width(500);        
    }
    reader.readAsDataURL(this.files[0]);
   }
  });
  
  $("#detailFile").change(function(){
	   if(this.files && this.files[0]) {
	    var reader = new FileReader;
	    reader.onload = function(data) {
	     $(".select_img2 img").attr("src", data.target.result).width(500);        
	    }
	    reader.readAsDataURL(this.files[0]);
	   }
	  });
 </script>
 <%=request.getRealPath("/") %>
</div>


<input type="submit" value="수정">
</form>
</section>
</body>
</html>