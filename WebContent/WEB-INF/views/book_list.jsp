<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="my-page" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<title>首页</title>
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
					<c:forEach items="${page.content }" var="book">
						<div class="blog-one">
							<div class="blog-one-top">
								<!-- 
									<h6>07/12</h6>
									<a href="single.html">Aenean non ummy henrerit mauris. Phasellus portasce suscipit varius mium sociis natoque</a> 
								-->
								<ul>
									<li><p>书名 : <a href="#"> ${book.title }</a></p></li>
									<li><p>作者： <a href="#"> ${book.author }</a></p></li>
								</ul>
							</div>
							<div class="blog-two">
								<div class="col-md-5 blog-two-left">
									<a href="single.html"><img src="${path }/images/press-1.jpg" alt="" /></a>
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
				<!-- 分页查询   -->
					<my-page:my-page page="${page }" prePath="${path }/book/list" ></my-page:my-page>
				</div>
				
				<div class="col-md-3 blog-right">
				<!-- ---------HOT BOOKS----------- --> 
					<div class="blog-right-one">
						<h3>热门书籍</h3>
						<ul>
							<c:if test="${hotBooks==null||hotBooks.size()==0 }"></c:if>
							<c:forEach items="${hotBooks }" var="hotBook">
								<li><a href="#">${hotBook.title }</a></li>	
							</c:forEach>					
						</ul>
					</div>
				<!-- --------------HOT AUTHORS------ -->
					<div class="blog-right-one">
						<h3>相关作者</h3>
						<ul>
							<c:if test="${hotBooks==null||hotBooks.size()==0 }"></c:if>
							<c:forEach items="${hotBooks }" var="hotBook">
								<li><a href="#">${hotBook.author }</a></li>	
							</c:forEach>					
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