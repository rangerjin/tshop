<%@page import="poly.dto.MenuDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="poly.util.CmmUtil"%>
<%@page import="poly.dto.FoodUserDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="poly.dto.StrReviewDTO"%>
<%@page import="java.util.List"%>
<%@page import="poly.dto.FoodStrDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	FoodStrDTO strInfo = (FoodStrDTO) request.getAttribute("strInfo");
	List<StrReviewDTO> reviewList = (List<StrReviewDTO>) request.getAttribute("reviewList");
	FoodUserDTO user = (FoodUserDTO) session.getAttribute("user");
	String searchOption = (String) session.getAttribute("searchOption");
	List<MenuDTO> menuList = (List<MenuDTO>) request.getAttribute("menuList");
	String str_no = strInfo.getStr_no();
	String menuNowPage = (String)request.getAttribute("menuNowPage");
	String reviewNowPage = (String)request.getAttribute("reviewNowPage");
	

	if (strInfo == null) {
		strInfo = new FoodStrDTO();
	}

	if (reviewList == null) {
		reviewList = new ArrayList<StrReviewDTO>();
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2726032665c2adf15fcbde4d8af3488c&libraries=services"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<title>매장정보</title>

<script type="text/javascript">
	// 메뉴 상세보기 이동
	function doDetail(menu_no) {
		location.href = "/main/strInfo.do?menu_no=" + menu_no;
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

#menuDiv {
	margin-bottom: 100px;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/view/main/mainHeader.jsp"></jsp:include>
	<!-- 
	<div style="text-align: center; margin:10px;">
			<button class="btn btn-primary" onclick="strfunc();">매장 정보</button>
			<button class="btn btn-secondary" onclick="menufunc();">메뉴 정보</button>
			<button class="btn btn-warning" onclick="reviewfunc();">댓글</button>
	</div>
	 -->
	<div id="strInfo">
		<div class="headline">
			<br>
			<h2 style="text-align: center"><%=strInfo.getStr_name()%>
				매장 정보
			</h2>
			<br>
		</div>
		<!-- 매장 정보 div -->
		<div class="container" id="strDiv"
			style="text-align: left; width: 50%; margin: auto; margin-bottom: 100px;">

			<div class="row" style="padding-left:15%;">
				<div class="col-xs-6">
					<div style="margin-top:10px;"><label for="str_loc">매장 위치 : </label>  <%=strInfo.getStr_loc()%></div>
					<div style="margin-top:10px;"><label for="str_time">매장 이용시간 : </label>  <%=strInfo.getStr_time()%></div>
					<div style="margin-top:10px;"><label for="str_tel">매장 전화번호 : </label>  <%=strInfo.getStr_tel()%></div>
					
					<!-- 길찾기 -->
					<div style="margin-top:50px;">
						<a style="font-size: 1.2em; text-decoration:none;margin-top:50px;" href="http://map.daum.net/?sName=${user.user_loc }&eName=${strInfo.str_loc }">매장 길찾기</a>
					</div>
					
				</div>
				<div class="col-xs-6">
					<!-- 이미지 지도를 표시할 div 입니다 -->
					<div id="map" style="width: 300px; height: 300px;"></div>

				</div>

			</div>
			<br>
			<div class="btn-group btn-group-sm" role="group">
				<%
					if (user.getUser_id().equals(strInfo.getUser_id())) {
				%>
				<button type="button" class="btn btn-danger" style="margin: 10px;"
					onclick="location.href='/ceo/delStr.do?str_no=<%=strInfo.getStr_no()%>'">삭제</button>
				<button type="button" class="btn btn-primary" style="margin: 10px;"
					onclick="location.href='/ceo/updateStrForm.do?str_no=<%=strInfo.getStr_no()%>'">수정</button>
				<%
					}
				%>
				<button type="button" class="btn btn-default" style="margin: 10px;"
					onclick="location.href='/main/strList.do?searchOption=<%=searchOption%>'">목록</button>
				<!-- 카카오 버튼 -->
				<div style="float: right">
					<a id="kakao-link-btn" href="javascript:;"> <img
						src="//developers.kakao.com/assets/img/about/logos/kakaolink/kakaolink_btn_medium.png" />
					</a>
				</div>

			</div>
		</div>
	</div>

	<script type='text/javascript'>
  //<![CDATA[
    // // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('2726032665c2adf15fcbde4d8af3488c');
    // // 카카오링크 버튼을 생성합니다. 처음 한번만 호출하면 됩니다.
    Kakao.Link.createDefaultButton({
      container: '#kakao-link-btn',
      objectType: 'feed',
      content: {
        title: '카카오톡 공유 테스트',
        description: '#food24',
        imageUrl: 'http://localhost:8080/img/food24.png',
        link: {
          mobileWebUrl: 'http://localhost:8080/main/strInfo.do?str_no=${strInfo.str_no}',
          webUrl: 'http://localhost:8080/main/strInfo.do?str_no=${strInfo.str_no}'
        }
      },
      social: {
        likeCount: 286,
        commentCount: 45,
        sharedCount: 845
      },
      buttons: [
        {
          title: '웹으로 보기',
          link: {
            mobileWebUrl: 'http://localhost:8080/main/strInfo.do?str_no=${strInfo.str_no}',
            webUrl: 'http://localhost:8080/main/strInfo.do?str_no=${strInfo.str_no}'
          }
        },
        {
          title: '앱으로 보기',
          link: {
            mobileWebUrl: 'http://localhost:8080/main/strInfo.do?str_no=${strInfo.str_no}',
            webUrl: 'http://localhost:8080/main/strInfo.do?str_no=${strInfo.str_no}'
          }
        }
      ]
    });
  //]]>
</script>

	<!-- 메뉴 리스트 div -->
	<div id="menuInfo">
		<div class="container" id="menuDiv">
			<!-- 메뉴  등록하기 버튼  -->
			<form action="/ceo/regMenuForm.do" method="post">
				<input type="hidden" name="menu_str_no"
					value="<%=strInfo.getStr_no()%>">
				<%if(strInfo.getUser_id().equals(user.getUser_id())) {%>
				<button class="btn btn-primary" onclick="submit();">메뉴 등록</button>
				<%} %>
			</form>
			<div style="text-align: center">
				<hr>
				<h2>메뉴 리스트</h2>
			</div>
			<hr />
			<br />
			<div class="page-wrapper">
				<div class="container-fluid">
					<%
						for (int i = 0; i < menuList.size(); i++) {
							MenuDTO mDTO = menuList.get(i);

							if (mDTO == null) {
								mDTO = new MenuDTO();
							}
					%>
					<div class="col-sm-4"
						style="content-align: center; margin-bottom: 20px; margin-left: 10%;">
						<div class="box_img_wrap"
							style="background-image: url('/resources/menuImg/<%=CmmUtil.nvl(mDTO.getMenu_img())%>')">
						</div>

						<div style="text-align: center; margin-left:35%;">
							<p><%=CmmUtil.nvl(mDTO.getMenu_name())%></p>
							<p>	가격 : <%=mDTO.getMenu_cost()%></p>
								
						</div>
						<%
							if (user.getUser_id().equals(mDTO.getUser_id())) {
						%>
						<div style="margin-bottom: 20px; margin-top: 20px;">
							<div class="col-sm-2" style="margin-left: 30%;">
								<button class="btn btn-primary" 
									onclick="location.href='/ceo/updateMenuForm.do?menu_no=<%=CmmUtil.nvl(mDTO.getMenu_no())%>&menuNowPage=${menuNowPage }'">메뉴
									수정</button>
							</div>
							<div class="col-sm-2" style="margin-left: 25%;">
								<button class="btn btn-danger" 
									onclick="location.href='/ceo/deleteMenu.do?menu_no=<%=CmmUtil.nvl(mDTO.getMenu_no())%>&menuNowPage=${param.menuNowPage }'">메뉴
									삭제</button>
							</div>
						</div>
						<%
							}
						%>
					</div>
					<%
						}
					%>
				</div>
				<!-- 페이징 -->
				<div class="paginate" style="text-align: center;">
					<ul class="pagination">
						<li><a
							href="/main/strInfo.do?str_no=${str_no }&menuNowPage=${menuPaging.firstPageNo }">처음</a>
						<li><a
							href="/main/strInfo.do?str_no=${str_no }&menuNowPage=${menuPaging.prevPageNo }"
							class="page-item">이전</a> <c:forEach var="i"
								begin="${menuPaging.startPageNo }"
								end="${menuPaging.endPageNo }" step="1">
								<li><a class="page-link"
									href="/main/strInfo.do?str_no=${str_no }&menuNowPage=${i }">&nbsp;&nbsp;${i}&nbsp;&nbsp;</a></li>
							</c:forEach>
						<li><a
							href="/main/strInfo.do?str_no=${str_no }&menuNowPage=${menuPaging.nextPageNo }"
							class="page-item">이후</a>
						<li><a
							href="/main/strInfo.do?str_no=${str_no }&menuNowPage=${menuPaging.finalPageNo }">마지막</a>
					</ul>
				</div>
			</div>
		</div>
	</div>

	<!-- 매장 정보 div End -->

	<div id="reviewInfo">

		<!-- 댓글 리스트 -->
		<div id="reviewListDiv" class="container" style="margin-bottom: 10px;">
			<%
				if (reviewList.size() > 0) {
			%>
			<table class="table table-striped">
				<thead>
					<tr>
						<th width="20%" class="text-center">아이디</th>
						<th width="50%" class="text-center">리뷰 내용</th>
						<th width="15%" class="text-center">수정</th>
						<th width="15%" class="text-center">삭제</th>
					</tr>
				</thead>
				<tbody>
					<%
					for (int i = 0; i < reviewList.size(); i++) {
							StrReviewDTO rDTO = reviewList.get(i);
								if (rDTO == null) {
								rDTO = new StrReviewDTO();
								}
				%>
					<tr>
						<th width="20%" class="text-center"><%=rDTO.getUser_id()%></th>
						<th width="50%" align="center"><%=rDTO.getReview_cont()%></th>
						<th width="15%" class="text-center">
							<%if(rDTO.getUser_id().equals(user.getUser_id())){ %>
							<button class="btn btn-primary"
								onclick="location.href='/main/updateReviewFormNoAjax.do?review_no=<%=rDTO.getReview_no()%>&reviewNowPage=${param.reviewNowPage }'">
								댓글 수정</button> <%} %>
						</th>
						<th width="15%" class="text-center">
							<%if(rDTO.getUser_id().equals(user.getUser_id())){ %>
							<button class="btn btn-danger"
								onclick="location.href='/main/deleteReviewNoAjax.do?review_no=<%=rDTO.getReview_no()%>'">댓글
								삭제</button> <%} %>
						</th>
					</tr>
					<%
							}
						%>
				</tbody>
				<!-- 페이징 -->
			</table>
			<%
				}
			%>
			<div class="paginate" style="text-align: center;">
				<ul class="pagination">
					<li><a
						href="/main/strInfo.do?str_no=${str_no }&reviewNowPage=${reviewPaging.firstPageNo }">처음</a>
					<li><a
						href="/main/strInfo.do?str_no=${str_no }&reviewNowPage=${reviewPaging.prevPageNo }"
						class="page-item">이전</a> <c:forEach var="i"
							begin="${reviewPaging.startPageNo }"
							end="${reviewPaging.endPageNo }" step="1">
							<li><a class="page-link"
								href="/main/strInfo.do?str_no=${str_no }&reviewNowPage=${i }">&nbsp;&nbsp;${i}&nbsp;&nbsp;</a></li>
						</c:forEach>
					<li><a
						href="/main/strInfo.do?str_no=${str_no }&reviewNowPage=${reviewPaging.nextPageNo }"
						class="page-item">이후</a>
					<li><a
						href="/main/strInfo.do?str_no=${str_no }&reviewNowPage=${reviewPaging.finalPageNo }">마지막</a>
				</ul>
			</div>
		</div>
		<!-- 댓글 작성 div -->
		<div class="container">

			<form action="/main/insertReviewNoAjax.do" method="post">
				<input type="hidden" id="review_str_no" name="review_str_no"
					value="<%=strInfo.getStr_no()%>"> <input type="hidden"
					id="user_id" name="user_id" value="<%=user.getUser_id()%>">
				<br> <br>
				<div>
					<div>
						<span><strong>댓글</strong></span>
					</div>
					<div>
						<table class="table">
							<tr>
								<td><textarea style="width: 1000px; resize: none;" rows="3"
										cols="30" id="review_cont" name="review_cont"
										placeholder="댓글을 입력하세요"></textarea></td>
								<td>
									<button onClick="submit()" class="btn pull-right btn-success">댓글
										등록</button>
								</td>
							</tr>
						</table>
					</div>
				</div>

			</form>
		</div>
		<!-- 댓글 작성 div End-->
	</div>

	<jsp:include page="/WEB-INF/view/main/mainFooter.jsp"></jsp:include>

</body>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();
var loc = '<%=strInfo.getStr_loc()%>';
var strname = '<%=strInfo.getStr_name()%>';

	// 주소로 좌표를 검색합니다
	geocoder
			.addressSearch(
					loc,
					function(result, status) {

						// 정상적으로 검색이 완료됐으면 
						if (status === kakao.maps.services.Status.OK) {

							var coords = new kakao.maps.LatLng(result[0].y,
									result[0].x);

							// 결과값으로 받은 위치를 마커로 표시합니다
							var marker = new kakao.maps.Marker({
								map : map,
								position : coords
							});

							// 인포윈도우로 장소에 대한 설명을 표시합니다
							var infowindow = new kakao.maps.InfoWindow(
									{
										content : '<div style="width:150px;text-align:center;padding:6px 0;">'
												+ strname + '</div>'
									});
							infowindow.open(map, marker);

							// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
							map.setCenter(coords);
						}
					});
</script>
<script>
	function strfunc(){
		$("#strInfo").show();
		$("#menuInfo").hide();
		$("#reviewInfo").hide();
	}
	function menufunc(){
		$("#strInfo").hide();
		$("#menuInfo").show();
		$("#reviewInfo").hide();
	}
	function reviewfunc(){
		$("#strInfo").hide();
		$("#menuInfo").hide();
		$("#reviewInfo").show();
	}
</script>
</html>