<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<!-- Theme Made By www.w3schools.com - No Copyright -->
<title>상품 상세보기</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<!-- Stylesheets -->
<link rel="stylesheet" href="/css/bootstrap.min.css" />
<link rel="stylesheet" href="/css/font-awesome.min.css" />
<link rel="stylesheet" href="/css/flaticon.css" />
<link rel="stylesheet" href="/css/slicknav.min.css" />
<link rel="stylesheet" href="/css/jquery-ui.min.css" />
<link rel="stylesheet" href="/css/owl.carousel.min.css" />
<link rel="stylesheet" href="/css/animate.css" />
<link rel="stylesheet" href="/css/style.css" />


<style>
.page-wrapper {
	margin: auto;
	width: 50%;
	margin-top: 100px;
	margin-bottom: 150px;
	width: 75%;
}

.headline {
	text-align: center;
	padding-top: 2rem;
}

.container-fluid {
	style: width: 80%;
}
</style>
<!-- 모방 스타일 -->
<style>
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

.box-content ng-star-inserted button {
	width: 259px;
	height: 56px;
	color: #fff;
	border: 0;
	font-size: 20px;
}

.cart {
	background-color: #999;
	color: white;
}

.purchase {
	background-color: #212121;
	color: white;
}

#productDiv {
	width: 1200px;
	margin: 0 auto;
	background-color: #f7f7f7;
	padding: 38px 40px 30px;
	margin-bottom: 50px;
}
#productRow1 {
	margin: 20px;
	font-size: 2em;
	text-align: left;
}
#productRow2 {
	margin: 20px;
	font-size: 2em;
	text-align: left;
}
</style>
<!-- 모방 스타일 end -->


</head>
<body>

	<!-- header -->
	<jsp:include page="/WEB-INF/view/tshop/mainHeader.jsp"></jsp:include>

	<div class="headline">
		<h2>내 상품관리</h2>
	</div>

	<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"
		onclick="location.href='javascript:history.back()'"></span>

	<hr />
	<br />

	<!-- 모방 div -->
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
					<!-- 상품 박스 -->

					<div class="container show-grid" id="productDiv">
						<div class="row" id="productRow1">
							<div class="col-md-5">상품번호 : ${productDTO.product_no }</div>
							<div class="col-md-5">상품가격 : ${productDTO.product_price } 원</div>
						</div>
						<div class="row" id="productRow2">
							<div class="col-md-5">상품설명 : ${productDTO.product_exp }</div>
							<div class="col-md-5">
								<button class="cart" type="button">장바구니</button>
								<button class="purchase" type="button">바로구매</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 모방 div end -->

	<!-- 본문 끝 -->

	<div style="clear: both; align-items: center;">
		<jsp:include page="/WEB-INF/view/tshop/footer.jsp"></jsp:include>
	</div>

</body>
</html>