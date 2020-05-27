<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>tmall</title>
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
<link href="img/favicon.ico" rel="shortcut icon" />

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css?family=Josefin+Sans:300,300i,400,400i,700,700i"
	rel="stylesheet">


<!-- Stylesheets -->
<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/font-awesome.min.css" />
<link rel="stylesheet" href="css/flaticon.css" />
<link rel="stylesheet" href="css/slicknav.min.css" />
<link rel="stylesheet" href="css/jquery-ui.min.css" />
<link rel="stylesheet" href="css/owl.carousel.min.css" />
<link rel="stylesheet" href="css/animate.css" />
<link rel="stylesheet" href="css/style.css" />


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

.main-menu .sub-menu a{
	color: #FFFFFF;
}

.social-links-warp{
	background: #282828; 
	padding-top: 30px;
}

.user-panel .up-item:hover>a {
	color: #f51167;
}

</style>
</head>
<body>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Header section -->
	<header class="header-section">
		<div class="header-top">
			<div class="container">
				<div class="row">
					<div class="col-lg-2 text-center text-lg-left">
						<!-- logo -->
						<a href="#" class="site-logo"><img src="img/로고.png"
							alt="tmall로고"></a>
					</div>
					<div class="col-xl-6 col-lg-5">
						<!-- <form class="header-search-form">
							<input type="text" placeholder="Search on divisima ....">
							<button>
								<i class="flaticon-search"></i>
							</button>
						</form> -->
					</div>
					<div class="col-xl-4 col-lg-5">
						<div class="user-panel">
							<div class="up-item">
								<i class="flaticon-profile"></i> <a href="#">로그인</a> / <a
									href="#">회원가입</a>
							</div>
							<div class="up-item">
								<div class="shopping-card">
									<i class="flaticon-bag"></i> <span>0</span>
								</div>
								<a href="#">Shopping Cart</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<nav class="main-navbar">
			<div class="container">
				<!-- menu -->
				<ul class="main-menu">
					<li><a href="#">드라마</a>
						<ul class="sub-menu">
							<li><a href="#">슬기로운 의사생활</a></li>
							<li><a href="#">부부의 세계</a></li>
							<li><a href="#"></a></li>
						</ul></li>
					<li><a href="#">영화</a>
						<ul class="sub-menu">
							<li><a href="#">2-1</a></li>
							<li><a href="#">2-2</a></li>
							<li><a href="#">2-3</a></li>
						</ul></li>
					<li><a href="#">예능</a>
						<ul class="sub-menu">
							<li><a href="#">3-1</a></li>
							<li><a href="#">3-2</a></li>
							<li><a href="#">3-3</a></li>
						</ul></li>
				</ul>
			</div>
		</nav>
	</header>
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
						<img src="img/부부 index.png" alt="Los Angeles" style="width: 100%;">
					</div>

					<div class="item">
						<img src="img/슬기로운생활 index.png" alt="Chicago" style="width: 100%;">
					</div>

					<div class="item">
						<img src="img/밥블레스유.png" alt="New york" style="width: 100%;">
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


	<!-- Hero section -->
	<!-- 
	<section class="hero-section">
		<div class="hero-slider owl-carousel">
			<div class="hs-item set-bg" data-setbg="img/bg.jpg">
				<div class="container">
					<div class="row">
						<div class="col-xl-6 col-lg-7 text-white">
							<span>New Arrivals</span>
							<h2>denim jackets</h2>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit,
								sed do eiusmod tempor incididunt ut labore et dolore magna
								aliqua. Quis ipsum sus-pendisse ultrices gravida. Risus commodo
								viverra maecenas accumsan lacus vel facilisis.</p>
							<a href="#" class="site-btn sb-line">DISCOVER</a> <a href="#"
								class="site-btn sb-white">ADD TO CART</a>
						</div>
					</div>
					<div class="offer-card text-white">
						<span>from</span>
						<h2>$29</h2>
						<p>SHOP NOW</p>
					</div>
				</div>
			</div>
			<div class="hs-item set-bg" data-setbg="img/bg-2.jpg">
				<div class="container">
					<div class="row">
						<div class="col-xl-6 col-lg-7 text-white">
							<span>New Arrivals</span>
							<h2>denim jackets</h2>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit,
								sed do eiusmod tempor incididunt ut labore et dolore magna
								aliqua. Quis ipsum sus-pendisse ultrices gravida. Risus commodo
								viverra maecenas accumsan lacus vel facilisis.</p>
							<a href="#" class="site-btn sb-line">DISCOVER</a> <a href="#"
								class="site-btn sb-white">ADD TO CART</a>
						</div>
					</div>
					<div class="offer-card text-white">
						<span>from</span>
						<h2>$29</h2>
						<p>SHOP NOW</p>
					</div>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="slide-num-holder" id="snh-1"></div>
		</div>
	</section> -->

	<!-- Hero section end -->



	<!-- Features section -->
	<!-- 
	<section class="features-section">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-4 p-0 feature">
					<div class="feature-inner">
						<div class="feature-icon">
							<img src="img/icons/1.png" alt="#">
						</div>
						<h2>Fast Secure Payments</h2>
					</div>
				</div>
				<div class="col-md-4 p-0 feature">
					<div class="feature-inner">
						<div class="feature-icon">
							<img src="img/icons/2.png" alt="#">
						</div>
						<h2>Premium Products</h2>
					</div>
				</div>
				<div class="col-md-4 p-0 feature">
					<div class="feature-inner">
						<div class="feature-icon">
							<img src="img/icons/3.png" alt="#">
						</div>
						<h2>Free & fast Delivery</h2>
					</div>
				</div>
			</div>
		</div>
	</section>
	 -->
	<!-- Features section end -->


	<!-- letest product section -->
	<section class="top-letest-product-section">
		<div class="container">
			<div class="section-title">
				<h2>BEST PRODUCTS</h2>
			</div>
			<div class="product-slider owl-carousel">
				<div class="product-item">
					<div class="pi-pic">
						<img src="./img/product/1.jpg" alt="">
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
						<img src="./img/product/2.jpg" alt="">
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
						<img src="./img/product/3.jpg" alt="">
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
						<img src="./img/product/4.jpg" alt="">
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
						<img src="./img/product/6.jpg" alt="">
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
		<div class="social-links-warp">
			<div class="container">
 			
				<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
				<p class="text-white text-center mt-5">
					Copyright &copy;
					<script>
						document.write(new Date().getFullYear());
					</script>
					BY KOREA POLYTECHNICS. ALL RIGHTS RESERVED. MADE BY HYJ
				</p>
				<p> git bash 저장 테스트 2</p>
				<p> git bash 저장 테스트 3</p>
				<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->

			</div>
		</div>
	<!-- </section> -->
	<!-- Footer section end -->



	<!--====== Javascripts & Jquery ======-->
	<script src="js/jquery-3.2.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.slicknav.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/jquery.nicescroll.min.js"></script>
	<script src="js/jquery.zoom.min.js"></script>
	<script src="js/jquery-ui.min.js"></script>
	<script src="js/main.js"></script>

</body>
</html>
