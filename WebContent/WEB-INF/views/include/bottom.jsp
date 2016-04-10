<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--footer-->
	<div class="footer">
		<div class="container">
			<div class="footer-main">
				<div class="col-md-8 footer-left">
					<div class="col-md-4 footer-one">
						<ul>
							<li><a href="about.html">About us</a></li>
							<li><a href="careers.html">Careers</a></li>
							<li><a href="404.html">Help</a></li>
							<li><a href="blog.html">Blog</a></li>
						</ul>
					</div>
					<div class="col-md-4 footer-one">
						<ul>
							<li><a href="#">Terms</a></li>
							<li><a href="#">Payment</a></li>
							<li><a href="#">Shipping</a></li>
							<li><a href="contact.html">Contact</a></li>
						</ul>
					</div>
					<div class="col-md-4 footer-one">
						<ul>
							<li><a href="#">LIGHTBOOK</a></li>
							<li><a href="#">CLASSICBOOK</a></li>
							<li><a href="#">PREMIUMBOOK</a></li>
						</ul>
					</div>
					<div class="clearfix"> </div>
				</div>
				<div class="col-md-4 footer-right">
					<div class="footer-two">
						<ul>
							<li><a href="#"><span class="fb"></span></a></li>
							<li><a href="#"><span class="b"></span></a></li>
							<li><a href="#"><span class="cam"></span></a></li>
						</ul>
					</div>
				</div>
				<div class="clearfix"></div>
			</div>
			<div class="footer-bottom">
				<p>MyBookStore &copy; 2016.Company name All rights reserved.<a href="${path }/manager_login">后台管理</a></p>
			</div>
		</div>
		<script type="text/javascript">
									$(document).ready(function() {
										/*
										var defaults = {
								  			containerID: 'toTop', // fading element id
											containerHoverID: 'toTopHover', // fading element hover id
											scrollSpeed: 1200,
											easingType: 'linear' 
								 		};
										*/
										
										$().UItoTop({ easingType: 'easeOutQuart' });
										
									});
								</script>
		<a href="#home" id="toTop" class="scroll" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>
	</div>
	<!--footer-->