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
</head>
<body>
<form name="form1" method="post" action="proModify.do"
		enctype="multipart/form-data">
<input type="hidden" value="${product.proIdx}" name="proIdx">
상품이름 : <input type="text" value="${product.proName}" name="proName"><br>
상품가격 : <input type="text" value="${product.proPrice}" name="proPrice"><br>
<div>상품타입
	<select name="proType">
		<option value="${proType}" selected>${product.proType}</option>
		<option value="01product">일반상품</option>
		<option value="02busiProduct">사업자상품</option>
		<option value="03sampleProduct">샘플박스상품</option>
		<option value="04event">이벤트</option>
	</select>
</div>
내용 <textarea name="proContents" id="proContents">${product.proContents}</textarea><br>
<hr>이미지 자리<br>
<img class="box" src="${product.proImg }"><br>
<img class="box" src="${product.proDetailImg }">
<input type="submit" value="수정">
</form>

</body>
</html>