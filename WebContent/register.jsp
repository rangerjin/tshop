<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>회원가입</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style>
.headline {
	text-align: center;
}

.loginDiv {
	margin: auto;
	width: 80%;
	border: 3px solid black;
	padding: 10px;
}

.wrap {
	min-width: 100%;
	min-height: 100%;
	background-image: url(img/background.jpg);
	background-position: center;
	background-size: cover;
	position: absolute;
}

.form-wrap {
	width: 50%;
	position: relative;
	margin: 6% auto;
	background: #fff;
	padding: 5px;
	overflow: hidden;
	margin-top: 10px;
}

.container-fluid {
	text-align: center;
}

#checkDiv {
	margin-left: 30%;
}
</style>
<script>
	// 아이디 정규식
	var idJ = /^[a-z0-9][a-z0-9_\-]{4,19}$/;

	// 비밀번호 정규식
	var pwJ = /^[A-Za-z0-9]{4,12}$/;
</script>
</head>
<body>
	<div class="wrap">
		<div class="form-wrap">
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
								<input type="text" id="user_loc" name="user_loc"
									class="form-control" placeholder="주소">
							</div>
							<div class="col-sm-2">
								<input type="button" class="btn btn-primary"
									onclick="sample6_execDaumPostcode()" value="주소 검색">
							</div>
						</div>
						<br>
						<div>
							<input type="text" id="user_loc2" name="user_loc2"
								class="form-control" placeholder="상세주소">
						</div>
					</div>
					<br>
					<div id="checkDiv">
						<div class="row">
							<!-- 일반 사용자 체크-->
							<div class="form-check form-check-inline">
								<input type="radio" class="form-check-input"
									id="user_code_normal" name="user_code" value="n"> <label
									class="form-check-label" for="user_code_normal">일반 사용자</label>
							</div>

							<!-- 판매자 체크 -->
							<div class="form-check form-check-inline">
								<input type="radio" class="form-check-input" id="user_code_ceo"
									name="user_code" value="c"> <label
									class="form-check-label" for="user_code_ceo">판매자</label>
							</div>
						</div>
					</div>
					<br> <br>
					<div class="container-fluid">
						<div class="row">
							<div class="col-sm-6">
								<button type="button" class="btn btn-outline-primary"
									id="reg_submit">가입</button>
							</div>
							<div class="col-sm-6">
								<button type="button" class="btn btn-outline-danger"
									id="reg_cancel"
									onClick="location.href='${pageContext.request.contextPath}/food/login.do'">취소</button>
							</div>
						</div>
					</div>
					<div class="reg_button">


						<%-- 
						<a class="btn btn-danger px-3"
							href="${pageContext.request.contextPath}/food/login.do"> <i
							class="fa fa-rotate-right pr-3" aria-hidden="true"></i>취소
						</a>
						--%>
					</div>
				</form>
			</div>
		</div>
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

<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function sample6_execDaumPostcode() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 각 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var addr = ''; // 주소 변수
				var extraAddr = ''; // 참고항목 변수

				//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					addr = data.roadAddress;
				} else { // 사용자가 지번 주소를 선택했을 경우(J)
					addr = data.jibunAddress;
				}

				// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
				if (data.userSelectedType === 'R') {
					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraAddr += (extraAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if (extraAddr !== '') {
						extraAddr = ' (' + extraAddr + ')';
					}
					// 조합된 참고항목을 해당 필드에 넣는다.
					// document.getElementById("sample6_extraAddress").value = extraAddr;

				} else {
					//document.getElementById("sample6_extraAddress").value = '';
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				//document.getElementById('sample6_postcode').value = data.zonecode;
				document.getElementById("user_loc").value = addr;
				// 커서를 상세주소 필드로 이동한다.
				document.getElementById("user_loc2").focus();
			}
		}).open();
	}
</script>
</html>