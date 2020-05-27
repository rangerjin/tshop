<%@page import="poly.dto.FoodStrDTO"%>
<%@page import="poly.dto.FoodUserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String menu_str_no = (String)request.getAttribute("menu_str_no");
	FoodUserDTO user = (FoodUserDTO)session.getAttribute("user");
	String user_id = user.getUser_id();
	String str_name = (String)request.getAttribute("str_name");
	
%>
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


</head>
<body>
	<jsp:include page="/WEB-INF/view/main/mainHeader.jsp"></jsp:include>

	<!-- 메인페이지  -->
	<div id="main">

		<div class="w3-container">
			<div class="headline">
				<br>
				<h2><%=str_name %> 메뉴 등록</h2>
				<br>
			</div>
			<div class="loginDiv">
				<form method="POST" action="/ceo/regMenuu.do" method="post"
					enctype="multipart/form-data">
					<!-- 메뉴이름 -->
					<div class="form-group">
						<div class="col-sm-6">
							<label for="menu_name">메뉴 이름</label> <input type="text"
								class="form-control" id="menu_name" name="menu_name"
								placeholder="메뉴 이름" required>
						</div>
					</div>
					<!-- 메뉴 가격 -->
					<div class="row">
						<div class="col-sm-6">
							<label for="menu_cost">가격</label> <input type="text"
								id="menu_cost" name="menu_cost" placeholder="가격"
								class="form-control" required>
						</div>
					</div>

					<!-- 메뉴 이미지 -->
					<div class="row">
						<div class="form-group">
							<div class="col-sm-8">
								<label for="menu_img">메뉴 이미지</label> <input type="file"
									class="form-control" id="menu_img" name="menu_img">
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
								<label for="menu_exp">메뉴 설명</label>
								<textarea rows="5" cols="100" style="resize: none;"
									id="menu_exp" name="menu_exp"></textarea>
							</div>
						</div>
					</div>


					<br> <br>
					<div class="reg_button">
						<a class="btn btn-danger px-3" href="javascript:history.back();">
							<i class="fa fa-rotate-right pr-2" aria-hidden="true"></i>취소하기
						</a>&emsp;&emsp;
						<button class="btn btn-primary px-3" id="reg_submit"
							onclick="submit();">작성하기</button>
					</div>
					<!-- 가게 번호 -->
					<input type="hidden" name="menu_str_no" id="menu_str_no" value="<%=menu_str_no %>" />
					<!-- 작성자 -->
					<input type="hidden" name="user_id" id="user_id" value="<%=user_id %>" />
				</form>
				<br> <br>
			</div>
		</div>
	</div>

	<!-- footer  -->
	<div>
		<footer class="container-fluid bg-4 text-center">
			<p>COPYRIGHT 2010 BY KOREA POLYTECHNICS. ALL RIGHTS RESERVED.</p>
			<p>MADE BY HYJ</p>
		</footer>
	</div>
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
				$("#menu_img").change(
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
