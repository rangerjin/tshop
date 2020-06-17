<%@page import="poly.dto.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>tshop</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- <title>fmall</title> -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- Favicon -->
<link rel="icon" href="/img/favicon.ico" type="image/x-icon">

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css?family=Josefin+Sans:300,300i,400,400i,700,700i"
	rel="stylesheet">


<!-- Stylesheets -->
<link rel="stylesheet" href="/css/bootstrap.min.css" />
<link rel="stylesheet" href="/css/font-awesome.min.css" />
<link rel="stylesheet" href="/css/flaticon.css" />
<link rel="stylesheet" href="/css/slicknav.min.css" />
<link rel="stylesheet" href="/css/jquery-ui.min.css" />
<link rel="stylesheet" href="/css/owl.carousel.min.css" />
<link rel="stylesheet" href="/css/animate.css" />
<link rel="stylesheet" href="/css/style.css" />


<!--[if lt IE 9]>
		  <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
	  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->

<style type="text/css">
.main-menu {
	text-align: center;
}

.container {
	width: 100%;
}

#imgDiv {
	margin-top: 50px;
}

.main-menu .sub-menu {
	text-align: left;
	background: #282828;
	color: white;
}

.main-menu .sub-menu a {
	color: #FFFFFF;
}

.social-links-warp {
	background: #282828;
	padding-top: 30px;
}

.user-panel .up-item:hover>a {
	color: #f51167;
}
</style>
<script>
var msg = request.getParameter('msg');

if(msg != null || msg != ""){
	alert('<c:out value="${msg}"/>');	
}
</script>
</head>
<body>

	<jsp:include page="/WEB-INF/view/tshop/mainHeader.jsp"></jsp:include>

	<!-- Header section end -->


	<section class="hero-section">
		<div class="container" id="imgDiv">
			<div id="myCarousel" class="carousel slide" data-ride="carousel">
				<!-- Indicators -->
				<ol class="carousel-indicators">
					<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
					<li data-target="#myCarousel" data-slide-to="1"></li>
					<li data-target="#myCarousel" data-slide-to="2"></li>
				</ol>

				<!-- Wrapper for slides -->
				<div class="carousel-inner">
					<div class="item active">
						<img src="/img/부부 index.png" alt="Los Angeles"
							style="width: 100%;">
					</div>

					<div class="item">
						<img src="/img/슬기로운생활 index.png" alt="Chicago"
							style="width: 100%;">
					</div>

					<div class="item">
						<img src="/img/밥블레스유.png" alt="New york" style="width: 100%;">
					</div>
				</div>

				<!-- Left and right controls -->
				<a class="left carousel-control" href="#myCarousel"
					data-slide="prev"> <span
					class="glyphicon glyphicon-chevron-left"></span> <span
					class="sr-only">Previous</span>
				</a> <a class="right carousel-control" href="#myCarousel"
					data-slide="next"> <span
					class="glyphicon glyphicon-chevron-right"></span> <span
					class="sr-only">Next</span>
				</a>
			</div>
		</div>
	</section>

	<!-- letest product section -->
	<section class="top-letest-product-section">
		<div class="container">
			<div class="section-title">
				<h2>BEST PRODUCTS</h2>
			</div>
			<div class="product-slider owl-carousel">
				<div class="product-item">
					<div class="pi-pic">
						<img src="/img/product/1.jpg" alt="">
						<div class="pi-links">
							<a href="#" class="add-card"><i class="flaticon-bag"></i><span>ADD
									TO CART</span></a> <a href="#" class="wishlist-btn"><i
								class="flaticon-heart"></i></a>
						</div>
					</div>
					<div class="pi-text">
						<h6>$35,00</h6>
						<p>Flamboyant Pink Top</p>
					</div>
				</div>
				<div class="product-item">
					<div class="pi-pic">
						<div class="tag-new">New</div>
						<img src="/img/product/2.jpg" alt="">
						<div class="pi-links">
							<a href="#" class="add-card"><i class="flaticon-bag"></i><span>ADD
									TO CART</span></a> <a href="#" class="wishlist-btn"><i
								class="flaticon-heart"></i></a>
						</div>
					</div>
					<div class="pi-text">
						<h6>$35,00</h6>
						<p>Black and White Stripes Dress</p>
					</div>
				</div>
				<div class="product-item">
					<div class="pi-pic">
						<img src="/img/product/3.jpg" alt="">
						<div class="pi-links">
							<a href="#" class="add-card"><i class="flaticon-bag"></i><span>ADD
									TO CART</span></a> <a href="#" class="wishlist-btn"><i
								class="flaticon-heart"></i></a>
						</div>
					</div>
					<div class="pi-text">
						<h6>$35,00</h6>
						<p>Flamboyant Pink Top</p>
					</div>
				</div>
				<div class="product-item">
					<div class="pi-pic">
						<img src="/img/product/4.jpg" alt="">
						<div class="pi-links">
							<a href="#" class="add-card"><i class="flaticon-bag"></i><span>ADD
									TO CART</span></a> <a href="#" class="wishlist-btn"><i
								class="flaticon-heart"></i></a>
						</div>
					</div>
					<div class="pi-text">
						<h6>$35,00</h6>
						<p>Flamboyant Pink Top</p>
					</div>
				</div>
				<div class="product-item">
					<div class="pi-pic">
						<img src="/img/product/6.jpg" alt="">
						<div class="pi-links">
							<a href="#" class="add-card"><i class="flaticon-bag"></i><span>ADD
									TO CART</span></a> <a href="#" class="wishlist-btn"><i
								class="flaticon-heart"></i></a>
						</div>
					</div>
					<div class="pi-text">
						<h6>$35,00</h6>
						<p>Flamboyant Pink Top</p>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- letest product section end -->

	<!-- Footer section -->
	<!-- <section class="footer-section"> -->
	<jsp:include page="/WEB-INF/view/tshop/footer.jsp"></jsp:include>
	<!-- 
	<div class="social-links-warp">
		<div class="container">

			Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0.
			<p class="text-white text-center mt-5">
				Copyright &copy;
				<script>
					document.write(new Date().getFullYear());
				</script>
				BY KOREA POLYTECHNICS. ALL RIGHTS RESERVED. MADE BY HYJ
			</p>
			Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0.

		</div>
	</div>
	 -->
	<!-- </section> -->
	<!-- Footer section end -->



	<!--====== Javascripts & Jquery ======-->
	<script src="/js/jquery-3.2.1.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>
	<script src="/js/jquery.slicknav.min.js"></script>
	<script src="/js/owl.carousel.min.js"></script>
	<script src="/js/jquery.nicescroll.min.js"></script>
	<script src="/js/jquery.zoom.min.js"></script>
	<script src="/js/jquery-ui.min.js"></script>
	<script src="/js/main.js"></script>

</body>
</html>
