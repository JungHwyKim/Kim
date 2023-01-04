<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*" 
    import="vo.FareAll" 
    import="dao.C_cancelPassenger" 
   %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%-- jsp에서 substring 기능을 사용하기 위한 태그 선언 --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>삭제 요청</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" >
<style type="text/css">
.btnSave{
	margin-top:100px;
	margin-left:170px;	
	width:50%;
	height:70px;
	background:steelblue;
	color:white;
	border:none;
	border-radius: 12px;
	font-size:25px;
}
</style>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");

String bookingReference = (String)session.getAttribute("bookingReference");
String str01 = session.getAttribute("price").toString();
float price = Float.parseFloat(str01);
int priceInt = Math.round(price);

String[] name = request.getParameterValues("chData");
C_cancelPassenger dao = new C_cancelPassenger();

for(String eachname:name){
	dao.deletePassenger(eachname);
}

dao.UpdatePrice(priceInt, bookingReference);
dao.UpdateFare(name.length , bookingReference);
%>

	<div class="container-fluid">
	<%@ include file="/header.jsp" %>
		<div class="row p-3 mt-5 border-0 bg-secondary bg-opacity-50">
			<h2>My page > 내 예약 > 취소 요청</h2>
		</div>
	</div>
	<div class="row">
	    <div class="col align-self-start"></div>
	    <div class="col align-self-center">
	    <br><br><br><br><br><br>
			<h2 style="font-size:28px;float:center"><b><%for(String s: name) out.print(s + " "); %></b> 님의 항공권이 정상적으로 취소되었습니다.</h2>
			<button type="submit" class="btnSave" onclick="window.open('3001_myPage_Main.jsp')">마이페이지로 돌아가기</button> 
		</div>
	    <div class="col align-self-end"></div>
	</div>
	<br><br><br><br><br><br>
<%@ include file="/0000_footer.html" %>
</body>
</html>