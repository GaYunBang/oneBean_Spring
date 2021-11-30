<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록</title>
<script src="/js/jquery-3.6.0.min.js"></script>
</head>
<body>
<!-- 
D:\git\oneBean_Spring\oneBeanProject\src\main\webapp\resources
 -->
 	<form name="form1" method="post" action="proWrite.do" enctype="multipart/form-data">
		<div>
			상품명 <input name="proName" id="proName">
		</div>
		<div>상품타입
			<select name="proType">
				<option value="일반">일반상품</option>
				<option value="사업자">사업자상품</option>
				<option value="샘플박스">샘플박스상품</option>
				<option value="이벤트">이벤트</option>
			</select>
		</div>
		<div>
			가격 <input name="proPrice" id="proPrice">
		</div>
		<div>
			내용
			<textarea name="proContents" id="proContents"></textarea>
		</div>
		
		<div class="inputArea">
			<label for="proImg">상품이미지</label> 
			<input type="file" id="file" name="file" />
			<div class="select_img">
				<img src="" />
			</div>
			<label for="proDetailImg">상세이미지</label> 
			<input type="file" id="detailFile" name="detailFile" />
			<div class="select_img2">
				<img src="" />
			</div>

			<script>
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
			</script>
		</div>
		<div>
			<input type="submit" value="확인!">
			<button type="reset">취소</button>
		</div>
	</form>	
</body>
</html>