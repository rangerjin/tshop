<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<!-- Theme Made By www.w3schools.com - No Copyright -->
<title>상품 업데이트</title>
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

<script>
	$(document).ready(
			function() {
				$("#new_file").change(
						function() {
							if (this.files && this.files[0]) {
								var reader = new FileReader;
								reader.onload = function(data) {
									$(".select_img img").attr("src", "");
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
<script>
	var regExp = /^[0-9]*$/;

	/* 가게 전화번호 체크  */
	$("#product_price").blur(function product_price_Check() {

		if (regExp.test($('#product_price').val()) != true) {
			alert("가격은 숫자만 가능합니다");

			$("#product_price").focus();
		}
	});
</script>


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
		<h2>상품 수정</h2>
	</div>

	<!--  -->
	<!-- 메인페이지  -->
	<div id="main">

		<div class="w3-container">
			<div class="headline">
				<br>
				<h2>상품 수정</h2>
				<br>
			</div>
			<div class="loginDiv">
				<form method="POST" action="/tshop/updateProductInfo.do"
					method="post" enctype="multipart/form-data">
					<!-- 상품 이름 -->
					<div class="form-group">
						<div class="col-sm-6">
							<label for="product_name">상품 이름</label> <input type="text"
								class="form-control" id="product_name" name="product_name"
								value="${product.product_name }">
						</div>
					</div>
					<!-- 상품 가격 -->
					<div class="form-group">
						<div class="col-sm-6">
							<label for="product_price">상품 가격</label> <input type="text"
								class="form-control" id="product_price" name="product_price"
								value="${product.product_price }">
						</div>
					</div>
					<!-- 매장 이름 -->
					<div class="form-group">
						<div class="col-sm-6">
							<label for="product_name">상품 설명</label> <input type="text"
								class="form-control" id="product_exp" name="product_exp"
								value="${product.product_exp }">
						</div>
					</div>


					<br>
					<!-- 매장 이미지 -->
					<div class="row">
						<div class="form-group">
							<div class="col-sm-6">
								<label for="product_img">매장 이미지</label> <input type="file"
									class="form-control-file" id="new_file" name="new_file"
									size="40">
							</div>
							<div class="col-sm-4">
								<div class="select_img" id="select_img">
									<img src="/resources/img/${product.product_img }" />
								</div>
							</div>
						</div>
					</div>


					<br> <br>
					<div class="reg_button">
						<a class="btn btn-danger px-3" href="javascript:history.back();">
							<i class="fa fa-rotate-right pr-2" aria-hidden="true"></i>취소하기
						</a>&emsp;&emsp;
						<button class="btn btn-primary px-3" id="reg_submit">
							<i class="fa fa-heart pr-2" aria-hidden="true"></i>수정하기
						</button>
					</div>
					<input type="hidden" name="product_no" id="product_no"
						value="${product.product_no }" /> <input type="hidden"
						name="product_img" id="product_img"
						value="${product.product_img }" />
				</form>
				<br> <br>
			</div>
		</div>
	</div>
	<!--  -->

	<!-- 
	<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"
		onclick="location.href='javascript:history.back()'"></span>
 	-->

	<hr />
	<br />


	<!-- 본문 끝 -->

	<div style="clear: both; align-items: center;">
		<jsp:include page="/WEB-INF/view/tshop/footer.jsp"></jsp:include>
	</div>

</body>
</html>