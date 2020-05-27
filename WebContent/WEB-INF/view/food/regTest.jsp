<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>회원가입 테스트</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style>
.headline {
	text-align: center;
}

.loginDiv {
	margin: auto;
	width: 50%;
	border: 3px solid green;
	padding: 10px;
}
</style>
<script>
	// 아이디 정규식
	var idJ = /^[a-z0-9][a-z0-9_\-]{4,19}$/;

	// 비밀번호 정규식
	var pwJ = /^[A-Za-z0-9]{4,12}$/;
</script>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2726032665c2adf15fcbde4d8af3488c&libraries=services"></script>

</head>
<body>
	<div class="headline">
		<br>
		<h2 style="">회원가입</h2>
		<br>
	</div>
	<div class="loginDiv">
		<form method="POST" action="/food/userReg.do" method="post">
			<!-- 아이디 -->
			<div class="form-group">
				<label for="user_id">아이디</label> <input type="text"
					class="form-control" id="user_id" name="user_id" placeholder="ID"
					required>
				<!-- 아이디 중복 버튼 
					<input type="button" id="id_check_button" class="btn btn-primary px-3" value="중복확인" onclick="duplicationId();" />
					 -->
				<div class="check_font" id="id_check"></div>
			</div>
			<!-- 비밀번호 -->
			<div class="form-group">
				<label for="user_pwd">비밀번호</label> <input type="password"
					class="form-control" id="user_pwd" name="user_pwd"
					placeholder="PASSWORD" required>
				<div class="check_font" id="pwd_check"></div>
			</div>
			<!-- 비밀번호 재확인 -->
			<div class="form-group">
				<label for="user_pwd2">비밀번호 확인</label> <input type="password"
					class="form-control" id="user_pwd2" name="user_pwd2"
					placeholder="Confirm Password" required>
				<div class="check_font" id="pwd2_check"></div>
			</div>
			<!-- 이름 -->
			<div class="form-group">
				<label for="user_name">이름</label> <input type="text"
					class="form-control" id="user_name" name="user_name"
					placeholder="Name" required>
				<div class="check_font" id="name_check"></div>
			</div>
			<!-- 본인확인 이메일 -->
			<div class="form-group">
				<label for="user_email">이메일</label> <input type="text"
					class="form-control" name="user_email" id="user_email"
					placeholder="E-mail" required>
				<div class="check_font" id="email_check"></div>
			</div>
			<br>
			<div class="form-group">
				<div class="row">
					<div class="col-sm-10">
						<input type="text" id="user_loc" name="user_loc" class="form-control"
							placeholder="주소">
					</div>
					<div class="col-sm-2">
						<input type="button" class="btn btn-primary"
							onclick="sample5_execDaumPostcode()" value="주소 검색">
					</div>
				</div>
			</div>
			<br>
			<div id="map"
				style="width: 300px; height: 300px; margin-top: 10px; display: none"></div>



			<!-- 일반 사용자 체크-->
			<div class="form-check form-check-inline">
				<input type="radio" class="form-check-input" id="user_code_normal"
					name="user_code" value="n"> <label class="form-check-label"
					for="user_code_normal">일반 사용자</label>
			</div>

			<!-- CEO 사용자 체크 -->
			<div class="form-check form-check-inline">
				<input type="radio" class="form-check-input" id="user_code_ceo"
					name="user_code" value="c"> <label class="form-check-label"
					for="user_code_ceo">CEO 사용자</label>
			</div>
			<br>
			<br>
			<br>
			<div class="reg_button">
				<a class="btn btn-danger px-3"
					href="${pageContext.request.contextPath}/food/login.do"> <i
					class="fa fa-rotate-right pr-2" aria-hidden="true"></i>취소하기
				</a>&emsp;&emsp;
				<button class="btn btn-primary px-3" id="reg_submit">
					<i class="fa fa-heart pr-2" aria-hidden="true"></i>가입하기
				</button>
			</div>
		</form>
	</div>
