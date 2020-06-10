<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page import="java.util.ArrayList"%>
<%@page import="poly.dto.FoodStrDTO"%>
<%@page import="java.util.List"%>
<%@page import="poly.util.CmmUtil"%>
<%-- 
<%
	FoodUserDTO user = (FoodUserDTO)session.getAttribute("user");
	List<FoodStrDTO> strList = (List<FoodStrDTO>) request.getAttribute("strList");
	String msg = (String) request.getAttribute("msg");
%>
 --%>
<%--  
<%
	//게시판 조회 결과 보여주기
	if (strList == null) {
		strList = new ArrayList<FoodStrDTO>();

	}
%>
 --%>
<!DOCTYPE html>
<html>
<head>
<!-- Theme Made By www.w3schools.com - No Copyright -->
<title>내상품관리</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<%-- 
<script>

	<%if (msg != null && !msg.equals("")) {%>
			alert('<%=msg%>');
<%}%>
	
</script>
 --%>
<script type="text/javascript">
	//상세보기 이동
	function doDetail(product_no) {
		location.href = "/tshop/productInfo.do?product_no=" + product_no;
	}
</script>
<style>
page-wrapper {
	margin: auto;
	width: 50%;
	margin-top: 100px;
	margin-bottom: 150px;
}

.box_img_wrap {
	width: 300px;
	height: 300px;
	border: 1px solid #d2d2d2;
	margin-left: 20%
}

.box_img_wrap {
	background-color: #ddd;
	background-position: center;
	background-repeat: no-repeat;
	background-size: cover;
}
</style>
</head>
<body>

	<!-- header -->
	<jsp:include page="/WEB-INF/view/main/mainHeader.jsp"></jsp:include>

	<div style="text-align: center">
		<h2>상품관리</h2>
	</div>
	
	<hr />
	<br />
	<div class="page-wrapper col-sm-8" style="width: 75%;">
		<div class="container-fluid" style="width: 80%;">
			<%-- 
			<%
				for (int i = 0; i < strList.size(); i++) {
					FoodStrDTO fDTO = strList.get(i);

					if (fDTO == null) {
						fDTO = new FoodStrDTO();
					}
			%>
 			--%>			
			<div class="col-sm-6" style="content-align: center">
			<%-- 
				<div class="box_img_wrap"
					style="background-image: url('/resources/img/<%=CmmUtil.nvl(fDTO.getStr_img())%>')">
				</div>
 			--%>
				<div style="text-align: center;">
					<p>
					<%-- 
						<a style="font-size: 1.5em; font-weight: bold; text-decoration:none" href="/main/strInfo.do?str_no=<%=CmmUtil.nvl(fDTO.getStr_no())%>"><%=CmmUtil.nvl(fDTO.getStr_name())%></a>
					 --%>
					</p>
				</div>
			</div>
			<%-- 
			<%
				}
			%>
 			--%>
		</div>

		<!-- 페이징 -->
		<div class="paginate" style="text-align: center;">
			<ul class="pagination">
				<li><a
					href="/main/strList.do?searchOpton=${searchOption }&nowPage=${paging.firstPageNo }">처음</a>
				<li><a
					href="/main/strList.do?searchOpton=${searchOption }&nowPage=${paging.prevPageNo }"
					class="page-item">이전</a> <c:forEach var="i"
						begin="${paging.startPageNo }" end="${paging.endPageNo }" step="1">
						<li><a class="page-link"
							href="/main/strList.do?searchOpton=${searchOption }&nowPage=${i }">&nbsp;&nbsp;${i}&nbsp;&nbsp;</a></li>
					</c:forEach>
				<li><a
					href="/main/strList.do?searchOpton=${searchOption }&nowPage=${paging.nextPageNo }"
					class="page-item">이후</a>
				<li><a
					href="/main/strList.do?searchOpton=${searchOption }&nowPage=${paging.finalPageNo }">마지막</a>
			</ul>
		</div>
	</div>
	
	<div style="clear:both; align-items: center;">
		<jsp:include page="/WEB-INF/view/main/mainFooter.jsp"></jsp:include>
	</div>
	
</body>
</html>