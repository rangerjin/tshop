<%@page import="poly.dto.FoodUserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	FoodUserDTO user = (FoodUserDTO) session.getAttribute("user");
%>

<%
	String msg = (String) request.getAttribute("msg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	
<%if (msg != null && !msg.equals("")) {%>
alert('<%=msg%>');
<%}%>
	function stop() {
		var con_test = confirm("정말 회원 탈퇴를 하시겠습니까?");
		if (con_test == true) {
			location.href = "/food/stop.do";
		}
	}
</script>
<style>
.loginDiv {
	width: 50%;
	margin: auto;
	margin-bottom: 100px;
}

.reg_button {
	margin-top: 30px;
}

.reg_button button {
	margin: 10px;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/view/main/mainHeader.jsp"></jsp:include>
	<div class="headline">
		<br>
		<h2 style="text-align: center">마이페이지</h2>
		<br>
	</div>
	<div class="loginDiv">
		<!-- 본인확인 이메일 -->
		<div class="form-group">
			<label for="user_email">이메일</label> <input type="text"
				class="form-control" name="user_email" id="user_email"
				value="<%=user.getUser_email()%>" readonly="readonly">
			<div class="check_font" id="email_check"></div>
		</div>

		<!-- 비밀번호 -->
		<div class="form-group">
			<label for="user_pwd">비밀번호</label> <input type="password"
				class="form-control" id="user_pwd" name="user_pwd"
				value="<%=user.getUser_pwd()%>" readonly="readonly">
			<div class="check_font" id="pwd_check"></div>
		</div>

		<div class="form-group">
			<label for="user_loc">주소</label>
			<div class="row">
				<div class="col-sm-10">
					<input type="text" id="user_loc" placeholder="주소"
						class="form-control" style="width: 100%;"
						value="<%=user.getUser_loc()%>" readonly="readonly">
				</div>
				<div class="col-sm-2">
					<input type="button" class="btn btn-primary"
						onclick="sample5_execDaumPostcode()" value="검색"
						disabled="disabled"><br>

				</div>
			</div>
		</div>
		<div id="map"
			style="width: 300px; height: 300px; margin-top: 10px; display: none"></div>

		<script
			src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=373401&libraries=services"></script>
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
				position : new daum.maps.LatLng(37.537187, 127.005476),
				map : map
			});

			function sample5_execDaumPostcode() {
				new daum.Postcode({
					oncomplete : function(data) {
						var addr = data.address; // 최종 주소 변수

						// 주소 정보를 해당 필드에 넣는다.
						document.getElementById("user_loc").value = addr;
						// 주소로 상세 정보를 검색
						geocoder.addressSearch(data.address, function(results,
								status) {
							// 정상적으로 검색이 완료됐으면
							if (status === daum.maps.services.Status.OK) {

								var result = results[0]; //첫번째 결과의 값을 활용

								// 해당 주소에 대한 좌표를 받아서
								var coords = new daum.maps.LatLng(result.y,
										result.x);
								// 지도를 보여준다.
								mapContainer.style.display = "block";
								map.relayout();
								// 지도 중심을 변경한다.
								map.setCenter(coords);
								// 마커를 결과값으로 받은 위치로 옮긴다.
								marker.setPosition(coords)
							}
						});
					}
				}).open();
			}
		</script>


		<div class="reg_button">
			<button class="btn btn-success"
				onclick="location.href='/food/modifyForm.do'">수정</button>
			<button class="btn btn-danger" onclick="stop();">회원 탈퇴</button>
		</div>


	</div>
	<jsp:include page="/WEB-INF/view/main/mainFooter.jsp"></jsp:include>
</body>
</html>