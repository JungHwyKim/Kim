<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix ="c" uri ="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt"%> 
<fmt:requestEncoding value="utf-8"/>   
<% request.setCharacterEncoding("utf-8"); %>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
.list-group-item{
	margin:3px 3px;
	border-radius: 5px 5px 5px 5px;
	border-style: solid;
}
.list-content-bottom{
	color:#339980;
	text-align: left;
}
.list-content-price{
	color:steelblue;
	font-weight: bolder;
}
.btn{
	padding:0;
	border: none;
}
.btn:active, .btn:focus{
	border: none;
}

</style>
</head>


<body>
	
	
	
	<div class="container">
<jsp:include page="/header.jsp"></jsp:include>
	

	
	<p class="text-md-end">예상 최저 가격일 뿐입니다. 최근 8일 내에 검색한 결과입니다.</p>
	<div class="list-group">
	<%--dao.B_searchnation  getMinfeeN --%>
	<jsp:useBean id="daoN" class="dao.B_searchnation"/>
	<jsp:useBean id="schN" class="vo.FlightAll"/>
	<jsp:setProperty property="*" name="schN"/>
  	${schN.setDepartDate("2022-12-21") } ${schN.setDepartLocation("인천") }${schN.setArriveLocation("미국") }
  	<c:forEach var="byCity" items="${daoN.getMinfeeN(schN) }">
  	
	<button type="button" class="btn">
    <div class="list-group-item list-group-item-action">
    <div class="d-flex w-100 justify-content-between">
      <h5 class="mb-1">${byCity.arriveApcity }</h5>
      <medium class="list-content-price">${byCity.standardFee }부터 ></medium>
    </div>
    <p class="list-content-bottom">1회 이상 경유(직항이용가능)</p>
  </div></button>
  
  </c:forEach>
  

  </div>
	
</div>


<jsp:include page="footer.html"></jsp:include>

</body>

<script type="text/javascript">

</script>
</html>