<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Login</title>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<script type="text/javascript">
	
	$(function(){
		
		$("#uEmail").change(function(){
			
			var email = $(this).val();
			if(email!=' '){
				var url= "loginCheckEmail";
				var args={uEmail:email};
				$.post(url,args,function(data){
					
					var errorMsg = data.errorMsg;
					$("#errorMsg").text(errorMsg);
				});
			}
		});
		
	});
	
</script>
</head>
<body>
<%@ include file="/WEB-INF/views/include/top.jsp" %>
<div class="contact">
	<div class="container">
		<div class="contact-top">
				<h3><span>L</span>ogin</h3>
		</div>
		<div class="contact-bottom">
			<div class="col-md-6 contact-left" >
				<iframe src="${pageContext.request.contextPath }/images/a6f398ddjw1eshipe152fg20b40681l3.gif"" frameborder="0" style="border:0"></iframe>
			</div>
			<div class="col-md-6 contact-left">
					<h4 style="color: red" align="right"><span id="errorMsg">${requestScope.errorMsg}</span></h4>
				<input id="projectName" type="hidden" value="${pageContext.request.contextPath }">
				<form action="${pageContext.request.contextPath }/user/login" method="post">
					<input id="uEmail" name="uEmail" class="form" type="text" value="" placeholder="<fmt:message key="i18n.loginname"/>" onfocus="this.placeholder = '';" onblur="if (this.value == '') {this.placeholder = '<fmt:message key="i18n.loginname"/>';}" />
					<input id="uPassword" name="uPassword" class="form" type="password" value="" placeholder="<fmt:message key="i18n.password"/>" onfocus="this.placeholder='';" onblur="if (this.value == '') {this.placeholder = '<fmt:message key="i18n.password"/>';}">
						<div class="submit-btn">
							<input class="form" type="submit" value='<fmt:message key="i18n.submit" ></fmt:message>'>
						</div>
				</form>
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