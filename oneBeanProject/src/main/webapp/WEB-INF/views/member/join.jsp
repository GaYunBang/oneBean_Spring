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
<link href="/css/index/header.css" rel="stylesheet" />
<link href="/css/index/footer.css" rel="stylesheet" />
<link href="/css/index/search.css" rel="stylesheet" />
<link href="/css/member/join.css" rel="stylesheet" />

<link rel="shortcut icon" type="image/x-icon" href="/images/titlelogo.png" />
<title>회원가입</title>

<script src="https://kit.fontawesome.com/be3783bb1d.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
<script src="/js/jquery-3.6.0.min.js"></script>
<script>

var idCheckYN = false;
var idCheckReset = false;


		function idCheck(){
			idCheckYN = true;
			if($("#memberId").val() != ""){
				$.ajax({
					url : "idCheck.do",
					type : "post",
					dataType : "json",
					data : {"memberId" : $("#memberId").val()},
					success : function(data){
						if(data > 0){
							alert("중복된 아이디입니다.");
						}else if(data == 0){
							idUseYN = true;
							alert("사용 가능한 아이디입니다.");
						}
					}
				})
			}else{
				alert("아이디를 입력하세요.");
			}
		}
		
		function idCheckReset(){
			idCheckYN = false;
		}


	 $(document).ready(function() {
		//체크박스 모두 체크
		$("#AgreeCheckAll").click(function() {
			if($("#AgreeCheckAll").prop("checked"))
				$(".check_item").prop("checked", true);
			else $(".check_item").prop("checked", false);
		});
		
		$(".check_item").click(function() {
			var total = $(".check_item").length;
			var checked = $(".check_item:checked").length;
			
			if(total != checked) $("#AgreeCheckAll").prop("checked", false);
			else $("#AgreeCheckAll").prop("checked", true); 
		});
		
		//col1 색변환
		$(".check").blur(function(){
			
			//정규식
			var checkId = /^[a-z]+[a-z0-9]{5,15}/g;
			var checkPwd = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
			var checkName = /^[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g;
			var checkEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/g;
			var checkPhone1 = /^[0-9]{3,4}/g;
			var checkPhone2 = /^[0-9]{3,4}/g;
			var checkYear = /^[0-9]{4}/g;
			var checkDay = /^[0-9]{1,2}/g;
			
            var value = $(this).val();
            var col1 = $(this).parent().prev();
            if(value == ("" |0)){
            	col1.css("color","red");
            }else{
            	var name = $(this).attr("name");
            	if(name == "memberName"){
            		var test = checkName.test(value);
            		if(!test){
            			col1.css("color","red");
            		}else{
            			col1.css("color","black");
            		}
            	}else if(name == "memberId"){
            		var test = checkId.test(value);
            		if(!test){
            			col1.css("color","red");
            		}else{
            			col1.css("color","black");
            		}
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
            	}else if(name == "birth1"){
            		var test = checkYear.test(value);
            		if(!test){
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
            	}else if(name == ("phone2")){
            		var test = checkPhone1.test(value);
            		if(!test){
            			col1.css("color","red");
            		}else{
            			col1.css("color","black");
            		}
            	}else if(name == ("phone3")){
            		var test = checkPhone2.test(value);
            		if(!test){
            			col1.css("color","red");
            		}else{
            			col1.css("color","black");
            		}
            	}
            }
        });
		
		//submit버튼 눌렀을때 focus
		$("form").submit(function(){
			var checkId = /^[a-z]+[a-z0-9]{5,15}/g;
			var checkPwd = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
			var checkName = /^[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g;
			var checkEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/g;
			var checkPhone1 = /^[0-9]{3,4}/g;
			var checkPhone2 = /^[0-9]{3,4}/g;
			var checkYear = /^[0-9]{4}/g;
			var checkDay = /^[0-9]{1,2}/g;
			
			var useCheck = $("#useCheck").is(":checked");
			if( useCheck ==true){
				//alert("체크");
			}else if(useCheck==false){
				alert("이용약관을 체크해야 함");
				return false;
			}			
			
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
					if(name == "memberName"){
						var test = checkName.test(value);
						if(!test){
							col1.css("color","red");
							check = false;
						}
					}else if(name == "memberId"){
						var test = checkId.test(value);
						if(!test){
							col1.css("color","red");
							check = false;
						}
					}else if(name == "memberPwd"){
						var test = checkPwd.test(value);
						if(!test){
							col1.css("color","red");
							check = false;
						}
					}else if(name == "birth1"){
						var test = checkYear.test(value);
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
					}else if(name == "phone2"){
						var test = checkPhone1.test(value);
						if(!test){
							col1.css("color","red");
							//console.log("1");
							check = false;
						}
					}else if(name == "phone3" ){
						var test = checkPhone2.test(value);
						if(!test){
							col1.css("color","red");
							//console.log("2");
							check = false;
						}
					}
				}
			});
			$(".check").eq(first).focus();
			return check;
		});
	});
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
						<li><a href="/Product/coffeeList.do">커피용품</a><hr class="line"></li>
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
	<form method="post" name="frm" action="join.do">
		<div class="container">
			<div class="insert">
				<table>
					<caption><h2>회원가입 양식</h2></caption>
					<tr>
						<td class="col1">이름<span class="red"> *</span></td>
						<td class="col2"><input type="text" name="memberName" id="memberName" maxlength="5" class="name check"></td>
					</tr>
					<tr>
						<td class="col1">아이디<span class="red"> *</span></td>
						<td class="col2">
							<input type="text" name="memberId" id="memberId" maxlength="10" class="id check">
							<input class='but1' type="button" value="중복확인" onclick="idCheck()">
						</td>
					</tr>
					<tr>
						<td class="col1">비밀번호<span class="red"> *</span></td>
						<td class="col2">
							<input type="password" name="memberPwd" id="memberPwd" maxlength="16" class="pwd check">
							<p>※비밀번호는 <span class="num">문자, 숫자, 특수문자(~!@#$%^&*)의 조합 10 ~ 16자리</span>로 입력이 가능합니다.</p>
						</td>
					</tr>
					<tr>
						<td class="col1">비밀번호 확인<span class="red"> *</span></td>
						<td class="col2"><input type="password" name="memberPwdCheck" maxlength="16" class="pwdCheck check"></td>
					</tr>
					<tr>
						<td class="col1">성별</td>
						<td class="col2">
							<input type="radio" name="memberGender" value="m" checked>남자
							<input type="radio" name="memberGender" value="f">여자
						</td>
					</tr>
					<tr>
						<td class="col1">생년월일<span class="red"> *</span></td>
						<td class="col2">
							<input type="text" name="birth1" placeholder="년(4자)" maxlength="4" class="birth1 check">년&nbsp;
							<select name="birth2" class="birth2 check">
								<option value="0">월</option>
			                    <option value="01">1월</option>
			                    <option value="02">2월</option>
			                    <option value="03">3월</option>
			                    <option value="04">4월</option>
			                    <option value="05">5월</option>
			                    <option value="06">6월</option>
			                    <option value="07">7월</option>
			                    <option value="08">8월</option>
			                    <option value="09">9월</option>
			                    <option value="10">10월</option>
			                    <option value="11">11월</option>
			                    <option value="12">12월</option>
			                </select>&nbsp;
			                <select name="birth3" class="birth3 check">
			                    <option value="0">일</option>
			                    <option value="01">1일</option>
			                    <option value="02">2일</option>
			                    <option value="03">3일</option>
			                    <option value="04">4일</option>
			                    <option value="05">5일</option>
			                    <option value="06">6일</option>
			                    <option value="07">7일</option>
			                    <option value="08">8일</option>
			                    <option value="09">9일</option>
			                    <option value="10">10일</option>
			                    <option value="11">11일</option>
			                    <option value="12">12일</option>
			                    <option value="13">13일</option>
			                    <option value="14">14일</option>
			                    <option value="15">15일</option>
			                    <option value="16">16일</option>
			                    <option value="17">17일</option>
			                    <option value="18">18일</option>
			                    <option value="19">19일</option>
			                    <option value="20">20일</option>
			                    <option value="21">21일</option>
			                    <option value="22">22일</option>
			                    <option value="23">23일</option>
			                    <option value="24">24일</option>
			                    <option value="25">25일</option>
			                    <option value="26">26일</option>
			                    <option value="27">27일</option>
			                    <option value="28">28일</option>
			                    <option value="29">29일</option>
			                    <option value="30">30일</option>
			                    <option value="31">31일</option>
			                </select>
			            </td>
			        </tr>
			        <tr>
			        	<td class="col1">이메일<span class="red"> *</span></td>
			        	<td class="col2">
			              <input type="text" name="memberEmail" class="mail check">
			          </td>
			      </tr>
			      <tr>
			          <td class="col1">휴대폰<span class="red"> *</span></td>
			          <td class="col2"><select name="phone1" class="phone1 check">
			              <option value="0" selected>선택</option>
			              <option value="010">010</option>
			              <option value="011">011</option>
			              <option value="016">016</option>
			              <option value="018">018</option>
			          </select>
			            <input type="text" class="phone2 check" name="phone2" maxlength="4">
			            <input type="text" class="phone3 check" name="phone3" maxlength="4">                                 
			          </td>   
			      </tr>
			      <tr>
			          <td class="col1">전화번호</td>
			          <td class="col2"><select name="tel1" class="tel1">
			              <option value="0" selected>선택</option>
			              <option value="02">02</option>
			              <option value="051">051</option>
			              <option value="053">053</option>
			              <option value="063">063</option>
			              <option value="062">062</option>
			              <option value="070">070</option>
			          </select>
			            <input type="text" class="phone2" name="tel2" maxlength="4">
			            <input type="text" class="phone2" name="tel3" maxlength="4">                                 
			          </td>   
			      </tr>
			     </table>
			     <div class="agree_box">
			     	회원가입 이용약관<br>
			     	<span class="basecheck"><input type="checkbox" id="AgreeCheckAll">
			     	이용약관 및 쇼핑정보 수신(선택)에 모두 동의합니다.</span>
			     	<div class="op1">
			     		<span class="agree_title">[필수]이용약관 동의</span>
			     		<p class ="agree">
			     		<strong>제 1조 Lorem ipsum dolor sit amet</strong><br>
			     		이 약관은 (0)0000(전자거래 사업자)이 운영하는 홈페이지(이하 "쇼핑몰"이라 한다)에서 제공하는 인터넷 관련 서비스(이하 "서비스"라 한다)를 이용함에 있어 (0)0000와 이용자의 권리·의무 및 책임사항을 규정함을 목적으로 합니다.<br>
			     		※ 「PC통신 등을 이용하는 전자거래에 대해서도 그 성질에 반하지 않는 한 이 약관을 준용합니다」<br>
			     		제2조(정의) ① "쇼핑몰" 이란 사업자가 재화 또는 용역을 이용자에게 제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 재화 또는 용역을 거래할 수 있도록 설정한 가상의 영업장을 말하며, 아울러 쇼핑몰을 운영하는 사업자의 의미로도 사용합니다.<br>
			     		② "이용자"란 "쇼핑몰"에 접속하여 이 약관에 따라 "쇼핑몰"이 제공하는 서비스를 받는 회원 및 비회원을 말합니다.<br>
			     		③ "회원"이라 함은 "쇼핑몰"에 개인정보를 제공하여 회원등록을 한 자로서, "쇼핑몰"의 정보를 지속적으로 제공받으며, "쇼핑몰"이 제공하는 서비스를 계속적으로 이용할 수 있는 자를 말합니다.<br>
			     		④ "비회원"이라 함은 회원에 가입하지 않고 "쇼핑몰"이 제공하는 서비스를 이용하는 자를 말합니다.
			     		</p>
			     		<span class="basecheck"><input type="checkbox" class="check_item" id="useCheck"> 이용약관에 동의합니다.</span>
			     	</div>
			     	<div class="op1">
			     		<span class="agree_title">[선택] 쇼핑정보 수신 동의</span>
			     		<p class ="agree">
			     		할인쿠폰 및 혜택, 이벤트, 신상품 소식 등 쇼핑몰에서 제공하는 유익한 쇼핑정보를 SMS나 이메일로 받아보실 수 있습니다.<br>
			     		단, 주문/거래 정보 및 주요 정책과 관련된 내용은 수신동의 여부와 관계없이 발송됩니다.<br>
			     		선택 약관에 동의하지 않으셔도 회원가입은 가능하며, 회원가입 후 회원정보수정 페이지에서 언제든지 수신여부를 변경하실 수 있습니다.
			     		</p>
			     		<span class="basecheck"><input type="checkbox" class="check_item" name="memberSpam" id="memberSpam" value="Y"> 수신동의에 동의합니다.</span>
			     	</div>
			     </div>
			    </div>   
			    <div class="create">      
			      <input class="but3" type="button" value="가입취소" onclick="location.href='<%=request.getContextPath()%>/'">
			      <input class="but4" type="submit" value="회원가입">      
				</div>
			</div>
		</form>
	</section>
<!--메인 하단-->
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