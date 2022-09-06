<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<style>
	section {
		width:auto;
		height:auto;
		margin:80px auto 50px auto;
		text-align:center;
	}
	section #searchArea {
		width:600px;
		/* margin:60px auto; */
		margin:160px auto;
		padding-left:133px;
	}
	section #searchArea input[type='search'] {
		padding:12px 0;
		border:none;
		border-bottom:1px solid #DDD;
		border-radius:3px;
		width:70%;
		text-align:center;
	}
	section #searchArea input[type='submit'] {
		width:20%;
		border-radius:10px;
		border:0px;
		background:#006633;
		color:white;
		padding:13px 0 13px 0;
		vertical-align:center;
	}
	#map div .infoWindow {
		/* width:150px; */
		width:200px;
		height:30px;
		background:#8C8279;
		color:white;
		padding:8px 15px;
		font-size:14px;
	}
	.customoverlay {
		position:relative;
		bottom:85px;
		border-radius:6px;
		border: 1px solid #ccc;
		border-bottom:2px solid #ddd;
		/* float:left; */
		float:center;
	}
	.customoverlay:nth-of-type(n) {
		border:0;
		box-shadow:0px 1px 2px #888;
	}
	.customoverlay a {
		display:block;
		text-decoration:none;
		color:#000;
		text-align:center;
		border-radius:6px;
		font-size:14px;
		font-weight:bold;
		overflow:hidden;
		background: #d95050;
		background: #d95050 url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat right 14px center;
	}
	.customoverlay .title {
		display:block;
		text-align:center;
		background:#fff;
		/* margin-right:35px; */
		padding:10px 15px;
		font-size:12px;
		font-weight:bold;
	}
	.customoverlay:after {
		content:'';
		position:absolute;
		/* margin-left:-12px; */
		margin-left:-20px;
		/* left:50%; */
		left:20%;
		bottom:-12px;
		width:22px;
		height:12px;
		background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png');
	}
</style>

<!-- <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> -->

</head>
<body>
		
<section>
	<h1> 지도 검색 </h1>
	
	<div id="searchArea">
		<input type="search" id="keyword" placeholder="키워드 검색 (매장명 또는 지역명)">
		<input type="submit" onclick="keySearch()" value="검색">
	</div>
	
	<div id="noResult" style="width:100%;height:300px;margin-top:60px;margin-bottom:60px;display:none;">
		<span style="display:inline-block;padding-top:120px;">검색 결과가 없습니다.</span>
	</div>
	
	<div id="map" style="width:100%;height:600px;margin-top:30px;display:none;"></div>
	
</section>

<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=71ba7d59148fb1bf6a91e4fc5eada954&libraries=services"></script>
<script>
	  
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
		
		document.getElementById('searchArea').style.margin = "40px auto 25px auto";
		
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
				//var xhrResponse = decodeURI(xhr.response);
				var xhrResponse = decodeURI(xhr.responseText);
		        
		        if(xhrResponse == '') {
		        	// 검색결과가 없을 경우
		        	document.getElementById('noResult').style.display = "block";
		        	document.getElementById('map').style.display = "none";
		        }
		        else {
		        	// 검색결과가 있을 경우
		        	document.getElementById('noResult').style.display = "none";
		        	document.getElementById('map').style.display = "block";
		        	
		        	var listObj = xhrResponse.split(',');
			        //console.log(listObj);
		        	var names = new Array();
			        var lats = new Array();
			        var lngs = new Array();
			        var addr = new Array();
			        var dataArr = new Array();
			        
			        for(var i in listObj) {
			        	if(listObj[i] != "") {		        		
					        var storeObj = listObj[i].split('-');			        	
					        names[i] = storeObj[0];
					        addr[i] = storeObj[1].replaceAll('+', ' ');
					        //console.log(storeObj[1].replaceAll('+', ' '));
					        lats[i] = storeObj[2];
					        lngs[i] = storeObj[3];
							console.log(names[i], addr[i], lats[i], lngs[i]);
							
					        var data = new Object();
					        data.content = '<div class="infoWindow">';
					        data.content += names[i]+' 지점<br>';
					        data.content += '<span style="font-size:10px">'+addr[i]+'</span>';
					        data.content += '</div>';;
							//data.latlng = "new kakao.maps.LatLng("+lats[i]+","+lngs[i]+")";
							data.lat = lats[i];
							data.lng = lngs[i];
							dataArr.push(data);
			        	}
			        }
			        var jsonStr = JSON.stringify(dataArr);
			        mapOpen(jsonStr);
		        }
			}
		}
	}
	
	function mapOpen(jsonStr) {
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			mapOption = { 
			    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			    level: 3 // 지도의 확대 레벨
			};
		
		//지도를 미리 생성
		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		
		// 마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
		var positions = JSON.parse(jsonStr);
		
		var imageSrc = "${pageContext.request.contextPath}/resources/images/pin_map.png",	// 마커이미지 경로
			imageSize = new kakao.maps.Size(38,60),	// 마커이미지의 크기
			imageOption = {offset: new kakao.maps.Point(27,69)};	// 마커이미지의 옵션. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정
	    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);
		
		var bounds = new kakao.maps.LatLngBounds();
		
		for (var i=0; i<positions.length; i++) {
			var latF = parseFloat(positions[i].lat);
			var lngF = parseFloat(positions[i].lng);
			var latlong = new kakao.maps.LatLng(latF,lngF);
			
			// 마커를 생성합니다
			var marker = new kakao.maps.Marker({
		        map: map, // 마커를 표시할 지도
		        image: markerImage,
		        position: latlong
		    });
			
		    // 마커에 표시할 인포윈도우를 생성합니다 
		    var infowindow = new kakao.maps.InfoWindow({
		        content: positions[i].content // 인포윈도우에 표시할 내용
		    });

			marker.setMap(map);
			bounds.extend(latlong);
			map.setBounds(bounds);
			
		    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
		    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
		    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
		    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
		    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
		}
		
	}
	
</script>



</body>
</html>