<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="my-page" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/commons/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
table.hovertable{
	font-family:verdana,arial,sans-serif;
	font-size:11px;
	color:#333333;
	border-width:1px;
	border-color:#999999;
	border-collapse:collapse;
}

table.hovertable th{
background-color:#c3dde0;
border-width:1px;
padding:8px;
border-style:solid;
border-color:#a9c6c9;
}

table.hovertable tr{
background-color:#d4e3e5;
}

table.hovertable td{
border-width:1px;
padding:8px;
border-style:solid;
border-color:#a9c6c9;
}
</style>
<script type="text/javascript">
</script>
</head>
<body>
	<table class="hovertable">
		<tr>
			<th>封面</th>
			<th>书名</th>
			<th>作者</th>
			<th>价格</th>
			<th>销售量</th>
			<th>库存</th>
			<th colspan="2">操作</th>
		</tr>
		<c:forEach items="${page.content }" var="book">
			<tr onmouseover="this.style.backgroundColor='#ffff66'" onmouseout="this.style.backgroundColor='#d4e3e5'">
				<td><img alt="${book.title }" src="${path }/images/book-1.jpg"></td>
				<td>${book.title }</td>
				<td>${book.author }</td>
				<td>${book.price }</td>
				<td>${book.sales }</td>
				<td>${book.stock }</td>
				<td><button>更改</button></td>
				<td><button>删除</button></td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="8"><my-page:my-page page="${page }" prePath="${page.path}" ></my-page:my-page></td>
		</tr>
	</table>
</body>
</html>