<%@ tag language="java" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 定义当前标签库的属性 -->
<%@ attribute name="prePath" required="true" type="java.lang.String"%>
<%@ attribute name="page" required="true" type="com.my.bk.model.Page"%>
<%@ attribute name="queryParameters" required="false"
	type="java.lang.String"%>

<%
	request.setAttribute("page", page);
%>
<c:choose>
	<c:when test="${page.totalPages<10}">
		<c:set var="begin" value="1"></c:set>
		<c:set var="end" value="${page.totalPages}"></c:set>
	</c:when>
	<c:when test="${page.pageNo<6}">
		<c:set var="begin" value="1"></c:set>
		<c:set var="end" value="10"></c:set>
	</c:when>
	<c:otherwise>
		<c:set var="begin" value="${page.pageNo-4 }"></c:set>
		<c:set var="end" value="${page.pageNo+5 }"></c:set>
		<c:if test="${end > page.totalPages }">
			<c:set var="end" value="${page.totalPages }"></c:set>
			<c:set var="begin" value="${end-9 }"></c:set>
		</c:if>
	</c:otherwise>
</c:choose>

<aside class="paging">
	<c:if test="${page.hasPrev }">
		<a
			href="${prePath }/${page.prevPage}?<%=queryParameters%>"
			aria-label="Previous">第一页</a>
	</c:if>
	<c:forEach begin="${begin }" end="${end}" var="index">
		<c:choose>
			<c:when test="${page.pageNo == index }">
				<a href="${index}">${index }</a>
			</c:when>
			<c:otherwise>
				<a
					href="${prePath }/${index}?<%=queryParameters%>">${index }</a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	<c:if test="${page.hasNext }">
		<a href="${prePath }/${page.nextPage}?<%=queryParameters%>"  aria-label="next">最后一页</a>
		</li>
	</c:if>
</aside>
