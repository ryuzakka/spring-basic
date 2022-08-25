<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<head>
	<style>
		section {
			width:1000px;
			height:700px;
			margin:auto;
			text-align:center;
		}
		section input[type=text] {
			width:300px;
			height:40px;
			border:1px solid #D941C5;
		}
		section div {
			margin-top:10px;
		}
		section #zip {
			width:140px;
			height:40px;
		}
		section #btn1 {
			width:154px;
			height:44px;
			border:1px solid #D941C5;
			background:#D941C5;
			color:white;
		}
		section #btn2 {
			width:306px;
			height:44px;
			border:1px solid #D941C5;
			background:#D941C5;
			color:white;
		}
	</style>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		function juso_search() {	// 우편번호 버튼 클릭시 호출 함수명
			new daum.Postcode({
				oncomplete: function(data) {
					if(data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
						addr = data.roadAddress;
					} else { // 사용자가 지번 주소를 선택했을 경우(J)
						addr = data.jibunAddress;
					}
					
					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					document.pkc.zip.value = data.zonecode; // 우편번호
					document.pkc.juso.value = addr;  // 주소
					// 커서를 상세주소 필드로 이동한다.
					document.pkc.juso_etc.focus();
				}
			}).open();
		}
	</script>
</head>

<body>
	<section>
		<form name="pkc" method="post" action="memberinput_ok">
			<h2> 회 원 가 입 </h2>
			<div> <input type="text" name="userid" placeholder="아이디"> </div>
			<div> <input type="text" name="name" placeholder="이 름"> </div>
			<div> <input type="text" name="pwd" placeholder="비밀번호"> </div>
			<div> <input type="text" name="pwd2" placeholder="비밀번호 확인"> </div>
			<div> <input type="text" name="zip" id="zip" readonly  placeholder="우편번호"> <input  id="btn1" type="button" onclick="juso_search()" value="주소검색"> </div>
			<div> <input type="text" name="juso" placeholder="주 소" readonly> </div>
			<div> <input type="text" name="juso_etc" placeholder="상세주소"> </div>
			<div> <input type="text" name="phone" placeholder="전화번호"> </div>
			<div> <input type="text" name="email" placeholder="이메일"> </div>
			<div> <input type="submit" value="회원가입하기" id="btn2"> </div>
		</form>
	</section>
</body>