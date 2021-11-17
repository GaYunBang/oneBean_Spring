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

<!--햄버거 css-->
<style>
	.loginFrm {
		text-align: center;
	}
	
	.login {
		width: 400px;
		height: 50px;
		border-style: none;
		border-bottom: 1px solid black;
	}
	
	.login:focus {
		outline: none;
		border-bottom: 3px solid black;
	}
	
	
	section form {
		padding: 150px 0px;
	}
</style>

<script src="https://kit.fontawesome.com/be3783bb1d.js"
	crossorigin="anonymous">
	
</script>

<!--햄버거 제이쿼리-->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>

<!-- 스타일 -->
<link href="/css/header.css" rel="stylesheet" />
<link href="/css/footer.css" rel="stylesheet" />
</head>
<body>
<header class="fixed-top">
		<div class="top__banner">
			<a href=".do"> 매주 월요일 신성한 원두로 홈카페! <span class="colchange">정기구독 하러 가기~♪</span></a>
		</div>
		<div class="titleLogo">
			<a href="/.do"><img src="/images/maintitle.png" /></a>
		</div>
		<nav class="navigation">
			<!--햄버거 설정 class="bar" / "fa-2x"->사이즈 조절-->
			<a href="#" class="navbar_toggleBtn"> <span></span>
			</a>
			<ul class="first_nav">
				<li class="change"><a class="eng" href="/Index/about.do">ABOUT</a>
					<a class="kor" href="/Index/about.do">회사소개</a></li>
				<li class="change"><a class="eng" href="#none">SHOP</a>
					<a class="kor" href="#none">상품</a>
					<ul class="under_view">
						<li><a href="/Product/allList.do">모든상품</a></li>
						<li><a href="/Regular/list.do">정기구독</a></li>
						<li><a href="/Product/goods.do">커피용품</a>
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
						<li><a href=".do">Q&A</a></li>
						<li><a href=".do">문의사항</a>
							<hr class="line"></li>
					</ul></li>
			</ul>
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
							<li><a href="/.do" title="">로그아웃</a></li>
							<li><a href="" title="">마이페이지</a></li>
							<li><a href="" title="">주문조회</a></li>
						</c:if>
					</ul></li>
				<li class="icons"><a href=".do"><i class="bi bi-search"></i></a></li>
				<li class="icons"><a href=".do"><i class="bi bi-cart3"></i></a></li>
			</ul>
		</nav>
	</header>
	<div class="empty_div"></div>
	<hr>
	
	
	<section>
		<div class="frmbox">
			<form method="post" action="login.do" class="loginFrm" name="login">
				<div class="form-group">
					<input type="text" class="login" name="userId" id="userID" placeholder="아이디를 입력하세요" />
				</div>
		 		<br>
				<div class="form-group">
					<input type="password" class="login" name="userPwd" id="userPwd" placeholder="비밀번호를 입력하세요" />
				</div>
				<br>
				<div class="form-group">
					<input type="submit" class="login" value="로그인" />
				</div><br>
				<c:if test="${msg == false}">
					<p class="text-warning">로그인 실패. 아이디, 비밀번호를 확인해주세요.</p>
				</c:if>
				<input type="checkbox">&nbsp;&nbsp;아이디 기억하기&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="checkbox">&nbsp;&nbsp;로그인 상태 유지<br><br>
				<a href="/co/join.do" title="">회원가입</a><br><br>
				아이디 / 비밀번호 찾기
			</form>
		</div>
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
					<div class="copyright-content">고객님은 안전거래를 위해 결제시 저희 쇼핑몰에서 가입한
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
	<script src="../resources/js/hamber.js"></script>
	<!-- Core theme JS-->
	<script src="../resources/js/scripts.js"></script>
	
</body>
</html>