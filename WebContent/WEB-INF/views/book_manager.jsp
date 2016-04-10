<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Login</title>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<script type="text/javascript">
	
	$(function(){
		
		$("#uName").change(function(){
			var name = $(this).val();
			var url= "loginCheckName";
			var args={uName:name};
			$.post(url,args,function(data){
				
				var errorMsg = data.errorMsg;
				$("#errorMsg").text(errorMsg);
			});
		});
		
	});
	
</script>
</head>
<body>
<%@ include file="/WEB-INF/views/include/top.jsp" %>
<div class="contact">
	<div class="container">
		<div class="contact-top">
				<h3>管理<span>(●'◡'●)</span>图书</h3>
		</div>
		<div class="contact-bottom">
			<div class="col-md-6 contact-left" >
			<iframe src="${path }/book/manager/0" frameborder="0" scrolling="no" style="margin:0;border:0;height:100%;width:100%;right:0px;border:solid 0px red;"></iframe>
			</div>
			<div class="col-md-6 contact-left">
			</div>
			<div class="clearfix"></div>
			<div class="contact-text">
				<div class="col-md-4 contact-text-left">
					<span class="msg"> </span>
					<p><a href="mailto:example@email.com">mail@user.com</a></p>
				</div>
				<div class="col-md-4 contact-text-left">
					<span class="ph"> </span>
					<p>+1 234 567 9871</p>
				</div>
				<div class="col-md-4 contact-text-left">
					<span class="area"> </span>
					<p>756 gt globel Place,<label>CD-Road,M 07 435.</label></p>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/include/bottom.jsp" %>
</body>
</html>