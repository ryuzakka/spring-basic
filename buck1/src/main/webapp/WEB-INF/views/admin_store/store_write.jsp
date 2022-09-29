<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${userid != 'admin'}">
	<c:redirect url="../error/error404" />
</c:if>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<style>
	section {
		width:800px;
		height:auto;
		margin:80px auto 50px auto;
	}
	section h2 {
		text-align:center;
	}
	section table {
		border-spacing:0px;
		text-align:center;
		width:100%;
	}
	section table tr td {
		padding:10px 0px;
	}
	section table tr td input {
		padding:12px 0;
	}
	section table tr td input[type='text'] {
		border:none;
		border-bottom:1px solid #DDD;
		width:220px;
	}
	section table tr:nth-child(3) td input[type='text'] {
		width:91%;
		text-align:center;
	}
	section table tr td input[type='button'] {
		width:220px;
		border-radius:10px;
		border:0px;
		background:#f4f4f1;
		color:#222;
		padding:13px 0 13px 0;
		vertical-align:center;
	}
	section table tr td input[type='button']:hover {
		background:#006633;
		color:white;
	}
	section table tr td .filebtn input[type=file]::file-selector-button {
		width:70px;
		height:30px;
		margin:8px 5px 8px 3px;
		/* padding-top:8px; */
		background: #006633;
		color:white;
		border: 0px solid #006633;
		border-radius: 10px;
		cursor: pointer;
	}
	section input[type="submit"] {
		width:100%;
		border-radius:10px;
		border:0px;
		background:#f4f4f1;
		color:#222;
		font-size:14px;
		padding:15px 0 18px 0;
		margin:20px auto;
		text-align:center;
	}
	section input[type="submit"]:hover {
		background:#006633;
		color:white;
	}
	section #listBtn {
		text-align:center;
	}
	section #listBtn a {
		text-decoration:none;
		color:#555555;
		font-size:12px;
	}
</style>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=71ba7d59148fb1bf6a91e4fc5eada954&libraries=services"></script>
<script>
    function sample5_execDaumPostcode() {
    	var mapContainer = document.getElementById('map'), // 지도를 표시할 div
	        mapOption = {
	            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
	            level: 3 // 지도의 확대 레벨
	        };
	
	    //지도를 미리 생성
	    var map = new daum.maps.Map(mapContainer, mapOption);
	    //주소-좌표 변환 객체를 생성
	    var geocoder = new daum.maps.services.Geocoder();
		//마커
		var imageSrc = "${pageContext.request.contextPath}/resources/images/pin_map.png",	// 마커이미지 경로
			imageSize = new kakao.maps.Size(38,60),	// 마커이미지의 크기
			imageOption = {offset: new kakao.maps.Point(27,69)};	// 마커이미지의 옵션. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정
	    //마커를 미리 생성
	    var marker = new daum.maps.Marker({
	        position: new daum.maps.LatLng(37.537187, 127.005476),
	        map: map
	    });
    	
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = data.address; // 최종 주소 변수

                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById("addr1").value = addr;
                // 주소로 상세 정보를 검색
                geocoder.addressSearch(data.address, function(results, status) {
                    // 정상적으로 검색이 완료됐으면
                    if (status === daum.maps.services.Status.OK) {

                        var result = results[0]; //첫번째 결과의 값을 활용

                        // 해당 주소에 대한 좌표를 받아서
                        var coords = new daum.maps.LatLng(result.y, result.x);
                        document.getElementById('lat').value = result.y; 
                        document.getElementById('lng').value = result.x;
                        
						// 마커이미지 설정
                		var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
                			markerPosition = new kakao.maps.LatLng(result.y, result.x);
                		//마커를 생성
                	    var marker = new daum.maps.Marker({
                	        position: markerPosition,
                	        image: markerImage,
                	        map: map
                	    });
                        
                        // 지도를 보여준다.
                        mapContainer.style.display = "block";
                        map.relayout();
                        // 지도 중심을 변경한다.
                        map.setCenter(coords);
                        // 마커를 결과값으로 받은 위치로 옮긴다.
                        marker.setPosition(coords)
                    }
                });
            }
        }).open();
        
    }
</script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	$(function(){		
		$("#file").on('change',function(){
		  var fileName = $("#file").val();
		  $(".upload-name").val(fileName);
		});
	});
</script>

</head>
<body>
	
	<section>
		<h2>매장 등록하기</h2>
		
		<form name="storeInput" method="post" action="store_write_ok" enctype="multipart/form-data">
			<table align="center" border="0">
				<tr>
					<td><input type="text" name="storename" placeholder="매장이름" required></td>
					<td><input type="text" name="addr2" placeholder="동/면/읍" ></td>
					<td><div class="filebtn">
							<input type="file" name="storeimg">
					</div></td>
				</tr>
				<tr>
					<td><input type="button" onclick="sample5_execDaumPostcode()" value="주소 검색"></td>
					<td><input type="text" id="lat" name="lat" placeholder="(좌표:위도)" readonly></td>
					<td><input type="text" id="lng" name="lng" placeholder="(좌표:경도)" readonly></td>
				</tr>
				<tr>
					<td colspan="3"><input type="text" id="addr1" name="addr1" size="80" placeholder="(주소)" readonly></td>
				</tr>
				<tr><td colspan="3"><div id="map" style="width:100%;height:300px;margin-top:10px;display:none"></div></td></tr>
			</table>
			<input type="submit" value="등록하기"> <br>
			<div id="listBtn"><a href="store_list">목록</a></div>
		</form>
	</section>
	
</body>
</html>