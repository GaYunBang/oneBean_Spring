<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.ezen.vo.*"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table>
	<thead></thead>
	<tbody>
	<c:forEach var="list" items="${list}">
		<tr>
			<td>tdst</td>
			<td>${list.regIdx}</td>
		</tr>
		</c:forEach>
	</tbody>
</table>

</body>
</html>