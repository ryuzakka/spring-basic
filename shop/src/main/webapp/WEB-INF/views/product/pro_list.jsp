<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>pro_list</title>
<style>
	/* section {
		width:auto;
		height:auto;
		margin:80px auto 50px auto;
		text-align:center;
	}
	.list {
		width:900px;
		margin:auto;
		display:flex;
		flex-flow:row wrap;
		justify-content:left;
	}
	.list .prod {
		width:285px;
		height:300px;
		display:inline-block;
		padding:30px 0 30px 13px;
	} */
	h2 {
		text-align:center;
	}
	section {
     width:1000px;
     margin:auto;
	}
	section td {
	  width:270px;
	  height:300px;
	  padding:15px;
	  vertical-align:top;
	  border:1px solid #dddddd;
	}
	section td:hover {
	  border:1px solid #D941C5;
	}
	section td div {
	  margin-top:5px;
	}
	section #img {
	
	}
	section #baeprice {
	  font-size:12px;
	}
	section #title {
	  font-size:15px;
	}
	section #price {
	  font-size:17px;
	  color:red;
	}
	section #price s { /* 할인전 금액 */
	  color:grey;
	}
	section #baeday {
	  font-size:12px;
	}
</style>
</head>
<body>
	
	<h2>상품 리스트</h2>
	
	<section> <!-- 상품을 30개 출력 -->
   <c:set var="i" value="0"/>
   <table align="center" cellspacing="15">
    <tr>
    <c:forEach items="${list}" var="pvo">
       <td> <!-- 그림, 배송비, 상품명, 가격(할인이 있는경우는 할인가격표시) , 배송일--> 
         <div id="img"> <img src="../resources/img/${pvo.pimg}" width="270" height="270"> </div> <!-- 그림 -->
         <div id="baeprice">
          <c:if test="${pvo.baesong == 0}">
                      무료배송
          </c:if> 
          <c:if test="${pvo.baesong != 0}">
            <fmt:formatNumber value="${pvo.baesong}"/>원
          </c:if>
         </div> <!-- 배송비 -->
         <div id="title"> ${pvo.title} </div> <!-- 상품명 -->
         <div id="price">
          <c:if test="${pvo.halin != 0}"> <!-- 할인율이 0이 아닌경우 -->
           ${pvo.halin}% <s> <fmt:formatNumber value="${pvo.price}"/>원 </s> <br>
           <fmt:formatNumber value="${ pvo.price - ( pvo.price*(pvo.halin/100) )  }" pattern=",000"/>원
          </c:if>
          <c:if test="${pvo.halin == 0}"> <!-- 할인율이 0인 경우 -->
           <fmt:formatNumber value="${pvo.price}"/>원
          </c:if>
         </div> <!-- 가격 -->
         <c:choose>
          <c:when test="${pvo.yoil == 1}">
            <c:set var="yo" value="일요일"/>
          </c:when>
          <c:when test="${pvo.yoil == 2}">
            <c:set var="yo" value="월요일"/>
          </c:when>
          <c:when test="${pvo.yoil == 3}">
            <c:set var="yo" value="화요일"/>
          </c:when>
          <c:when test="${pvo.yoil == 4}">
            <c:set var="yo" value="수요일"/>
          </c:when>
          <c:when test="${pvo.yoil == 5}">
            <c:set var="yo" value="목요일"/>
          </c:when>
          <c:when test="${pvo.yoil == 6}">
            <c:set var="yo" value="금요일"/>
          </c:when>
          <c:when test="${pvo.yoil == 7}">
            <c:set var="yo" value="토요일"/>
          </c:when>
         </c:choose>
         <div id="baeday"> ${yo} : ${pvo.baeday2} 도착예정 </div> <!-- 배송일 -->
       </td>
     <c:set var="i" value="${i+1}"/>
     <c:if test="${i%3 == 0}"> 
     </tr>       
     <tr> 
     </c:if>
    </c:forEach>
     </tr>
   </table>
  </section>
	
	
	<%-- <table width="1800" border="1" align="center">
		<tr>
			<td>상품코드</td>
			<td>상품이미지</td>
			<td>상품명</td>
			<td>가격</td>
			<td>제조사</td>
			<td>할인율</td>
			<td>적립</td>
			<td>수량</td>
			<td>배송비</td>
			<td>배송소요일</td>
			<td>작성일</td>
		</tr>
		<c:forEach items="${list}" var="product">
			<tr>
				<td>${product.pcode}</td>
				<td><img src="${pageContext.request.contextPath}/resources/img/${product.pimg }" width="500"></td>
				<td>${product.title }</td>
				<td>${product.price }</td>
				<td>${product.made }</td>
				<td>${product.halin }</td>
				<td>${product.juk }</td>
				<td>${product.su }</td>
				<td>${product.baesong }</td>
				<td>${product.baeday }</td>
				<td>${product.writeday }</td>
			</tr>
		</c:forEach>
	</table> --%>
	
	
</body>
</html>