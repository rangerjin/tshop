<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 상세보기</title>
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
<style>
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

.detail-top {
	text-align: center;
	width: 1200px;
	margin: 0 auto;
}

.detail-top .header {
	padding-top: 13px;
}

.main-slide-wrap {
	padding-top: 10px;
	font-size: 0;
}

.main-slide ng-tns-c22-4 ng-star-inserted {
	padding-bottom: 50px;
}

.main-slide-wrap .main-slide {
	width: 900px;
	margin: 0 auto;
	position: relative;
}

.main-slide-wrap .main-slide .swiper-slide {
	margin: 0 auto;
}

.detail-top .title {
	font-size: 30px;
	font-weight: 800;
	color: #333;
	padding-bottom: 15px;
}

.detail-top .title {
	font-size: 30px;
	font-weight: 800;
	color: #333;
	padding-bottom: 15px;
}
</style>
<style>
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

.user-panel .up-item:hover>a {
	color: #f51167;
}
</style>
<style>
.social-links-warp {
	background: #282828;
	padding-top: 30px;
}
</style>
</head>
<body>
	<!-- header -->

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
						<a href="#" class="site-logo"><img src="/img/로고.png"
							alt="tmall로고"
							onclick="javascript:location.href='/tshop/test.do';"></a>
					</div>
					<div class="col-xl-6 col-lg-5"></div>
					<div class="col-xl-4 col-lg-5">
						<div class="user-panel">
							<div class="up-item">
								<c:if test="${user }!=null">

								</c:if>
								<c:choose>
									<c:when test="${not empty user}">
										<i class="flaticon-profile"></i>
										<a href="<c:url value="/tshop/myPage.do" />">
											${user.user_name} </a> / <a
											href="<c:url value="/tshop/ㅣlogout.do" />">로그아웃</a>
									</c:when>
									<c:otherwise>
										<i class="flaticon-profile"></i>
										<a href="<c:url value="/tshop/login.do" />">로그인</a> / <a
											href="<c:url value="/tshop/register.do" />">회원가입</a>
									</c:otherwise>

								</c:choose>
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
					<c:if test="${user.user_code == 'c'}">
						<li><a href="#">상품 관리</a>
							<ul class="sub-menu">
								<li><a href="<c:url value="/tshop/regProductForm.do" />">상품등록</a></li>
								<li><a href="/tshop/myProductList.do">상품보기</a></li>
							</ul></li>
					</c:if>
				</ul>
			</div>
		</nav>
	</header>

	<!--====== Javascripts & Jquery ======-->
	<script src="/js/jquery-3.2.1.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>
	<script src="/js/jquery.slicknav.min.js"></script>
	<script src="/js/owl.carousel.min.js"></script>
	<script src="/js/jquery.nicescroll.min.js"></script>
	<script src="/js/jquery.zoom.min.js"></script>
	<script src="/js/jquery-ui.min.js"></script>
	<script src="/js/main.js"></script>


	<!-- header end -->

	<!-- 본문 시작-->


	<div class="detail-wrap">
		<div class="detail-top">
			<div class="header"></div>
			<div class="main-slide-wrap">
				<div class="main-slide ng-tns-c22-4 ng-star-inserted">
					<div class="swiper-slide">
						<img style="width: 450px; height: 450px;"
							class="ng-tns-c22-4 ng-star-inserted"
							src="/resources/img/${productDTO.product_img }">



					</div>
				</div>
			</div>
			<div class="goods-title">
				<div class="action-btn ns-regular"></div>

				<div class="sum-title ns-regular ng-tns-c22-4 ng-star-inserted"></div>
				<div class="title ns-extra">${productDTO.product_name }</div>


				<div class="price rb-bold ng-tns-c22-4 ng-star-inserted">



					<span class="goods-price">${productDTO.product_price } <span
						class="won ns-regular">원</span>
					</span>



					<div style="display: inline-block;"
						class="ng-tns-c22-4 ng-star-inserted"></div>
				</div>

			</div>

		</div>
	</div>
	<!-- 본문 끝 -->



	<!-- footer -->
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
			<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->

		</div>
	</div>


	<!-- footer end -->
</body>
</html>