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
		<div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
			<div id="carouselExampleFade" class="carousel slide carousel-fade" data-bs-ride="carousel">
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img src="/images/index_image1.jpg" class="d-block w-100" alt="메인사진1">
					</div>
					<div class="carousel-item">
						<img src="/images/index_image2.jpg" class="d-block w-100" alt="메인사진2">
					</div>
					<div class="carousel-item">
						<img src="/images/index_image3.jpg" class="d-block w-100" alt="메인사진3">
					</div>
					<div class="carousel-item">
						<img src="/images/index_image4.jpg" class="d-block w-100" alt="메인사진4">
					</div>
				</div>
				<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Previous</span>
				</button>
				<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Next</span>
				</button>
			</div>
		</div>
	</section>
	<!--footer-->
	<footer class="footer">
			
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
	<script src="/js/hamber.js"></script>
</body>
</html>