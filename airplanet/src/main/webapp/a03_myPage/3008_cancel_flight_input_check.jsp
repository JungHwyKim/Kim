<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*" 
    import="dao.C_selectFare"
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

</style>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");

String[] chData = request.getParameterValues("cancelP");
%>
	<div class="container-fluid">
	<%@ include file="/header.jsp" %>
		<div class="row p-3 mt-5 border-0 bg-secondary bg-opacity-50">
			<h2>My page > 내 예약 > 취소 요청</h2>
		</div>
	</div>
			<div class="col-1"></div>
			<div class="col-md-6 offset-md-3 ">
				<h2 style="margin:40px;"><b>취소 탑승자 이름: <%for(String s: chData) out.print(s + " "); %> 님</b></h2>
				<h2 style="margin:40px;"><b>예상 환불금액</b></h2>
				<hr>		
				<%
				if(chData.length==1) {
				%>
					<h3 style="margin:40px;text-align:right"><b><fmt:formatNumber pattern="0,000,000" 
						value="${fareData[0].totalPrice/2}"/>원</b></h3>
					<c:set var="price" value="${fareData[0].totalPrice/2}" scope="session" />
				<%
				}
				%>
				<%
				if(chData.length==2) {
				%>
					<h3 style="margin:40px;text-align:right"><b><fmt:formatNumber pattern="0,000,000" 
						value="${fareData[0].totalPrice}"/>원</b></h3>	
					<c:set var="price" value="${fareData[0].totalPrice}" scope="session" />
				<%
				}
				%>
				<form action="3008_cancel_flight_input_check2.jsp" method="post">
				<%
				for(int i=0;i<chData.length;i++){
					%>
				<input type="hidden" value="<%=chData[i] %>" name="chData">
					<%
				}
				%>
				<input type="hidden" value="bookingReference" name="bookingReference">
					<input type="submit" style="margin-top:30px;font-size:30px;float:right;width:95%;height:60px;background:steelblue;border:none;color:white;border-radius:12px;" class="btn me-md-2" value="요청하기">
				</form>
			</div>
			<br><br><br><br><br><br>
<%@ include file="/0000_footer.html" %>
</body>
<script>

</script>
</html>