<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<link href="/css/etc/about.css" rel="stylesheet" />

<link rel="shortcut icon" type="image/x-icon"
	href="/images/titlelogo.png" />
<title>1:1 문의</title>

<!-- fontawesome 주소 -->
<script src="https://kit.fontawesome.com/be3783bb1d.js" crossorigin="anonymous"></script>
<!--햄버거 제이쿼리-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
<!-- jquery 불러오기 -->
<script src="/js/jquery-3.6.0.min.js"></script>
<style>
	section {
        width: 100%;
        margin-top: 350px;
        margin-bottom: 200px;
      }
      .selectBox {
        margin-left: 10%;
        margin-bottom: 20px;
      }
      select {
        width: 150px;
      }

      table, tr, th, td {
        border-bottom: 1px solid rgba(0, 0, 0, 0.39);
        padding: 15px 0px;
      }
      table {
        width: 85%;
        height: 130px;
        margin: auto;
        text-align: center;
        table-layout: fixed;
      }
      th {
        background-color: rgba(212, 208, 208, 0.199);
      }
      td {
        overflow: hidden;
        white-space: nowrap;
        text-overflow: ellipsis;
      }
      td.textOverDefault {
        white-space: normal;
        text-overflow: clip;
      }
      h3 {
        text-align: center;
        margin: 100px;
      }
      .re {
        background-color: rgba(181, 245, 187, 0.199);
      }
      .emmm{
		  width: 100%;
		  height: 100px;
	}
</style>
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
			<h3>1:1 문의 게시판</h3>
      
      <div class="outter">
      <!-- 
        <div style="float:left; width:100%;">
          <select class="selectBox">
            <option>전체보기</option>
            <option>상품문의</option>
            <option>기타문의</option>
          </select>
        </div> -->
        <table>
          <tr>
          	<th width="5%"></th>
            <th width="12%">카테고리</th>
            <th width="50%">제목</th>
            <th width="10%">작성자</th>
            <th>작성일</th>
          </tr>
          
          <c:if test="${member == null}">
          	<tr>
          		<td colspan="6">등록된 게시물이 없습니다.</td>
          	</tr>
          </c:if>
          
          
          <c:if test="${member != null}">
	          <c:if test="${memberGrade eq 0 }">
		          <c:forEach var="listAll" items="${listAll}">
		          	<c:if test="${listAll.quesDel eq 'N'}">
			          <tr onclick="location.href='/Question/view.do?qidx=${listAll.qidx}'" style="cursor: pointer;">
			          	<td style="font-size:10px">${listAll.qidx }</td>
			            <td>${listAll.quesCate }</td>
			            <td>${listAll.quesSubject }
			            	<c:if test="${listAll.commentCnt == 0}"></c:if>
							<c:if test="${listAll.commentCnt != 0}">
								[${listAll.commentCnt}]
							</c:if>
			            </td>
			            <td>${listAll.quesWriter }</td>
			            <td><fmt:formatDate value="${listAll.quesDate }" pattern="yyyy-MM-dd" /></td>
			          </tr>
			          </c:if>
		          </c:forEach>
	          </c:if>
	          
	          	<c:forEach var="list2" items="${list}">
	          		<c:if test="${list2.quesDel eq 'N'}">
			          <tr onclick="location.href='/Question/view.do?qidx=${list2.qidx}'" style="cursor: pointer;">
			          	<td style="font-size:10px">${list2.qidx }</td>
			            <td>${list2.quesCate }</td>
			            <td>${list2.quesSubject }
			            	<c:if test="${list2.commentCnt == 0}"></c:if>
							<c:if test="${list2.commentCnt != 0}">
								[${list2.commentCnt}]
							</c:if>
			            </td>
			            <td>${list2.quesWriter }</td>
			            <td><fmt:formatDate value="${list2.quesDate }" pattern="yyyy-MM-dd" /></td>
			          </tr>
			          </c:if>
		        </c:forEach>
      	</c:if>
           
        </table><br>
        
        <c:if test="${member != null}">
	        <div style="padding-left:85%;">
	        	<button class="btn btn-light" onclick="location.href='/Question/write.do'">문의하기</button>
	        	<c:if test="${memberGrade eq 0 }">
	        	<button class="btn btn-light" onclick="location.href='/Question/deleteBoard.do'">삭제게시판</button>
	        	</c:if>
	        </div>
        </c:if>
        <div style="display:block; text-align:center;">
        	<c:if test="${paging.startPage != 1 }">
        		<a href="/Question/question.do?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
        	</c:if>
        	<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
        		<c:choose>
        			<c:when test="${p == paging.nowPage }">
        				<b>${p }</b>
        			</c:when>
        			<c:when test="${p != paging.nowPage }">
        				<a href="/Question/question.do?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
        			</c:when>
        		</c:choose>
        	</c:forEach>
        	<c:if test="${paging.endPage != paging.lastPage }">
        		<a href="/Question/question.do?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage }">&gt;</a>
        	</c:if><br><br>
        	
        </div>
        
      </div>
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