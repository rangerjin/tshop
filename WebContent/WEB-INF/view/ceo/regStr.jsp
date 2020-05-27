<%@page import="poly.dto.FoodStrDTO"%>
<%@page import="poly.dto.FoodUserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- 
<%
	FoodUserDTO uDTO = (FoodUserDTO) session.getAttribute("user");
	FoodStrDTO rDTO = (FoodStrDTO) request.getAttribute("str");
%>
 --%>
<!DOCTYPE html>
<html>
<head>
<!-- Theme Made By www.w3schools.com - No Copyright -->
<title>Food24 Main</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<!-- header -->

<script>
	$(document).ready(
			function() {
				$("#str_img").change(
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
<script>
	var regExp = /^\d{2,3}-\d{3,4}-\d{4}$/;

	/* 비밀번호 일치 체크  */
	$("#str_tel").blur(function str_tel_Check() {

		if (regExp.test($('#str_tel').val()) != true) {
			alert("전화번호 양식에 맞지않습니다 !! 02-1234-1234 양식으로 작성하시오");

			$("#str_tel").focus();
		}
	});
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/view/main/mainHeader.jsp"></jsp:include>

	<!-- 메인페이지  -->
	<div id="main">

		<div class="w3-container">
			<div class="headline">
				<br>
				<h2>매장 등록</h2>
				<br>
			</div>
			<div class="loginDiv">
				<form method="POST" action="/ceo/strReg.do" method="post"
					enctype="multipart/form-data">
					<!-- 매장 이름 -->
					<div class="form-group">
						<div class="col-sm-6">
							<label for="str_name">매장 이름</label> <input type="text"
								class="form-control" id="str_name" name="str_name"
								placeholder="매장 이름" required>
						</div>
					</div>

					<div class="form-group">
						<div class="col-sm-6">
							<label for="str_tel">매장 전화번호</label> <input type="text"
								class="form-control" id="str_tel" name="str_tel"
								placeholder="02-1234-1234" required>
						</div>
					</div>

					<div class="form-group">
						<div class="col-sm-6">
							<label for="str_time">매장 이용시간</label> <input type="text"
								class="form-control" id="str_time" name="str_time"
								placeholder="매장 이용시간" required>
						</div>
					</div>

					<br>
					<!-- 매장 이미지 -->
					<div class="row">
						<div class="form-group">
							<div class="col-sm-6">
								<label for="str_img">매장 이미지</label> <input type="file"
									class="form-control-file" id="str_img" name="str_img" size="40">
							</div>
							<div class="col-sm-4">
								<div class="select_img" id="select_img">
									<img src="" />
								</div>
							</div>
						</div>
					</div>
					<br> <input type="text" id="str_loc" name="str_loc"
						placeholder="주소" class="form-contorl"> <input type="button"
						onclick="sample5_execDaumPostcode()" class="btn btn-primary" value="주소 검색"><br>
					<div id="map"
						style="width: 300px; height: 300px; margin-top: 10px; display: none"></div>

					<script
						src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
					<script
						src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2726032665c2adf15fcbde4d8af3488c&libraries=services"></script>
					<script>
						var mapContainer = document.getElementById('map'), // 지도를 표시할 div
						mapOption = {
							center : new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
							level : 5
						// 지도의 확대 레벨
						};

						//지도를 미리 생성
						var map = new daum.maps.Map(mapContainer, mapOption);
						//주소-좌표 변환 객체를 생성
						var geocoder = new daum.maps.services.Geocoder();
						//마커를 미리 생성
						var marker = new daum.maps.Marker({
							position : new daum.maps.LatLng(37.537187,
									127.005476),
							map : map
						});

						function sample5_execDaumPostcode() {
							new daum.Postcode(
									{
										oncomplete : function(data) {
											var addr = data.address; // 최종 주소 변수

											// 주소 정보를 해당 필드에 넣는다.
											document.getElementById("str_loc").value = addr;
											// 주소로 상세 정보를 검색
											geocoder
													.addressSearch(
															data.address,
															function(results,
																	status) {
																// 정상적으로 검색이 완료됐으면
																if (status === daum.maps.services.Status.OK) {

																	var result = results[0]; //첫번째 결과의 값을 활용

																	// 해당 주소에 대한 좌표를 받아서
																	var coords = new daum.maps.LatLng(
																			result.y,
																			result.x);
																	// 지도를 보여준다.
																	mapContainer.style.display = "block";
																	map
																			.relayout();
																	// 지도 중심을 변경한다.
																	map
																			.setCenter(coords);
																	// 마커를 결과값으로 받은 위치로 옮긴다.
																	marker
																			.setPosition(coords)
																}
															});
										}
									}).open();
						}
					</script>


					<br> <br>
					<div class="reg_button">
						<a class="btn btn-danger px-3" href="javascript:history.back();">
							<i class="fa fa-rotate-right pr-2" aria-hidden="true"></i>취소하기
						</a>&emsp;&emsp;
						<button class="btn btn-primary px-3" id="reg_submit">
							<i class="fa fa-heart pr-2" aria-hidden="true"></i>작성하기
						</button>
					</div>
				</form>
				<br> <br>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/view/main/mainFooter.jsp"></jsp:include>

</body>
<style>
#main {
	margin-bottom: 50px;
	margin-top: 50px;
	width: 50%;
	margin: auto;
}
</style>
</html>
