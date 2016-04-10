<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>注册页面</title>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<script type="text/javascript">
	$(function(){
		function nameNull(){
			if($("#username").val() == ""){
				$("#errorMsg").text("请输入用户名！");
			}
		}
		function checkName(){
			var url="registCheckName";
			var name= $("#username").val();
			alert(name);
			var args={name:name};
			$.post(url,args,function(data){
				var errorMsg = data.errorMsg;
				$("#errorMsg").text(errorMsg);
			});
		}
		function checkPwd(){
			if($("#pwd").val() == ""){
				$("#errorMsg").text("请输入确认密码！");
			}else{
				if($("#password").val()!=$("#pwd").val()){
					$("#errorMsg").text("两次密码输入不一致");
				};
			}
		}
		function checkEmail(){
			if($("#email").val() == ""){
				$("#errorMsg").text("请输入邮箱！");
			}else{
				var url="registCheckEmail";
				var email= $("#email").val();
				var args={email:email};
				$.post(url,args,function(data){
					var errorMsg = data.errorMsg;
					$("#errorMsg").text(errorMsg);
				});
			}
		}
		function checkKey(){
			if($("#key").val() == ""){
				$("#errorMsg").text("请输入验证码！");
			}else{
			}
		}
		
		function checkPassword(){
			if($("#password").val() == ""){
				$("#errorMsg").text("请输入密码！");
			}
		}
		$("#username").change(function(){
			checkName();
		});
		
		$("#password").click(function(){
			nameNull();
		})
		
		$("#password").change(function(){
			//验证密码格式
			
		});
		
		$("#pwd").click(function(){
			checkPassword();
			nameNull();
		});
		
		$("#pwd").change(function(){
			if($("#password").val()!=$("#pwd").val()){
				$("#errorMsg").text("两次密码输入不一致");
			};
		});
		
		$("#email").click(function(){
			checkPwd();
			checkPassword();
			nameNull();
		});
		
		$("#emial").change(function(){
			//验证邮箱格式
			checkEmail();			
		});
		
		$("#key").click(function(){
			checkEmail();
			checkPwd();
			checkPassword();
			nameNull();
		});
		
		$("#key").change(function(){
			checkKey();
		});
		
		$("#submit").click(function(){
			$("#errorMsg").text("");
			checkKey();
			checkEmail();
			checkPwd();
			checkPassword();
			nameNull();
			if($("#errorMsg").text()!=""){
				checkName();
				if($("#errorMsg").text()!=""){
					return false; 
				}
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
				<h3><span>R</span>egist</h3>
		</div>
		<div class="contact-bottom">
			<div class="col-md-6 contact-left">
				<iframe src="${pageContext.request.contextPath }/images/a6f398ddjw1eshipe152fg20b40681l3.gif"" frameborder="0" style="border:0"></iframe>
			</div>
			<div class="col-md-6 contact-left">
			<h4 style="color: red" align="right"><span id="errorMsg">${requestScope.errorMsg}</span></h4>
			<form:form action="${path }/user/regist" method="post" modelAttribute="user">
				<input id="username" name="uName" class="form" type="text" placeholder="<fmt:message key="i18n.username"/>" onfocus="this.value = '';" onblur="if (this.value == '') {this.placeholder = '<fmt:message key="i18n.username"/>';}" />
				<input id="password" name="uPassword" class="form" type="password" placeholder="<fmt:message key="i18n.password"/>" onfocus="this.value='';" onblur="if (this.value == '') {this.placeholder = '<fmt:message key="i18n.password"/>';}">
				<input id="pwd" class="form" type="password" placeholder="<fmt:message key="i18n.pwd"/>" onfocus="this.value='';" onblur="if (this.value == '') {this.placeholder = '<fmt:message key="i18n.pwd"/>';}">
				<input id="email" name="uEmail" class="form" type="text" placeholder="<fmt:message key="i18n.email"/>" onfocus="this.value='';" onblur="if (this.value == '') {this.placeholder = '<fmt:message key="i18n.email"/>';}">
					<div class="submit-btn">
						<%-- <img src="${pageContext.request.contextPath }/images/logo.png"> --%>
						<input id="key" name="key" class="form" type="text" placeholder="<fmt:message key="i18n.key"/>" onfocus="this.value='';" onblur="if (this.value == '') {this.placeholder = '<fmt:message key="i18n.key"/>';}">
						<input id="submit" class="form" type="submit" value='<fmt:message key="i18n.registbtn" ></fmt:message>'>
					</div>
			</form:form>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/include/bottom.jsp" %>
</body>
</html>