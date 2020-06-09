<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style>
a {
	color: #333;
	text-decoration: none;
}

input {
	-webkit-writing-mode: horizontal-tb !important;
	text-rendering: auto;
	color: initial;
	letter-spacing: normal;
	word-spacing: normal;
	text-transform: none;
	text-indent: 0px;
	text-shadow: none;
	display: inline-block;
	text-align: start;
	-webkit-appearance: textfield;
	background-color: white;
	-webkit-rtl-ordering: logical;
	cursor: text;
	margin: 0em;
	font: 400 13.3333px Arial;
	padding: 1px 0px;
	border-width: 2px;
	border-style: inset;
	border-color: initial;
	border-image: initial;
}

.inner_login {
	position: absolute;
	left: 50%;
	top: 50%;
	margin: -145px 0 0 -160px;
}

.login_tistory {
	position: relative;
	width: 320px;
	margin: 0 auto;
}

.screen_out {
	position: absolute;
	width: 0;
	height: 0;
	overflow: hidden;
	line-height: 0;
	text-indent: -9999px;
}

body, button, input, select, td, textarea, th {
	font-size: 13px;
	line-height: 1.5;
	-webkit-font-smoothing: antialiased;
}

fieldset, img {
	border: 0;
}

.login_tistory .box_login {
	margin: 35px 0 0;
	border: 1px solid #ddd;
	border-radius: 3px;
	background-color: #fff;
	box-sizing: border-box;
}

.login_tistory .inp_text {
	position: relative;
	width: 100%;
	margin: 0;
	padding: 18px 19px 19px;
	box-sizing: border-box;
}

.login_tistory .inp_text+.inp_text {
	border-top: 1px solid #ddd;
}

.inp_text input {
	display: block;
	width: 100%;
	height: 100%;
	font-size: 13px;
	color: #000;
	border: none;
	outline: 0;
	-webkit-appearance: none;
	background-color: transparent;
}

.btn_login {
	margin: 20px 0 0;
	width: 100%;
	height: 48px;
	border-radius: 3px;
	font-size: 16px;
	color: #fff;
	background-color: #000;
}

.login_append {
	overflow: hidden;
	padding: 15px 0 0;
}

.inp_chk {
	display: inline-block;
	position: relative;
	margin-bottom: -1px;
}

.login_append .inp_chk {
	float: left;
}

.inp_chk .inp_radio {
	position: absolute;
	z-index: -1;
	top: 0;
	left: 0;
	width: 18px;
	height: 18px;
	border: 0;
}

.inp_chk .lab_g {
	display: inline-block;
	margin-right: 19px;
	color: #909090;
	font-size: 13px;
	line-height: 19px;
	vertical-align: top;
}

.inp_chk .ico_check {
	display: inline-block;
	width: 18px;
	height: 18px;
	margin: 1px 4px 0 0;
	background-position: -60px 0;
	color: #333;
}

.inp_chk .txt_lab {
	vertical-align: top;
}

.login_append .txt_find {
	float: right;
	color: #777;
}

.wrap {
	min-width: 100%;
	min-height: 100%;
	background-image: url(/img/background.jpg);
	background-position: center;
	background-size: cover;
	position: absolute;
}

.link_find {
	color: blue;
}

h2 {
	text-align: center;
}

.txt_find {
	font-size: 2em;
	text-align: center;
}
</style>

</head>
<body>
	<div class="wrap">
		<div class="inner_login">
			<div class="login_tistory">
				<h2>아이디 찾기</h2>

				<form method="post" id="authForm" action="/tshop/findIdPost.do">
					<input type="hidden" name="redirectUrl"
						value="https://blogpack.tistory.com/manage">
					<fieldset>
						<legend class="screen_out">로그인 정보 입력폼</legend>
						<div class="box_login">
							<div class="inp_text">
								<label for="loginId" class="screen_out">이메일</label> <input
									type="email" id="user_email" name="user_email" placeholder="이메일">
							</div>
							<!-- <div class="inp_text">
								<label for="loginPw" class="screen_out">비밀번호</label> <input
									type="password" id="user_pwd" name="user_pwd"
									placeholder="비밀번호">
							</div> -->
						</div>
						<button type="submit" class="btn_login">아이디 찾기</button>
						<div class="login_append">
							<div class="inp_chk">
								<!-- 
							체크시 checked 추가
							<input type="checkbox" id="keepLogin" class="inp_radio"
								name="keepLogin"> <label for="keepLogin" class="lab_g">
								<span class="img_top ico_check"></span> <span class="txt_lab">로그인
									상태 유지</span>
							</label>
							 -->
							</div>
							<!-- 
							<div class="findDiv">
								<span class="txt_find"> <a href="/member/find/loginId"
									class="link_find">아이디</a> / <a href="/member/find/password"
									class="link_find">비밀번호 찾기</a>
								</span>
							</div>
							 -->
						</div>

					</fieldset>
				</form>

			</div>
		</div>
	</div>
	<!-- 라디오 버튼 색깔 바꾸기 -->
	<script type="text/javascript">
	$(document).ready(function() {

		$(".link_find").mouseover(function() {
			$(this).css("color", "red");
		});
		
		$(".link_find").mouseout(function() {
			$(this).css("color", "blue");
		});
	});
</script>
</body>
</html>