</body>
<script type="text/javascript">
	//아이디 유효성 검사(1 = 중복 / 0 != 중복)
	$("#user_id").blur(function duplicationId() {

		var user_id = $('#user_id').val();

		$.ajax({
			async : false,
			type : "get",
			url : 'idCheck.do?user_id=' + user_id,
			data : user_id,
			success : function(data) {
				console.log("1 = 중복o / 0 = 중복x : " + data);

				if (data == 1) {
					// 1 : 아이디가 중복되는 문구
					$("#id_check").text("사용중인 아이디입니다 다른아이디를 입력해주세요");
					$("#id_check").css("color", "red");
					$("#reg_submit").attr("disabled", true);

					$("#user_id").focus();
				} else {

					if (user_id == "") {

						$('#id_check').text('아이디를 입력해주세요 :)');
						$('#id_check').css('color', 'red');
						$("#reg_submit").attr("disabled", true);

						$("#user_id").focus();

					} else if (idJ.test($('#user_id').val()) != true) {

						$('#id_check').text("4~12자의 영문, 숫자만 사용가능합니다");
						$('#id_check').css('color', 'red');
						$("#reg_submit").attr("disabled", true);

						$("#user_id").focus();
					} else {

						$('#id_check').text("사용 가능한 아이디입니다 ^^");
						$('#id_check').css('color', 'red');
						$("#reg_submit").attr("disabled", false);
					}

				}
			},
			error : function() {
				console.log("실패");
			}
		});
	});

	/* 비밀번호 일치 체크  */
	$("#user_pwd2").blur(
			function passwordCheck() {

				if (user_pwd.value != user_pwd2.value) {

					$("#pwd2_check").text("비밀번호가 일치하지 않습니다.");
					$("#pwd2_check").css("color", "red");
					$("#reg_submit").attr("disabled", true);

					$("#user_pwd").focus();

				} else if (pwJ.test($('#user_pwd').val()) != true) {
					$("#pwd2_check").text(
							"비밀번호 양식에 맞지않습니다 !! 4~12자의 영문, 숫자만 사용가능합니다.");
					$("#pwd2_check").css("color", "red");
					$("#reg_submit").attr("disabled", true);

					$("#user_pwd").focus();
				} else if (user_pwd.value == user_pwd2.value) {
					$("#pwd2_check").text("비밀번호가 일치 확인 !!");
					$("#pwd2_check").css("color", "red");
					$("#reg_submit").attr("disabled", false);
				}

			});

	/* 이메일 중복 방지  */
	$("#user_email").blur(function emailCheck() {

		var user_email = $('#user_email').val();

		$.ajax({
			async : false,
			type : "get",
			url : 'emailCheck.do?user_email=' + user_email,
			data : user_email,
			success : function(data) {
				console.log("1 = 중복o / 0 = 중복x : " + data);

				if (data == 1) {
					// 1 : 아이디가 중복되는 문구
					$("#email_check").text("사용중인 이메일입니다 다른이메일을 입력해주세요");
					$("#email_check").css("color", "red");
					$("#reg_submit").attr("disabled", true);

					$("#user_email").focus();
				} else {

					if (user_email == "") {

						$('#email_check').text('이메일을 입력해주세요 :)');
						$('#email_check').css('color', 'red');
						$("#reg_submit").attr("disabled", true);

					} else {

						$('#email_check').text("사용 가능한 이메일입니다 ^^");
						$('#email_check').css('color', 'red');
						$("#reg_submit").attr("disabled", false);
					}

				}
			},
			error : function() {
				console.log("실패");
			}
		});

	});
</script>
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
				geocoder.addressSearch(data.address, function(results, status) {
					// 정상적으로 검색이 완료됐으면
					if (status === daum.maps.services.Status.OK) {

						var result = results[0]; //첫번째 결과의 값을 활용

						// 해당 주소에 대한 좌표를 받아서
						var coords = new daum.maps.LatLng(result.y, result.x);
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
</html>