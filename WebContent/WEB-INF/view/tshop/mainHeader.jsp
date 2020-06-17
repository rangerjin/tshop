<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Page Preloder -->
<div id="preloder">
	<div class="loader"></div>
</div>

<!-- Header section -->
<header class="header-section">
	<div class="header-top">
		<div class="container">
			<div class="row">
				<div class="col-lg-2 text-center text-lg-left">
					<!-- logo -->
					<a href="#" class="site-logo"><img src="/img/로고.png"
						alt="tmall로고" onclick="javascript:location.href='/tshop/test.do';"></a>
				</div>
				<div class="col-xl-6 col-lg-5"></div>
				<div class="col-xl-4 col-lg-5">
					<div class="user-panel">
						<div class="up-item">
							<c:if test="${user }!=null">

							</c:if>
							<c:choose>
								<c:when test="${not empty user}">
									<i class="flaticon-profile"></i>
									<a href="<c:url value="/tshop/myPage.do" />">
										${user.user_name} </a> / <a
										href="<c:url value="/tshop/ㅣlogout.do" />">로그아웃</a>
								</c:when>
								<c:otherwise>
									<i class="flaticon-profile"></i>
									<a href="<c:url value="/tshop/login.do" />">로그인</a> / <a
										href="<c:url value="/tshop/register.do" />">회원가입</a>
								</c:otherwise>

							</c:choose>
						</div>
						<div class="up-item">
							<div class="shopping-card">
								<i class="flaticon-bag"></i> <span>0</span>
							</div>
							<a href="#">Shopping Cart</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<nav class="main-navbar">
		<div class="container">
			<!-- menu -->
			<ul class="main-menu">
				<li><a href="#">드라마</a>
					<ul class="sub-menu">
						<li><a href="#">슬기로운 의사생활</a></li>
						<li><a href="#">부부의 세계</a></li>
						<li><a href="#"></a></li>
					</ul></li>
				<li><a href="#">영화</a>
					<ul class="sub-menu">
						<li><a href="#">2-1</a></li>
						<li><a href="#">2-2</a></li>
						<li><a href="#">2-3</a></li>
					</ul></li>
				<li><a href="#">예능</a>
					<ul class="sub-menu">
						<li><a href="#">3-1</a></li>
						<li><a href="#">3-2</a></li>
						<li><a href="#">3-3</a></li>
					</ul></li>
				<c:if test="${user.user_code == 'c'}">
					<li><a href="#">상품 관리</a>
						<ul class="sub-menu">
							<li><a href="<c:url value="/tshop/regProductForm.do" />">상품등록</a></li>
							<li><a href="/tshop/myProductList.do">상품보기</a></li>
						</ul></li>
				</c:if>
			</ul>
		</div>
	</nav>
</header>

<!--====== Javascripts & Jquery ======-->
<script src="/js/jquery-3.2.1.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
<script src="/js/jquery.slicknav.min.js"></script>
<script src="/js/owl.carousel.min.js"></script>
<script src="/js/jquery.nicescroll.min.js"></script>
<script src="/js/jquery.zoom.min.js"></script>
<script src="/js/jquery-ui.min.js"></script>
<script src="/js/main.js"></script>

<style>
.main-menu {
	text-align: center;
}

.container {
	width: 100%;
}

#imgDiv {
	margin-top: 50px;
}

.main-menu .sub-menu {
	text-align: left;
	background: #282828;
	color: white;
}

.main-menu .sub-menu a {
	color: #FFFFFF;
}

.user-panel .up-item:hover>a {
	color: #f51167;
}
</style>