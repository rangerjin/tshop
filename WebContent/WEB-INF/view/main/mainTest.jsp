<%@page import="poly.dto.FoodUserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	FoodUserDTO user = (FoodUserDTO) session.getAttribute("user");
	String user_code = user.getUser_code();
	String msg = (String)request.getAttribute("msg");
%>
<!DOCTYPE html>
<html>
<head>
<!-- Theme Made By www.w3schools.com - No Copyright -->
<title>Food24 Main</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<!-- header -->
<style>
.jumbotron {
	background-color: #f4511e;
	color: #fff;
}

.menubar {
	font-size: 2em;
	text-align: center;
	background-color: #f4511e;
	margin-top: 20px;
}

.menubar a {
	color: #fff;
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

.test {
	font-size: 2em;
	text-align: center;
}

.img {
	margin-left: 25%;
}
</style>
<script>
	<%if (msg != null && !msg.equals("")) {%>
			alert('<%=msg%>');
		<%}%>
	
</script>
</head>
<body>
	<!-- header -->
	<div class="jumbotron text-center">
		<div style="float: right; color: #fff; margin: 10px; padding: 10px;">
			<a href="/logout.do" style="color: #fff; font-size: 1.5em">로그아웃</a> <a
				href="/food/myPageForm.do" style="color: #fff; font-size: 1.5em">마이페이지</a>
		</div>
		<h1>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a
				href="/food/main.do" style="color: #fff; text-decoration: none">Food24</a>
		</h1>
		<p>주변 음식점을 검색하세요</p>
		<form class="form-inline" action="/main/strList.do?searchOption=">
			<div class="input-group">
				<input type="text" class="form-control" size="50" id="searchOption" name="searchOption"
					placeholder="위치 검색" required>
				<div class="input-group-btn">
					<button type="button" class="btn btn-danger" onclick="submit();">확인</button>
				</div>
			</div>
		</form>
		<div class="menubar">
			<%if(user_code.equals("c")){ %>
			<!-- ceo 유저만 보이게 -->
			<a href="/ceo/regTest.do">매장 등록</a>
			<%} %>
		</div>
	</div>

	<!-- 메인페이지  -->
	<div class="container-fluid">
		<div class="text-center">
			<h2>추천 음식점</h2>
		</div>
		<div class="row">
			<div class="col-sm-4" style="content-align: center">
				<div class="img">
					<img src="/img/image1.jpg" style="width: 300px; height: 300px;">
				</div>
				<div style="text-align: center">
					<a class="test">영양족발</a>
				</div>
			</div>
			<div class="col-sm-4" style="content-align: center">
				<div class="img">
					<img src="/img/image2.jpg" style="width: 300px; height: 300px;">
				</div>
				<div style="text-align: center">
					<a class="test">명가원설농탕</a>
				</div>
			</div>
			<div class="col-sm-4" style="content-align: center">
				<div class="img">
					<img src="/img/image3.jpg" style="width: 300px; height: 300px;">
				</div>
				<div style="text-align: center">
					<a class="test">생고기제작소</a>
				</div>
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
</html>
