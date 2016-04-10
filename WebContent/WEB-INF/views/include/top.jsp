<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--header-->
	<div class="header-top" id="home">
		<div class="container">
			<div class="head">
				<div class="header-left">
					<div class="logo">
						<span id="my_book_store"><a href="index.html">网上书城</a></span>
					</div>
				</div>
				<div class="header-right">
					<p>
						<c:choose>
							<c:when test="${sessionScope.loginUser==null }">
								<span> 您好,游客</span>
							</c:when>
							<c:otherwise>
								<c:if test="${sessionScope.loginUser.role.id==3 }">
									<span> 管理员： ${sessionScope.loginUser.uName }</span>
								</c:if>
								<c:if test="${sessionScope.loginUser.role.id==2 }">
									<span> 会员： ${sessionScope.loginUser.uName }</span>
								</c:if>
								<c:if test="${sessionScope.loginUser.role.id==1 }">
									<span> 普通用户： ${sessionScope.loginUser.uName }</span>
								</c:if>
							</c:otherwise>
						</c:choose>
					</p>
				</div>
				<div class="clearfix"> </div>
				<div class="top-nav">
						<div class="nav-icon">
							<a href="#" class="right_bt" id="activator"><span> </span> </a>
						</div>
						 <div class="box" id="box">
							 <div class="box_content">        					                         
								<div class="box_content_center">
								 	<div class="form_content">
										<div class="menu_box_list">
											<ul>
												<c:choose>
													<c:when test="${sessionScope.loginUser==null }">
														<li><a href="${pageContext.request.contextPath }/user/login">登录</a>
														<li><a href="${pageContext.request.contextPath }/user/regist">注册</a>
													</c:when>
													<c:otherwise>
														<li><a href="${pageContext.request.contextPath }/user/center">个人中心</a>														
													</c:otherwise>
												</c:choose>
												<li></li>
												<li><a href="careers.html"><span>Careers</span></a></li>
												<li><a href="404.html"><span>Help</span></a></li>
												<li><a href="blog.html"><span>Books</span></a></li>
												<li><a href="contact.html" class="active"><span>Contact</span></a></li>
											</ul>
										</div>
										<a class="boxclose" id="boxclose"> <span> </span></a>
									</div>                                  
								</div> 	
							</div>  	  
						</div>
					<!---start-click-drop-down-menu----->
			        <!----start-dropdown--->
			         <script type="text/javascript">
						var $ = jQuery.noConflict();
							$(function() {
								$('#activator').click(function(){
									$('#box').animate({'top':'0px'},900);
								});
								$('#boxclose').click(function(){
								$('#box').animate({'top':'-1000px'},900);
								});
							});
							$(document).ready(function(){
							//Hide (Collapse) the toggle containers on load
							$(".toggle_container").hide(); 
							//Switch the "Open" and "Close" state per click then slide up/down (depending on open/close state)
							$(".trigger").click(function(){
								$(this).toggleClass("active").next().slideToggle("500");
									return false; //Prevent the browser jump to the link anchor
							});
												
						});
					</script>
					<!---//End-click-drop-down-menu----->
					<!--top-nav---->
				</div>
				<div id="sb-search" class="sb-search">
					<a href="${path }/user/logout"><span class="sb-icon-search"/></a>
						<!-- 
							<form>
								<input class="sb-search-input" placeholder="Enter your search term..." type="search" name="search" id="search">
								<input class="sb-search-submit" type="submit" value="">
								<span class="sb-icon-search" id="get"> </span>
							</form> 
						-->
				</div>
			</div>
		</div>
	</div>
	<!--//header-->
	<%-- 
	<script src="${pageContext.request.contextPath }/js/uisearch.js"></script>
	<script src="${pageContext.request.contextPath }/js/classie.js"></script>	
		<script>
			new UISearch( document.getElementById( 'sb-search' ) );
		</script> 
	--%>
	<!--//search-scripts-->