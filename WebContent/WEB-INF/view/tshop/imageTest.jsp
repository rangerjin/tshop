<%@page import="java.util.ArrayList"%>
<%@page import="poly.dto.ProductDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	List<ProductDTO> productList = new ArrayList<ProductDTO>();

	productList = (List<ProductDTO>) request.getAttribute("productList");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>image url test</title>
<style>
.page-wrapper {
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
	<%
		for (int i = 0; i < productList.size(); i++) {
			ProductDTO pDTO = productList.get(i);
	%>
	<%-- <img src="/resources/img/<%=pDTO.getProduct_img()%>"> --%>
	<div class="box_img_wrap"
					style="background-image: url('/resources/img/<%=pDTO.getProduct_img() %>')">
				</div>
	<%
		}
	%>
</body>
</html>