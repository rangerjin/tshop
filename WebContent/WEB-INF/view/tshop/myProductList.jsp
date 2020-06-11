<%@page import="poly.util.CmmUtil"%>
<%@page import="java.util.ArrayList"%>
<%@page import="poly.dto.ProductDTO"%>
<%@page import="java.util.List"%>
<%@page import="poly.dto.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
	UserDTO user = (UserDTO) session.getAttribute("user");
	/* 
	List<ProductDTO> productList = (List<ProductDTO>) request.getAttribute("productList");

	if (productList == null) {
		productList = new ArrayList<ProductDTO>();
	}
	 */
	List<ProductDTO> productList = new ArrayList<ProductDTO>();

	productList = (List<ProductDTO>) request.getAttribute("productList");
%>

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

<!-- Stylesheets -->
<link rel="stylesheet" href="/css/bootstrap.min.css" />
<link rel="stylesheet" href="/css/font-awesome.min.css" />
<link rel="stylesheet" href="/css/flaticon.css" />
<link rel="stylesheet" href="/css/slicknav.min.css" />
<link rel="stylesheet" href="/css/jquery-ui.min.css" />
<link rel="stylesheet" href="/css/owl.carousel.min.css" />
<link rel="stylesheet" href="/css/animate.css" />
<link rel="stylesheet" href="/css/style.css" />

<script type="text/javascript">
	//상세보기 이동
	function doDetail(product_no) {
		location.href = "/tshop/productInfo.do?product_no=" + product_no;
	}
</script>

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

.headline {
	text-align: center;
	padding-top: 2rem;
	
}


</style>

</head>
<body>

	<!-- header -->
	<jsp:include page="/WEB-INF/view/tshop/mainHeader.jsp"></jsp:include>

	<div class="headline">
		<h2>내 상품관리</h2>
	</div>

	<hr />
	<br />
	<div class="page-wrapper col-sm-8" style="width: 75%;">
		<div class="container-fluid" style="width: 80%;">

			<%
				if (productList.size() < 0) {
			%>
			<p>등록된 상품이 없습니다</p>
			<%
				} else {
			%>
			<%
				for (int i = 0; i < productList.size(); i++) {
						ProductDTO pDTO = productList.get(i);
						/* 
						if (pDTO == null) {
							pDTO = new ProductDTO();
						}
						 */
			%>

			<div class="col-sm-6" style="content-align: center">

				<div class="box_img_wrap"
					style="background-image: url('/resources/img/<%=pDTO.getProduct_img()%>')">
				</div>
				<%-- 
				<div class="box_img_wrap"
					style="background-image: url('/resources/img/<%=CmmUtil.nvl(pDTO.getProduct_img())%>')">
				</div>
				<div class="box_img_wrap">
					<img alt="" src="/resources/img/'<%=pDTO.getProduct_img() %>'"/>
				</div>
				 --%>
				<div style="text-align: center;">
					<p>
						<a
							style="font-size: 1.5em; font-weight: bold; text-decoration: none"
							href="/tshop/productInfo.do?product_no=<%=CmmUtil.nvl(pDTO.getProduct_no())%>"><%=CmmUtil.nvl(pDTO.getProduct_name())%></a>
					</p>
					<!-- 상품 가격 -->
					<p><%=pDTO.getProduct_price()%></p>
				</div>
			</div>
			<%
				}
				}
			%>
		</div>

		<!-- 페이징 -->
		<div class="paginate" style="text-align: center;">
			<ul class="pagination">
				<li><a
					href="/tshop/strList.do?searchOpton=${searchOption }&nowPage=${paging.firstPageNo }">처음</a>
				<li><a
					href="/tshop/strList.do?searchOpton=${searchOption }&nowPage=${paging.prevPageNo }"
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

	<div style="clear: both; align-items: center;">
		<jsp:include page="/WEB-INF/view/tshop/footer.jsp"></jsp:include>
	</div>

</body>
</html>