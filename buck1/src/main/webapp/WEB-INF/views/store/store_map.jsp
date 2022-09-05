<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<style>
	h1 {
	
	}
	section {}
	section .infoWindow {
		width:290px;
		height:60px;
		background:#8C8279;
		color:white;
		padding:5px 8px;
	}
	.customoverlay {position:relative;bottom:85px;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;float:left;}
	.customoverlay:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}
	.customoverlay a {display:block;text-decoration:none;color:#000;text-align:center;border-radius:6px;font-size:14px;font-weight:bold;overflow:hidden;background: #d95050;background: #d95050 url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat right 14px center;}
	.customoverlay .title {display:block;text-align:center;background:#fff;margin-right:35px;padding:10px 15px;font-size:14px;font-weight:bold;}
	.customoverlay:after {content:'';position:absolute;margin-left:-12px;left:50%;bottom:-12px;width:22px;height:12px;background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
</style>

<!-- <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> -->
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=71ba7d59148fb1bf6a91e4fc5eada954&libraries=services"></script>
<script>
	window.onload = function() {
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			mapOption = { 
			    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			    level: 3 // 지도의 확대 레벨
			};
		
		//지도를 미리 생성
		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		
		// 마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
		var positions = [
		    {
		        content: '<div class="infoWindow">카카오</div>',
		        latlng: new kakao.maps.LatLng(33.450705, 126.570677)
		    },
		    {
		        content: '<div class="infoWindow">생태연못</div>', 
		        latlng: new kakao.maps.LatLng(33.450936, 126.569477)
		    },
		    {
		        content: '<div class="infoWindow">텃밭</div>', 
		        latlng: new kakao.maps.LatLng(33.450879, 126.569940)
		    },
		    {
		        content: '<div class="infoWindow">근린공원</div>',
		        latlng: new kakao.maps.LatLng(33.451393, 126.570738)
		    }
		];
		
		var imageSrc = "${pageContext.request.contextPath}/resources/images/pin_map.png",	// 마커이미지 경로
			imageSize = new kakao.maps.Size(38,60),	// 마커이미지의 크기
			imageOption = {offset: new kakao.maps.Point(27,69)};	// 마커이미지의 옵션. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정
	    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);
		
		for (var i = 0; i < positions.length; i ++) {
			
			// 마커를 생성합니다
		    var marker = new kakao.maps.Marker({
		        map: map, // 마커를 표시할 지도
		        image: markerImage,
		        position: positions[i].latlng // 마커의 위치
		    });

		    // 마커에 표시할 인포윈도우를 생성합니다 
		    var infowindow = new kakao.maps.InfoWindow({
		        content: positions[i].content // 인포윈도우에 표시할 내용
		    });

		    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
		    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
		    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
		    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
		    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
		}
		
		//주소-좌표 변환 객체를 생성
	    //var geocoder = new daum.maps.services.Geocoder();
	    // 해당 주소에 대한 좌표를 받아서
        //var coords = new daum.maps.LatLng(33.450701, 126.570667);
		
	    /*
	    //마커
		var imageSrc = "${pageContext.request.contextPath}/resources/images/pin_map.png",	// 마커이미지 경로
			imageSize = new kakao.maps.Size(38,60),	// 마커이미지의 크기
			imageOption = {offset: new kakao.maps.Point(27,69)};	// 마커이미지의 옵션. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정
	    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);
	    
		//마커를 미리 생성
	    var marker = new kakao.maps.Marker({
	        position: new kakao.maps.LatLng(33.450701, 126.570667),
	        image: markerImage,
	        map: map
	    });
		*/
		
	    /*
		// 지도를 보여준다.
        map.relayout();
        // 지도 중심을 변경한다.
        map.setCenter(coords);
        // 마커를 결과값으로 받은 위치로 옮긴다.
        marker.setPosition(coords)
        */
        
		//marker.setMap(map);
    	
        /*
		// 인포윈도우
		var iwContent = '<div class="infoWindow">Hello World!</div>'; // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
		
		//인포윈도우를 생성하고 지도에 표시합니다
		var infowindow = new kakao.maps.InfoWindow({
			content : iwContent
		});
		
		// 마커에 마우스오버 이벤트를 등록합니다
		kakao.maps.event.addListener(marker, 'mouseover', function() {
		  // 마커에 마우스오버 이벤트가 발생하면 인포윈도우를 마커위에 표시합니다
		    infowindow.open(map, marker);
		});

		// 마커에 마우스아웃 이벤트를 등록합니다
		kakao.maps.event.addListener(marker, 'mouseout', function() {
		    // 마커에 마우스아웃 이벤트가 발생하면 인포윈도우를 제거합니다
		    infowindow.close();
		});
		*/
		
	}
	    
	// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
	function makeOverListener(map, marker, infowindow) {
	    return function() {
	        infowindow.open(map, marker);
	    };
	}

	// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
	function makeOutListener(infowindow) {
	    return function() {
	        infowindow.close();
	    };
	}
	
	function keySearch() {
		var key = document.getElementById('keyword').value;
		
		var xhr = new XMLHttpRequest();
		xhr.open("get", "keyword_search?keyword="+key);
		xhr.setRequestHeader('Content-Type','charset=UTF-8');
		xhr.setRequestHeader("accept-language", "ko-KR,ko;q=0.9,en-US;q=0.8,en;q=0.7");
		//xhr.responseType='json';
		/* xhr.onload = () => {
			console.log(xhr.response);
			console.log(xhr.responseText);
			var data = JSON.parse(xhr.response);
			for(var i=0; i<data.length; i++) {
				console.log(data[i]);
				//console.log(data[i].lat);
				//console.log(data[i].lng);
			}
		}; */
		
		xhr.send();
		xhr.onreadystatechange = function() {
			if(xhr.readyState == 4) {
				var xhrResponse = decodeURI(xhr.response);
		        
		        var names = new Array();
		        var lats = new Array();
		        var lngs = new Array();
		        
		        var listObj = xhrResponse.split(',');
		        for(var i in listObj) {
		        	if(listObj[i] != "") {		        		
				        var storeObj = listObj[i].split('-');			        	
				        names[i] = storeObj[0];
				        lats[i] = storeObj[1];
				        lngs[i] = storeObj[2];
				        var posi = [names[i],lats[i],lngs[i]];
		        	}
		        }
		        
		        /* console.log(names);
		        console.log(lats);
		        console.log(lngs);
		        console.log(posi); */
		        
		        /* var positions = [{content:names},{lat:lats},{lng:lngs}];
		        console.log(JSON.stringify(positions));
		        console.log(JSON.parse(positions)); */
		        
		        var pp = [
			        	{
			        		content : '<div class="infoWindow">'+names[0]+'</div>',
			        		latlng : new kakao.maps.LatLng(lats[0],lngs[0])
			        	}
		        	];
		        console.log(pp);
		        mapOpen(pp);
				    
			    /* 
				//var p1 = JSON.parse(names[0],lats[0],lngs[0]);
				//console.log(p1);
				var jsonA = JSON.stringify(names);
				console.log(jsonA);
				var jsonB = JSON.parse(names);
				console.log(jsonB); */
				
			}
		}
	}
	
	function mapOpen(position) {
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			mapOption = { 
			    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			    level: 3 // 지도의 확대 레벨
			};
		
		//지도를 미리 생성
		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		map.relayout();
		
		// 마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
		var positions = position;
		
		var imageSrc = "${pageContext.request.contextPath}/resources/images/pin_map.png",	// 마커이미지 경로
			imageSize = new kakao.maps.Size(38,60),	// 마커이미지의 크기
			imageOption = {offset: new kakao.maps.Point(27,69)};	// 마커이미지의 옵션. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정
	    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);
		
		for (var i = 0; i < positions.length; i ++) {
			
			// 마커를 생성합니다
		    var marker = new kakao.maps.Marker({
		        map: map, // 마커를 표시할 지도
		        image: markerImage,
		        position: positions[i].latlng // 마커의 위치
		    });

		    // 마커에 표시할 인포윈도우를 생성합니다 
		    var infowindow = new kakao.maps.InfoWindow({
		        content: positions[i].content // 인포윈도우에 표시할 내용
		    });

		    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
		    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
		    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
		    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
		    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
		}
		
		
	}
	
</script>


</head>
<body>
	
	<h1> 매장 찾기 </h1>
	
<section>
	
	<div>
		<input type="search" id="keyword" placeholder="키워드 검색">
		<input type="button" onclick="keySearch()" value="검색">
	</div>
	
	<div id="map" style="width:100%;height:300px;margin-top:60px;">
		
	</div>
	
	<div id="searchResult" >
		<%-- <c:if test="${position != null}"> --%>
		<table width="300" border="1">
			<c:forEach items="${position}" var="store">		
				<tr>
					<td>${store.storename}</td>
					<td>${store.lat}</td>
					<td>${store.lng}</td>
				</tr>
			</c:forEach>
		</table>
		<%-- </c:if> --%>
	</div>
</section>


</body>
</html>