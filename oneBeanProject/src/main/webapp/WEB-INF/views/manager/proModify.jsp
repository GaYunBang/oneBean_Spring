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
<form name="form1" method="post" action="proModify.do" enctype="multipart/form-data">
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

</body>
</html>