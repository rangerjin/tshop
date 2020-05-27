<%@page import="poly.dto.FoodUserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	FoodUserDTO user = (FoodUserDTO) session.getAttribute("user");
	String user_code = user.getUser_code();
%>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
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
			<input type="text" name="searchOption" id="serachOption"
				class="form-control" size="50" placeholder="위치 검색" required>
			<div class="input-group-btn">
				<button type="button" class="btn btn-danger" onClick="submit();">확인</button>
			</div>
		</div>
	</form>
	<div class="menubar">
		<!-- ceo 유저만 보이게 -->
		<%
			if (user_code.equals("c")) {
		%>
		<a href="/ceo/regTest.do">매장 등록</a>
		<%
			}
		%>
	</div>
</div>
