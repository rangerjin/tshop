<%@page import="poly.dto.FoodUserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page import="java.util.ArrayList"%>
<%@page import="poly.dto.FoodStrDTO"%>
<%@page import="java.util.List"%>
<%@page import="poly.util.CmmUtil"%>
<%
	FoodUserDTO user = (FoodUserDTO)session.getAttribute("user");
	List<FoodStrDTO> strList = (List<FoodStrDTO>) request.getAttribute("strList");
	String msg = (String) request.getAttribute("msg");
%>
<%
	//게시판 조회 결과 보여주기
	if (strList == null) {
		strList = new ArrayList<FoodStrDTO>();

	}
%>
<!DOCTYPE html>
<html>
<head>
<!-- Theme Made By www.w3schools.com - No Copyright -->
<title>Food24 Main</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2726032665c2adf15fcbde4d8af3488c&libraries=services"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<script>
	<%if (msg != null && !msg.equals("")) {%>
			alert('<%=msg%>');
<%}%>
	
</script>
<script type="text/javascript">
	//상세보기 이동
	function doDetail(str_no) {
		location.href = "/main/strInfo.do?str_no=" + str_no;
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
<jsp:include page="/WEB-INF/view/main/mainHeader.jsp"></jsp:include>
<body>
	<div style="text-align: center">
		<h2>음식점 리스트</h2>
	</div>
	<hr />
	<br />
	<div class="page-wrapper col-sm-8" style="width: 75%;">
		<div class="container-fluid" style="width: 80%;">
			<%
				for (int i = 0; i < strList.size(); i++) {
					FoodStrDTO fDTO = strList.get(i);

					if (fDTO == null) {
						fDTO = new FoodStrDTO();
					}
			%>
			<div class="col-sm-6" style="content-align: center">
				<div class="box_img_wrap"
					style="background-image: url('/resources/img/<%=CmmUtil.nvl(fDTO.getStr_img())%>')">
				</div>

				<div style="text-align: center;">
					<p>
						<a style="font-size: 1.5em; font-weight: bold; text-decoration:none" href="/main/strInfo.do?str_no=<%=CmmUtil.nvl(fDTO.getStr_no())%>"><%=CmmUtil.nvl(fDTO.getStr_name())%></a>
					</p>
				</div>
			</div>

			<%
				}
			%>

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
	<!-- 이미지 지도를 표시할 div 입니다 -->
	<div class="col-sm-4" style="float: right; display: flex; width: 25%;">
		<div id="map"
			style="width: 450px; height: 450px; border: 2px solid red;"></div>
	</div>
	
	<div style="clear:both; align-items: center;">
		<jsp:include page="/WEB-INF/view/main/mainFooter.jsp"></jsp:include>
	</div>
	
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
var loc = '<%=user.getUser_loc()%>';
var strname = "내위치";

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
var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
mapOption = { 
    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
    level: 3 // 지도의 확대 레벨
};

// 지도를 생성합니다
var map = new daum.maps.Map(mapContainer, mapOption);

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new daum.maps.services.Geocoder();

var listData = [
	<%
	for (int i = 0; i < strList.size(); i++) {
		FoodStrDTO fDTO = strList.get(i);

		if (fDTO == null) {
			fDTO = new FoodStrDTO();
		}
	%>
		{
			title: '<div><a href="/main/strInfo.do?str_no=<%=CmmUtil.nvl(fDTO.getStr_no())%>"><%=CmmUtil.nvl(fDTO.getStr_name())%></a></div>',
			groupAddress: "<%=fDTO.getStr_loc() %>"
		},
	<%
	}
	%>
];

for (let i=0; i < listData.length ; i++) {
	// 주소로 좌표를 검색합니다
	geocoder.addressSearch(listData[i].groupAddress, function(result, status) {

	// 정상적으로 검색이 완료됐으면 
	 if (status === daum.maps.services.Status.OK) {
	
	    var coords = new daum.maps.LatLng(result[0].y, result[0].x);
	
	    // 결과값으로 받은 위치를 마커로 표시합니다
	    var marker = new daum.maps.Marker({
	        map: map,
	        position: coords
	    });
	
	    // 인포윈도우로 장소에 대한 설명을 표시합니다
	    var infowindow = new daum.maps.InfoWindow({
	        content: listData[i].title
	    });
	    
	    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
		// 이벤트 리스너로는 클로저를 만들어 등록합니다
		// for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
		daum.maps.event.addListener(marker, 'click', makeOverListener(map, marker, infowindow));
	
	} 
	});

};
//인포윈도우를 표시하는 클로저를 만드는 함수입니다 
function makeOverListener(map, marker, infowindow) {
    return function() {
        infowindow.open(map, marker);
    };
}


/* //마커에 클릭이벤트를 등록합니다
kakao.maps.event.addListener(marker, 'click', function() {
      // 마커 위에 인포윈도우를 표시합니다
      infowindow.open(map, marker);  
});
 */
</script>
</body>
</html>