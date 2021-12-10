<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="com.ezen.vo.*"%>
<%@ page session="true"%>
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
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" />

<!-- 스타일 -->
<link href="/css/index/header.css" rel="stylesheet" />
<link href="/css/index/footer.css" rel="stylesheet" />
<link href="/css/index/search.css" rel="stylesheet" />
<link href="/css/member/memInfoModify.css" rel="stylesheet" />

<link rel="shortcut icon" type="image/x-icon"
	href="/images/titlelogo.png" />
<title>회원정보 수정</title>

<!-- fontawesome 주소 -->
<script src="https://kit.fontawesome.com/be3783bb1d.js"
	crossorigin="anonymous"></script>

<!--햄버거 제이쿼리-->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
<script src="/js/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {
		$(".check").blur(function(){
			var checkPwd = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
			var checkEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/g;
			
			var value = $(this).val();
            var col1 = $(this).parent().prev();
            
            if(value == ("" |0)){
            	col1.css("color","red");
            }else if(name == "memberPwd"){
        		var test = checkPwd.test(value);
        		if(!test){
        			col1.css("color","red");
        		}else{
        			col1.css("color","black");
        		}
        	}else if(name == "memberPwdCheck"){
        		if(value != $("#memberPwd").val()){
        			alert("비밀번호가 다릅니다");
        			col1.css("color","red");
        		}else{
        			col1.css("color","black");
        		}
        	}else if(name == "memberEmail"){
        		var test = checkEmail.test(value);
        		if(!test){
        			col1.css("color","red");
        		}else{
        			col1.css("color","black");
        		}
        	}
		)};
		
		$("form").submit(function(){
			var checkPwd = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
			var check=true;
			var first;
			$(".check").each(function(index){
				var value = $(this).val();
				var col1 = $(this).parent().prev();
				if(value==""){
					check = false;
					if(first===undefined){
						first = index;
					}
				}else{
					var name = $(this).attr("name");
					if(name == "memberPwd"){
						var test = checkPwd.test(value);
						if(!test){
							col1.css("color","red");
							check = false;
						}
					}else if(name == "memberEmail"){
						var test = checkEmail.test(value);
						if(!test){
							col1.css("color","red");
							check = false;
						}
					}
				}
			});
		});
		
		
	)};
