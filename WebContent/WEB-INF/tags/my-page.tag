<%@ tag language="java" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 定义当前标签库的属性 -->
<%@ attribute name="prePath" required="true" type="java.lang.String"%>
<%@ attribute name="page" required="true" type="com.my.bk.model.Page" %>	
<%@ attribute name="queryParameters" required="false" type="java.lang.String" %>	
	
<%
	request.setAttribute("page", page);
%>

<div class="blog-bottom">
	<nav>
		<ul class="pagination">
			<li>共 <%= page.getTotalElements() %> 条记录 
	&nbsp;&nbsp;
	
	当前第 <%= page.getPageNo() %> 页/共 <%= page.getTotalPages() %> 页
	&nbsp;&nbsp;</li>
			<c:if test="${page.hasPrev }">
				<li class="disable"><a
					href="${prePath }/${page.prevPage}<c:if test="${queryParameters }!=null">?${queryParameters }</c:if>" aria-label="Previous"><span
						aria-hidden="true">&laquo;</span></a></li>
			</c:if>
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
			<c:forEach begin="${begin }" end="${end}" var="index">
				<c:choose>
					<c:when test="${page.pageNo == index }">
						<li class="active"><a href="${index}">${index }<span
								class="sr-only">(current)</span></a></li>
					</c:when>
					<c:otherwise>
						<li><a href="${prePath }/${index}<c:if test="${queryParameters }!=null">?${queryParameters }</c:if>">${index }</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${page.hasNext }">
				<li class="${page.pageNo==page.totalPages?'disable':'enable' }"><a
					href="${prePath }/${page.nextPage }<c:if test="${queryParameters }!=null">?${queryParameters }</c:if>" aria-label="next"><span
						aria-hidden="true">»</span></a></li>
				<div class="clearfix"></div>
			</c:if>
			<li>转到 <input id="pageNo" size='1'/> 页</li>
			<input id="pathname" type="hidden" value="${pageContext.request.contextPath }"/>
			<input id="path" type="hidden" value="<c:if test="${queryParameters }!=null">?${queryParameters }</c:if>">
		</ul>
	</nav>
</div>