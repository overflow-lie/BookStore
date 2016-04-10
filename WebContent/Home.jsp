<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Login</title>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
</head>
<body>
<%@ include file="/WEB-INF/views/include/top.jsp" %>
	<!--blog-->
	<div class="blog">
		<div class="container">
			<div class="blog-top">
				<div class="p-top advantage-top">
					<h3><span>B</span>ooks</h3>
				</div>
				<div class="col-md-9 blog-left">
				<!-- Book 分页查询  Start-->
					<c:forEach items="${page.list }" var="book">
						<div class="blog-one">
							<div class="blog-one-top">
								<!-- 
									<h6>07/12</h6>
									<a href="single.html">Aenean non ummy henrerit mauris. Phasellus portasce suscipit varius mium sociis natoque</a> 
								-->
								<ul>
									<li><p>书名 : <a href="#"> ${book.bName }</a></p></li>
									<li><p>作者： <a href="#"> ${book.bAutho }</a></p></li>
								</ul>
							</div>
							<div class="blog-two">
								<div class="col-md-5 blog-two-left">
									<a href="single.html"><img src="images/press-1.jpg" alt="" /></a>
								</div>
								<div class="col-md-7 blog-two-right">
									<p></p>
									<p></p>
									<div class="blog-btn">
										<a href="single.html">Read more</a>
									</div>
								</div>
								<div class="clearfix"></div>
							</div>
						</div>
					</c:forEach>
				<!-- Book 分页查询  End -->
					<div class="blog-bottom">
						<nav>
	  						<ul class="pagination">
		    						<li class="disabled"><a href="#" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
	  						<c:choose>
						<c:when test="${page.totalPageNo<5}">
							<c:set var="begin" value="1"></c:set>
							<c:set var="end" value="${page.totalPageNo}"></c:set>
						</c:when>
						<c:when test="${page.pageNo<=3}">
							<c:set var="begin" value="1"></c:set>
							<c:set var="end" value="5"></c:set>
						</c:when>
						<c:otherwise>
							<c:set var="begin" value="${page.pageNo-2 }"></c:set> 
							<c:set var="end" value="${page.pageNo+2 }"></c:set>
							<c:if test="${end > page.totalPageNo }">
						<c:set var="end" value="${page.totalPageNO }"></c:set>
						<c:set var="begin" value="${end-4 }"></c:set>
					</c:if>
						</c:otherwise>
					</c:choose>
	  						<c:forEach begin="${begin }" end="${end}" var="index">
		    						<li class="active"><a href="#">1<span class="sr-only">(current)</span></a></li>
		    						<li><a href="#">2</a></li>
		    						<li><a href="#">3</a></li>
		    						<li><a href="#">4</a></li>
		    						<li><a href="#">5</a></li>
		    						<c:choose>
		    							<c:when test="${page.pageNo == index }">
		    								<li class="active"><a href="#">${index }<span class="sr-only">(current)</span></a></li>
		    							</c:when>
		    							<c:otherwise>
		    								<li><a href="#">${index }</a></li>
		    							</c:otherwise>
		    						</c:choose>
	    					</c:forEach>
		    						<li class="disabled"><a href="#" aria-label="next"><span aria-hidden="true">»</span></a></li>
		    					<div class="clearfix"></div>
	    					</ul>
						</nav>
				</div>
				</div>
				<div class="col-md-3 blog-right">
					<div class="blog-right-one">
						<h3>Categories</h3>
						<ul>
							<li><a href="#">Sed iaculis sagittis maximus</a></li>
							<li><a href="#">Etiam at mi lobortis</a></li>
							<li><a href="#">Nunc tincidunt tellus</a></li>
							<li><a href="#">Quisque pulvinar et ligula</a></li>
							<li><a href="#">Integer tortor urna</a></li>
							<li><a href="#">Proin pretium velit interdum</a></li>
							<li><a href="#">Curabitur venenatis porttitor</a></li>						
						</ul>
					</div>
					<div class="blog-right-one">
						<h3>Archive</h3>
						<ul>
							<li><a href="#">NOVENBER 2012</a></li>
							<li><a href="#">JANUARY 2013</a></li>
							<li><a href="#">MARCH 2013</a></li>
							<li><a href="#">JUNE 2014</a></li>
							<li><a href="#">AUGUST 2014</a></li>
							<li><a href="#">JANUARY 2015</a></li>					
						</ul>
					</div>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
<%@ include file="/WEB-INF/views/include/bottom.jsp" %>
</body>
</html>