</script>
</head>
<body>
	<header class="fixed-top">
		<div class="top__banner">
			<a href="/Regular/regularList.do"> 매주 월요일 신성한 원두로 홈카페! <span
				class="colchange">정기구독 하러 가기~♪</span></a>
		</div>
		<div class="titleLogo">
			<a href="/"><img src="/images/maintitle.png" /></a>
		</div>
		<nav class="navigation">
			<!--햄버거 설정 class="bar" / "fa-2x"->사이즈 조절-->
			<a href="#none" class="navbar_toggleBtn"> <span></span></a>
			<ul class="first_nav">
				<li class="change"><a class="eng" href="/Etc/about.do">ABOUT</a>
					<a class="kor" href="/Etc/about.do">회사소개</a></li>
				<li class="change"><a class="eng" href="#none">SHOP</a> <a
					class="kor" href="#none">상품</a>
					<ul class="under_view">
						<li><a href="/Product/proListAll.do">모든상품</a></li>
						<li><a href="/Regular/regularList.do">정기구독</a></li>
						<li><a href="/Product/coffeeProList.do">커피용품</a>
							<hr class="line"></li>
					</ul></li>
				<li class="change"><a class="eng" href="#none">EVENT</a> <a
					class="kor" href="#none">이벤트</a>
					<ul class="under_view">
						<li><a href="/Product/newProduct.do">새상품</a></li>
						<li><a href="/Product/sampleBoxList.do">샘플BOX</a>
							<hr class="line"></li>
					</ul></li>
				<li class="change"><a class="eng" href="#none">WHOLESALE</a> <a
					class="kor" href="#none">도매</a>
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
							<li><a href="/Member/login.do">커피용품</a>
							<hr class="line"></li>
						</c:if>
						<c:if test="${member != null }">
							<li><a href="/Product/coffeeProList.do">커피용품</a>
							<hr class="line"></li>
						</c:if>
					</ul></li>
				<li><a href="#none">고객센터</a>
					<ul class="under_view">
						<!-- 로그인 안했을때 -->
						<c:if test="${member == null}">
							<li><a href="/Member/login.do" title="">Q&A</a></li>
							<li><a href="/Member/login.do" title="">문의사항</a>
							<hr class="line"></li>
						</c:if>
						<!-- 로그인 했을때 -->
						<c:if test="${member != null}">
							<li><a href="/Etc/faq.do">Q&A</a></li>
							<li><a href="/Question/list.do">문의사항</a>
							<hr class="line"></li>
						</c:if>
					</ul></li>
			</ul>
			<form class="search_form" name="frm" action="" method="get">
				<ul id="right_nav">
					<li class="icon"><a href="#none"><i class="bi bi-person"
							style="font-size: 30px;"></i></a>
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
						<li class="icons"><a href="/Member/login.do"><i
								class="bi bi-cart3"></i></a></li>
					</c:if>
					<c:if test="${member != null}">
						<li class="icons"><a href="/Purchase/cartList.do"><i
								class="bi bi-cart3"></i></a></li>
					</c:if>
					<li class="search_box"><input type="text" class="search_txt"
						name="keyword" placeholder="Type to search" maxlength="20">
						<button class="icons search_btn">
							<i class="bi bi-search"></i>
						</button></li>
				</ul>
			</form>
		</nav>
	</header>
	<section>
		<form method="post" action="memInfoModify.do">
			<div class="container">
				<div class="insert">

					<table>
						<caption>
							<h2>회원정보 수정</h2>
						</caption>
						<tr>
							<td class="col1">이름</td>
							<td class="col2"><input type="text" class="deco1"
								name="memberName" maxlength="5" value="${member.memberName }"
								readonly></td>
						</tr>
						<tr>
							<td class="col1">아이디</td>
							<td class="col2"><input type="text" class="deco1"
								name="memberId" maxlength="10" value="${member.memberId }"
								readonly></td>
						</tr>
						<tr>
							<td class="col1">생년월일</td>
							<td class="col2"><c:set var="yearNum" value="${member.memberBirth }" /> 
								<c:set var="year" value="${fn:substring(yearNum,0,4) }" /> 
								<input type="text" class="birth1" name="birth1" value="${year }" readonly>년&nbsp;
								
								<c:set var="monthNum" value="${member.memberBirth }" /> 
								<c:set var="month" value="${fn:substring(monthNum,5,7) }" /> 
								<input type="text" class="birth2" name="birth2" value="${month }" readonly>월&nbsp;
								 
								<c:set var="dayNum" value="${member.memberBirth }" /> 
								<c:set var="day" value="${fn:substring(dayNum,8,10) }" /> 
								<input type="text" class="birth3" name="birth3" value="${day }" readonly>일
							</td>
						</tr>
						<tr>
							<td class="col1">비밀번호<span class="red"> *</span></td>
							<td class="col2"><input type="password"
								class="deco pwd check" name="memberPwd" id="memberPwd"
								maxlength="16"> 
							<!-- <input class='but1' type="button" value="수정하기" onclick=""> -->
								<p>※비밀번호는 <span class="num">문자, 숫자, 특수문자(~!@#$%^&*)의 조합 8 ~
										15자리</span>로 입력이 가능합니다.
								</p></td>
						</tr>
						<tr>
							<td class="col1">비밀번호 확인</td>
							<td class="col2"><input type="password"
								class="deco pwdCheck check" name="memberPwdCheck" maxlength="16"></td>
						</tr>
						<tr>
							<td class="col1">이메일</td>
							<td class="col2">
								<input type="text" class="deco"
									name="memberEmail" value="${member.memberEmail }">
								<!-- <input class='but1' type="button" value="수정하기" onclick=""> -->
							</td>
						</tr>
						<tr>
							<td class="col1">전화번호</td>
							<td class="col2" name="memberPhone">
							<input type="text" name="memberPhone" value="${member.memberPhone }" class="deco">
								<!--<c:set var="Num" value="${member.memberPhone }"/>
	            				<c:set var="pNum1" value="${fn:substring(Num,0,3) }"/>
                  				<input type="text" class="phone2" name="phone1" maxlength="4" 
                  					value="${pNum1 }" >
								<c:set var="Num2" value="${member.memberPhone }" /> 
								<c:set var="pNum2" value="${fn:substring(Num2,3,7) }" /> 
								<input type="text" class="phone2" name="phone2" maxlength="4"
									value="${pNum2 }"> 
								<c:set var="Num3" value="${member.memberPhone }" /> 
								<c:set var="pNum3" value="${fn:substring(Num3,7,11) }" /> 
								<input type="text"
									class="phone3" name="phone3" maxlength="4" value="${pNum3 }">
									<!-- <input class='but1' type="button" value="수정하기" onclick="">  -->
							</td>
						</tr>
					</table>
				</div>
				<div class="create">
					<input class="but3" type="button" value="수정취소"
						onclick="history.back()"> 
					<input class="but4"
						type="submit" value="수정완료">
				</div>
			</div>
		</form>
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
	<!-- 위치 옮기지 않기 -->
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