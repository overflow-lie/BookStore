<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8"/>
<title>后台管理系统</title>
<meta name="author" content="DeathGhost" />
<link rel="stylesheet" type="text/css" href="${path }/css/style_admin.css" /><!--[if lt IE 9]>
<script src="${path }/js/html5.js"></script>
<![endif]-->
<style type="text/css">

table.hovertable{
	width:100%;
	height:100%;
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
<script src="${path }/js/jquery-1.11.0.min.js"></script>
<script src="${path }/js/jquery.js"></script>
<script src="${path }/js/jquery.mCustomScrollbar.concat.min.js"></script>
<script>
	(function($){
		$(window).load(function(){
			
			$("#idl dt").click(function(){
				$(this).nextUntil("dt").toggle();
			});
			
			$("#search_btn").click(function(){
				$("#search_form").submit();
			});
		});
		
	})(jQuery);
</script>
</head>
<body>
<!--header-->
<header>
 <h1><img src="${path }/images/admin_logo.png"/></h1>
 <ul class="rt_nav">
  <li><a href="${path }/book/list/0" target="_blank" class="website_icon">站点首页</a></li>
  <li><a href="#" class="admin_icon">DeathGhost</a></li>
  <li><a href="#" class="set_icon">账号设置</a></li>
  <li><a href="login.php" class="quit_icon">安全退出</a></li>
 </ul>
</header>

<!--aside nav-->
<aside class="lt_aside_nav content mCustomScrollbar">
 <h2><a href="index.php">起始页</a></h2>
 <ul>
  <li>
   <dl id="idl">
    <dt>图书信息</dt>
    <!--当前链接则添加class:active-->
    <dd><a id="book_list" href="${path }/manager/book/list/1" class="active" ta>图书列表</a></dd>
    <dd><a href="#">图书分类</a></dd>
    <dd><a href="#">图书属性</a></dd>
    <dd><a href="#">图书管理</a></dd>
   </dl>
  </li>
  <li>
   <dl id="idl">
    <dt class="dt">订单信息</dt>
    <dd><a href="#">订单列表</a></dd>
    <dd><a href="#">添加订单</a></dd>
    <dd><a href="#">缺货登记</a></dd>
   </dl>
  </li>
  <li>
   <dl id="idl">
    <dt class="dt">会员管理</dt>
    <dd><a href="#">会员列表</a></dd>
    <dd><a href="#">添加会员</a></dd>
    <dd><a href="#">会员等级</a></dd>
    <dd><a href="#">资金管理</a></dd>
   </dl>
  </li>
  <li>
   <dl id="idl">
    <dt class="dt">基础设置</dt>
    <dd><a href="#">站点基础设置</a></dd>
    <dd><a href="#">SEO设置</a></dd>
    <dd><a href="#">SQL语句查询</a></dd>
    <dd><a href="#">模板管理</a></dd>
   </dl>
  </li>
  <li>
   <dl id="idl">
    <dt class="dt">营销管理</dt>
    <dd><a href="#">订阅列表</a></dd>
    <dd><a href="#">邮件群发</a></dd>
    <dd><a href="#">优惠打折</a></dd>
   </dl>
  </li>
  <li>
   <dl id="idl">
    <dt class="dt">配送与支付设置</dt>
    <dd><a href="#">配送方式</a></dd>
    <dd><a href="#">支付方式</a></dd>
   </dl>
  </li>
  <li>
   <dl id="idl">
    <dt class="dt">在线统计</dt>
    <dd><a href="#">流量统计</a></dd>
    <dd><a href="#">销售额统计</a></dd>
   </dl>
  </li>
 </ul>
</aside>

<section class="rt_wrap content mCustomScrollbar">
 <div class="rt_content">
 	<h2><strong style="color:grey;">图书列表</strong></h2>
      <div class="page_title">
       <h2 class="fl">按条件查询：</h2>
       <form id="search_form" action="${path }/manager/book/list/1">
	       <input type="text" class="textbox" placeholder="书名"/>
	       <input type="text" class="textbox" placeholder="作者"/>
	       <input type="text" class="textbox" placeholder="价格"/>
	       <input type="text" class="textbox" placeholder="销量"/>
	       <input type="text" class="textbox" placeholder="库存"/>
       	   <a id="search_btn" class="fr top_rt_btn">查询</a>
       </form>
      </div>
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
				<td><img alt="${book.title }" src="${path }/images/book_01.jpg"></td>
				<td>${book.title }</td>
				<td>${book.author }</td>
				<td>${book.price }</td>
				<td>${book.sales }</td>
				<td>${book.stock }</td>
				<td><a href="#" class="inner_btn">更改</a></td>
				<td><a href="#" class="inner_btn">删除</a></td>
			</tr>
		</c:forEach>
	</table>
      <aside class="paging">
       <a>第一页</a>
       <a>1</a>
       <a>2</a>
       <a>3</a>
       <a>…</a>
       <a>1004</a>
       <a>最后一页</a>
      </aside>
     </section>
 </div>
</section>
</body>
</html>

 
      