<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" class="no-js">
<head lang="en">
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<title>HTML5点击添加商品购物车代码 - 源码之家</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="http://libs.useso.com/js/font-awesome/4.2.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="css/style_cart.css">
</head>
<body>
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
			<div class="col-sm-4">
			  <div class="ct-product">
				<div class="image"><img src="images/product-01.jpg" alt=""></div>
				<div class="inner"><a href="#" class="btn btn-motive ct-product-button"><i class="fa fa-shopping-cart"></i></a>
				  <h2 class="ct-product-title">Box of macaroons</h2>
				  <p class="ct-product-description">A very delicious macaroons ...</p><span class="ct-product-price">$19.99</span>
				</div>
			  </div>
			</div>
			<div class="col-sm-4">
			  <div class="ct-product">
				<div class="image"><img src="images/product-02.jpg" alt=""></div>
				<div class="inner"><a href="#" class="btn btn-motive ct-product-button"><i class="fa fa-shopping-cart"></i></a>
				  <h2 class="ct-product-title">Cherry Straws</h2>
				  <p class="ct-product-description">A very delicious macaroons ...</p><span class="ct-product-price">$34.99</span>
				</div>
			  </div>
			</div>
			<div class="col-sm-4">
			  <div class="ct-product">
				<div class="image"><img src="images/product-03.jpg" alt=""></div>
				<div class="inner"><a href="#" class="btn btn-motive ct-product-button"><i class="fa fa-shopping-cart"></i></a>
				  <h2 class="ct-product-title">Coffee Macaroons</h2>
				  <p class="ct-product-description">A very delicious macaroons ...</p><span class="ct-product-price">$59.99</span>
				</div>
			  </div>
			</div>
			<div class="col-sm-4">
			  <div class="ct-product">
				<div class="image"><img src="images/product-04.jpg" alt=""></div>
				<div class="inner"><a href="#" class="btn btn-motive ct-product-button"><i class="fa fa-shopping-cart"></i></a>
				  <h2 class="ct-product-title">Finetti ones</h2>
				  <p class="ct-product-description">A very delicious macaroons ...</p><span class="ct-product-price">$9.99</span>
				</div>
			  </div>
			</div>
			<div class="col-sm-4">
			  <div class="ct-product">
				<div class="image"><img src="images/product-05.jpg" alt=""></div>
				<div class="inner"><a href="#" class="btn btn-motive ct-product-button"><i class="fa fa-shopping-cart"></i></a>
				  <h2 class="ct-product-title">Minty duo</h2>
				  <p class="ct-product-description">A very delicious macaroons ...</p><span class="ct-product-price">$3.99</span>
				</div>
			  </div>
			</div>
			<div class="col-sm-4">
			  <div class="ct-product">
				<div class="image"><img src="images/product-06.jpg" alt=""></div>
				<div class="inner"><a href="#" class="btn btn-motive ct-product-button"><i class="fa fa-shopping-cart"></i></a>
				  <h2 class="ct-product-title">Pistachio</h2>
				  <p class="ct-product-description">A very delicious macaroons ...</p><span class="ct-product-price">$13.99</span>
				</div>
			  </div>
			</div>
		  </div>
		</div>
	  </div>
	</div>
  </main>

<script src="js/jquery-1.11.3.min.js"></script>
<script src="js/shop.min.js"></script>
<script>
$('body').ctshop({
  currency: '$',
  paypal: {
	currency_code: 'EUR'
  }
});
</script>
</div>
<div style="text-align:center;">
<p>来源:<a href="http://www.mycodes.net/" target="_blank">源码之家</a></p>
</div>
</body>
</html>