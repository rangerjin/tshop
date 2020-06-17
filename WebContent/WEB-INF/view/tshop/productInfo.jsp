<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
</head>
<body>
	<!-- header -->
	<jsp:include page="/WEB-INF/view/tshop/mainHeader.jsp"></jsp:include>

	<!-- 본문 시작-->


	<div class="detail-wrap">
		<div class="detail-top">
			<div class="header"></div>
			<div class="main-slide-wrap">
				<div class="main-slide ng-tns-c22-4 ng-star-inserted">
					<div class="swiper-slide">
						<img style="width: 450px; height: 450px;"
							class="ng-tns-c22-4 ng-star-inserted" src="/resources/img/${productDTO.product_img }">



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
	<jsp:include page="/WEB-INF/view/tshop/footer.jsp"></jsp:include>
</body>
</html>