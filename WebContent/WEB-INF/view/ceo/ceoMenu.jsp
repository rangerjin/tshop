<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>W3.CSS</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="/resources/js/addressapi.js"></script>

<head>
<style>
#xbutton {
	text-align: right;
}


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
</head>
<body>

	<div class="w3-sidebar w3-bar-block w3-card w3-animate-left"
		style="display: none" id="mySidebar">
		<button class="w3-bar-item w3-button w3-large" onclick="w3_close()"
			id="xbutton">&times;</button>
		<a href="#" class="w3-bar-item w3-button">음식점</a> <a href="#"
			class="w3-bar-item w3-button">메뉴</a> <a href="#"
			class="w3-bar-item w3-button">마이페이지</a>
	</div>

	<div id="main">
		<div class="headline">
			<br>
			<h2 style="">음식점 등록</h2>
			<br>
		</div>
		<div class="loginDiv">
			<form method="POST" action="/" method="post">
				<!-- 아이디 -->
				<div class="form-group">
					<label for="user_id">음식점 이름</label> <input type="text"
						class="form-control" id="user_id" name="user_id" placeholder="ID"
						required>
					<!-- 아이디 중복 버튼 
					<input type="button" id="id_check_button" class="btn btn-primary px-3" value="중복확인" onclick="duplicationId();" />
					 -->
					<div class="check_font" id="id_check"></div>
				</div>

				<!-- 이름 -->
				<div class="form-group">
					<label for="user_name"></label> <input type="text"
						class="form-control" id="user_name" name="user_name"
						placeholder="Name" required>
					<div class="check_font" id="name_check"></div>
				</div>
				<div class="form-group">
					<input class="form-control" style="width: 40%; display: inline;"
						placeholder="우편번호" name="addr1" id="addr1" type="text"
						readonly="readonly">
					<button type="button" class="btn btn-default"
						onclick="execPostCode();">
						<i class="fa fa-search"></i> 우편번호 찾기
					</button>
				</div>
				<div class="form-group">
					<input class="form-control" style="top: 5px;" placeholder="도로명 주소"
						name="addr2" id="addr2" type="text" readonly="readonly" />
				</div>
				<div class="form-group">
					<input class="form-control" placeholder="상세주소" name="addr3"
						id="addr3" type="text" />
				</div>



				<div class="reg_button">
					<a class="btn btn-danger px-3"
						href="${pageContext.request.contextPath}/food/login.do"> <i
						class="fa fa-rotate-right pr-2" aria-hidden="true"></i>취소하기
					</a>&emsp;&emsp;
					<button class="btn btn-primary px-3" id="reg_submit">
						<i class="fa fa-heart pr-2" aria-hidden="true"></i>작성하기
					</button>
				</div>
			</form>
		</div>
	</div>


	<script>
		function w3_open() {
			document.getElementById("main").style.marginLeft = "25%";
			document.getElementById("mySidebar").style.width = "25%";
			document.getElementById("mySidebar").style.display = "block";
			document.getElementById("openNav").style.display = 'none';
		}
		function w3_close() {
			document.getElementById("main").style.marginLeft = "0%";
			document.getElementById("mySidebar").style.display = "none";
			document.getElementById("openNav").style.display = "inline-block";
		}
	</script>

</body>
</html>