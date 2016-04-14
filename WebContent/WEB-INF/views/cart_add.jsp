<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="my-page" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html lang="en">
<head lang="en">
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<title>首页</title>
<%@ include file="/WEB-INF/views/include/head.jsp"%>
<link rel="stylesheet" type="text/css"
	href="http://libs.useso.com/js/font-awesome/4.2.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="${path }/css/style_cart.css">
</head>
<body>
	<%@ include file="/WEB-INF/views/include/top.jsp"%>
	
	<div class="ct-pageWrapper">
		<main>
		<div class="container">
			<div class="row">
				<div class="col-md-3">
					<div class="widget">
						<h2 class="widget-header">购物车</h2>
						<div class="ct-cart"></div>
					</div>
				</div>
				<div class="col-md-9">
					<div class="row">
						<c:forEach items="${page.content }" var="book">
							<div class="col-sm-4">
								<div class="ct-product">
									<div class="image">
										<img src="${path }/images/press-1.jpg" alt="">
									</div>
									<div class="inner">
										<a href="#" class="btn btn-motive ct-product-button"><i
											class="fa fa-shopping-cart"></i></a>
										<h2 class="ct-product-title">${book.title }</h2>
										<p class="ct-product-description">${book.author }</p>
										<span class="ct-product-price">${book.price }</span>
									</div>
								</div>
							</div>
						</c:forEach>
						<my-page:my-page page="${page }" prePath="${path }/book/list"></my-page:my-page>
					</div>
				</div>
			</div>
		</div>
	</div>
	</main>
	</div>
	
	<script src="${path }/js/shop.min.js"></script>
	<script>
		$('body').ctshop({
			currency : '￥',
			paypal : {
				currency_code : 'EUR'
			}
		});
	</script>
	<%@ include file="/WEB-INF/views/include/bottom.jsp"%>
</body>
</html>