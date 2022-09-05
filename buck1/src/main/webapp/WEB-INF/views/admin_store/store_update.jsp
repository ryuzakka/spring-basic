<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:if test="${userid != 'admin'}">
	<c:redirect url="/member/signin" />
</c:if>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=71ba7d59148fb1bf6a91e4fc5eada954&libraries=services"></script>
<script>
	window.onload = function() {
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div
	        mapOption = {
	            center: new daum.maps.LatLng(${content.lat}, ${content.lng}), // 지도의 중심좌표
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
	    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);
	    var marker = new daum.maps.Marker({
	    	image: markerImage,
	        position: new daum.maps.LatLng(${content.lat}, ${content.lng}),
	        map: map
	    });
	    
		// 지도를 보여준다.
        //mapContainer.style.display = "block";
        map.relayout();
        // 지도 중심을 변경한다.
        map.setCenter(coords);
        // 마커를 결과값으로 받은 위치로 옮긴다.
        marker.setPosition(coords)
        
        /*  */
        
        //document.getElementById('state').selectedIndex.checked = ${content.state};
	}
	$(function(){
        var state = '${content.state}';
	
	     // value값으로 설정
	     $("#state").val(state).prop("selected", true);		
	});
	
    function sample5_execDaumPostcode() {
    	var mapContainer = document.getElementById('map'), // 지도를 표시할 div
	        mapOption = {
	            center: new daum.maps.LatLng(${content.lat}, ${content.lng}), // 지도의 중심좌표
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
	    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);
	    var marker = new daum.maps.Marker({
	    	image: markerImage,
	        position: new daum.maps.LatLng(${content.lat}, ${content.lng}),
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
                		
               			var markerPosition = new kakao.maps.LatLng(result.y, result.x);
                		//마커를 생성
                	    var marker = new daum.maps.Marker({
                	        position: markerPosition,
                	        image: markerImage,
                	        map: map
                	    });
                        
                        // 지도를 보여준다.
                        //mapContainer.style.display = "block";
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

	function storeimgDel(id, img) {
		var xhr = new XMLHttpRequest();
		xhr.open("get", "store_imgdel?id="+id+"&img="+img);
		xhr.send();
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4) {
				console.log('img delete ok');
				window.location.reload();
			}
		}
	}
</script>
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
	section table tr td img {
		display:block;
		width:40%;
		margin:auto;
	}
	section table tr td label {
		color:#555555;
		font-size:11px;
	}
	section table tr td span {
		color:#555555;
		font-size:12px;
	}
	section table tr td input {
		padding:12px 0;
	}
	section table tr td input[type='text'] {
		border:none;
		border-bottom:1px solid #DDD;
		width:150px;
		margin:0 15px;
	}
	section table tr:nth-child(3) td input[type='text'] {
		width:75%;
		text-align:center;
	}
	section table tr td input[type='button'] {
		width:124px;
		border-radius:10px;
		border:0px;
		background:#f4f4f1;
		color:#222;
		padding:13px 10px;
		margin:0 10px;
		vertical-align:center;
	}
	section table tr td input[type='button']:hover {
		background:#006633;
		color:white;
	}
	section table tr td .filebtn {
		display:inline-block;
		width:205px;
	}
	section table tr td .filebtn input[type=file]::file-selector-button {
		width:70px;
		height:30px;
		margin:8px 5px 8px 3px;
		/* padding-top:8px; */
		font-size:11px;
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
</head>
<body>
	
<section>
	<h2>매장 정보수정</h2>
	<form name="storeUpdate" method="post" action="store_update_ok" enctype="multipart/form-data">
		<input type="hidden" name="id" value="${content.id}">
		<table align="center" border="0">
			<tr>
				<td colspan="3">
					<c:if test="${content.storeimg != null}">
						<!-- <div class="filebtn"> -->
							<img src="${pageContext.request.contextPath}/resources/storeimg/${content.storeimg}"><br>
							<input type="hidden" name="fname" value="${content.storeimg}">
						<!-- </div> -->
					</c:if>
				</td>
			</tr>
			<tr>
				<td>
					<span>매장이름</span>
					<input type="text" name="storename" value="${content.storename}" placeholder="매장이름" required>
				</td>
				<td>
					<span>지역이름</span>
					<input type="text" name="addr2" value="${content.addr2}" placeholder="동/면/읍" >
				</td>
				<td>
					<div class="filebtn">
						<c:if test="${content.storeimg == null}">
							<input type="file" id="files" name="storeimg">
							<!-- <label for="files">이미지 추가</label> -->
						</c:if>
						<c:if test="${content.storeimg != null}"><input type="button" onclick="storeimgDel(${content.id},'${content.storeimg}')" value="이미지 삭제"></c:if>
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<span>주소</span>
					<input type="text" id="addr1" name="addr1" value="${content.addr1}" size="80" readonly>
				</td>
				<td>
					<input type="button" onclick="sample5_execDaumPostcode()" value="주소 검색"><br>
 					<input type="hidden" id="lat" name="lat" value="${content.lat}" placeholder="(좌표:위도)" readonly>
					<input type="hidden" id="lng" name="lng" value="${content.lng}" placeholder="(좌표:경도)" readonly>
				</td>
			</tr>
			<tr>
				<td colspan="3"><div id="map" style="width:100%;height:300px;margin-top:10px;"></div></td>
			</tr>
			
			<!--  -->
			<!--  
			<tr>
				<td></td>
				<td></td>
				<td rowspan="2"></td>
			</tr>
			<tr>
				<td>
					
				</td>
				<td>
					<div style="font-size:14px;">
						<span>현재 상태 :</span> 
						<c:if test="${content.state == 0}">등록중</c:if>
						<c:if test="${content.state == 1}">오픈대기중</c:if>
						<c:if test="${content.state == 2}">운영중</c:if>
						<c:if test="${content.state == 4}">임시 휴점</c:if>
						<c:if test="${content.state == 7}">리뉴얼 준비중</c:if>
						<c:if test="${content.state == 8}">보수공사중</c:if>
						<c:if test="${content.state == 9}">폐점</c:if>
					</div>
					<p>
					<select id="state" name="state">
						<option value="0">- 상태변경 -</option>
						<option value="0">등록중</option>
						<option value="1">오픈대기중</option>
						<option value="2">운영중</option>
						<option value="4">임시 휴점</option>
						<option value="7">리뉴얼 준비중</option>
						<option value="8">보수공사중</option>
						<option value="9">폐점</option>
						<option value="-1" style="color:salmon;">목록에서 삭제</option>
					</select>
				</td>
			</tr>
			<tr>
				<td colspan="4"></td>
			</tr>
			<tr></tr>
			-->
		</table>
		<input type="submit" value="수정하기"> <br>
		<div id="listBtn"><a href="store_list">돌아가기</a></div>
	</form>
</section>
	
</body>
</html>