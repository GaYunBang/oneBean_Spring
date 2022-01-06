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
<link href="<%=request.getContextPath() %>/css/index/header.css" rel="stylesheet" />
<link href="<%=request.getContextPath() %>/css/index/footer.css" rel="stylesheet" />
<link href="<%=request.getContextPath() %>/css/index/search.css" rel="stylesheet" />
<link href="<%=request.getContextPath() %>/css/manager/write.css" rel="stylesheet" />

<link rel="shortcut icon" type="image/x-icon"
	href="<%=request.getContextPath() %>/images/titlelogo.png" />
<title>상품수정</title>

<!-- fontawesome 주소 -->
<script src="https://kit.fontawesome.com/be3783bb1d.js" crossorigin="anonymous"></script>
<!--햄버거 제이쿼리-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
<!-- jquery 불러오기 -->
<script src="<%=request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#file").change(
				function() {
					if (this.files && this.files[0]) {
						var reader = new FileReader;
						reader.onload = function(data) {
							$(".select_img img").attr("src",
									data.target.result).width(500);
						}
						reader.readAsDataURL(this.files[0]);
					}
				});
		$("#detailFile").change(
				function() {
					if (this.files && this.files[0]) {
						var reader = new FileReader;
						reader.onload = function(data) {
							$(".select_img2 img").attr("src",
									data.target.result).width(500);
						}
						reader.readAsDataURL(this.files[0]);
					}
				});
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
<section id="section">
<!-- D:\git\oneBean_Spring\oneBeanProject\src\main\webapp\resources -->
<img class="title_image" src="<%=request.getContextPath() %>/images/상품등록.png">
	<form name="form1" class="frm" method="post" action="<%=request.getContextPath() %>/Manager/regModify.do" enctype="multipart/form-data">
		<input type="hidden" value="${regular.regIdx}" name="regIdx">
		<table class="write_table">
			<tr>
				<th>구독 상품명</th>
				<td><input type="text" value="${regular.regName}" name="regName" class="inp"></td>
			</tr>
			<tr>
				<th>가격</th>
				<td><input name="regPrice" id="regPrice" value="${regular.regPrice}" class="inp"></td>
			</tr>
			<tr>
				<th>재고</th>
				<td><input name="regStock" id="regStock" value="${regular.regStock}" class="inp"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="regContents" id="regContents" class="inp">${regular.regContents}</textarea></td>
			</tr>
			<tr>
				<th>구독 상품 이미지</th>
				<td><input type="file" id="file" name="file" class="mid" value="<%=request.getContextPath() %>${regular.regImg}">
					<div class="select_img"><img src="<%=request.getContextPath() %>${regular.regImg}"></div>
				</td>
			</tr>
			<tr>
				<th>구독 상품 상세 이미지</th>
				<td><input type="file" id="detailFile" name="detailFile" class="mid" value="<%=request.getContextPath() %>${regular.regDetailImg}">
					<div class="select_img2"><img src="<%=request.getContextPath() %>${regular.regDetailImg}"></div>
				</td>
			</tr>
		</table>
		<div class="butg">
			<input type="submit" class="but4" value="수정">
			<input type="button" class="but3" value="취소" onclick="history.back()">
		</div>
	</form>
</section>
</body>
</html>