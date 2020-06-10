<%@page import="poly.dto.FoodStrDTO"%>
<%@page import="poly.dto.FoodUserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<!-- Theme Made By www.w3schools.com - No Copyright -->
<title>tshop 상품등록</title>
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

.row {
	display: -ms-flexbox;
	display: flex;
	-ms-flex-wrap: wrap;
	flex-wrap: wrap;
	margin-right: -15px;
	margin-left: 0px;
	margin-top: 10px;
}

.reg_button {
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
	margin-left: 15px;
}

#main {
	padding-top:50px;
	padding-bottom:50px;
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
						<a href="#" class="site-logo"><img src="/img/로고.png"
							alt="tmall로고"></a>
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
								<li><a href="#">상품보기</a></li>
							</ul></li>
					</c:if>
				</ul>
			</div>
		</nav>
	</header>
	<!-- Header section end -->


	<!-- 메인페이지  -->
	<div id="main">

		<div class="w3-container">
			<div class="headline">
				<br>
				<h2>상품등록</h2>
				<br>
			</div>
			<div class="loginDiv">
				<form method="POST" action="/tshop/regProduct.do" method="post"
					enctype="multipart/form-data">
					<!-- 메뉴이름 -->
					<div class="form-group">
						<div class="col-sm-6">
							<label for="product_name">상품 이름</label> <input type="text"
								class="form-control" id="product_name" name="product_name"
								placeholder="상품 이름" required>
						</div>
					</div>
					<!-- 메뉴 가격 -->
					<div class="row">
						<div class="col-sm-6">
							<label for="product_cost">상품 가격</label> <input type="text"
								id="product_price" name="product_price" placeholder="가격"
								class="form-control" required>
						</div>
					</div>
					<br>
					<!-- 메뉴 이미지 -->
					<div class="row">
						<div class="form-group">
							<div class="col-sm-8">
								<label for="product_img">상품 이미지</label> <input type="file"
									class="form-control input-lg" id="product_img"
									name="product_img">
							</div>
							<div class="col-sm-4">
								<div class="select_img" id="select_img">
									<img src="" />
								</div>
							</div>
						</div>
					</div>
					<br>

					<!-- 메뉴 설명 -->
					<div class="row">
						<div class="form-group">
							<div class="col-sm-6">
								<label for="menu_exp">상품 설명</label>
								<textarea rows="5" cols="100" style="resize: none;"
									id="product_exp" name="product_exp"></textarea>
							</div>
						</div>
					</div>


					<br> <br>
					<div class="reg_button">

						<button class="btn btn-primary px-3" id="reg_submit"
							onclick="submit();">상품등록</button>
						&emsp;&emsp; <a class="btn btn-danger px-3"
							href="javascript:history.back();"> <i
							class="fa fa-rotate-right pr-2" aria-hidden="true"></i>취소하기
						</a>

					</div>
					<!-- 작성자 -->
					<input type="hidden" name="user_id" id="user_id"
						value="${user.user_id }" />
				</form>
				<br> <br>
			</div>
		</div>
	</div>

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
			<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->

		</div>
	</div>
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
<style>
#main {
	margin-bottom: 50px;
	margin-top: 50px;
	width: 50%;
	margin: auto;
}
</style>
<!-- footer -->
<style>
.bg-4 {
	background-color: #2f2f2f;
	color: #ffffff;
	height: 150px;
	padding-bottom: 45px;
	padding-top: 45px;
}
</style>
<script>
	$(document).ready(
			function() {
				$("#product_img").change(
						function() {
							if (this.files && this.files[0]) {
								var reader = new FileReader;
								reader.onload = function(data) {
									$(".select_img img").attr("src",
											data.target.result).width(200);
									$(".select_img img").attr("src",
											data.target.result).height(200);

								}
								reader.readAsDataURL(this.files[0]);
							}
						});
			});
</script>
</html>
