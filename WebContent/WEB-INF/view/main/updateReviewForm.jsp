<%@page import="poly.dto.StrReviewDTO"%>
<%@page import="poly.dto.MenuDTO"%>
<%@page import="poly.dto.FoodStrDTO"%>
<%@page import="poly.dto.FoodUserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	FoodUserDTO user =	(FoodUserDTO)session.getAttribute("user");
	String user_id = user.getUser_id();
	StrReviewDTO review = (StrReviewDTO)request.getAttribute("review");
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
				<h2>댓글 수정</h2>
				<br>
			</div>
			<div class="loginDiv">
				<form method="POST" action="/main/updateReviewNoAjax.do" method="post">
				
				<textarea rows="2" cols="50" placeholder="댓글을 작성해 주시요" name="review_cont" id="review_cont" style="resize: none;"><%=review.getReview_cont() %></textarea>
				
					<br> <br>
					<div class="reg_button">
						<a class="btn btn-danger px-3" href="javascript:history.back();">
							<i class="fa fa-rotate-right pr-2" aria-hidden="true"></i>취소하기
						</a>&emsp;&emsp;
						<button class="btn btn-primary px-3" id="reg_submit"
							onclick="submit();">수정하기</button>
					</div>
					<input type="hidden" name="review_no" id="review_no" value="${review.review_no }" />					
					<input type="hidden" name="review_str_no" id="review_str_no" value="${review.review_str_no }" />
					<input type="hidden" name="user_id" id="user_id" value="${review.user_id}" />
					<input type="hidden" name="reviewNowPage" value="${param.reviewNowPage }" />
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

</html>
