<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*" 
    import="dao.C_selectFare2"
    import="vo.FareAll" 
    import="dao.C_cancelPassenger"
    import="vo.Passenger"  
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
	<div class="container-fluid">
	<%@ include file="/header.jsp" %>
		<div class="row p-3 mt-5 border-0 bg-secondary bg-opacity-50">
			<h2>My page > 내 예약 > 취소 요청</h2><br>
		</div>
	</div>
		<div class="container">
		<div class="row justify-content-center">
			<form action="3008_cancel_flight_input_check.jsp" method="post">
			<div class="col-md-10 .offset-md-3">
				<p style="float:right;margin-top:10px;"><a href="#">취소 및 변경 규정</a></p><br>
				<h1 style="margin-top:30px;"><b>취소할 항공권 선택</b></h1>
				<div class="border border-2 p-2 mt-3 mb-3 bg-white">어떠한 추가 취소 수수료도 부과하지 않습니다. 부과되는 비용은 공급업체 수수료 및 비용을 따릅니다.</div><br>
				<c:forEach var="item" items="${fareData}">
					<div><h2><b>탑승객/구간</b></h2></div>
					<div class="form-check">
						<input style="zoom:2.0;margin-left:0px;margin-top:10px;" class="form-check-input" type="checkbox" name="cancelP" value="${fn:substring(fareData[0].korname,0,3)}" id="flexCheckChecked" onclick='getCheckedCnt()'>
						<label style="font-size:30px;margin-top:10px;"class="form-check-label" for="flexCheckChecked">
							<b>탑승객 ${fareData.korname}</b>
						</label>
					</div>
					<div style="margin-left:60px;margin-top:10px;">
							<h4>${fareData.departAirport} - ${fareData.arriveAirport}</h4>
					</div>
					<div style="margin-left:60px;margin-top:12px;">
						<p style="font-size:25px;"><b>출발날짜 및 시간</b></p>
						<p style="font-size:20px;">${fn:substring(fareData.departDate,0,4)}년 ${fn:substring(fareData.departDate,5,7)}월 ${fn:substring(fareData.departDate,8,10)}일 ${fn:substring(fareData.departDate,11,13)}시 ${fn:substring(fareData.departDate,14,16)}분</p>
						<p style="font-size:18px;">항공편: 출발 전, 항공권: 미사용</p>
					</div>
					<br>
				</c:forEach>
			<div class="w-100"></div>
			<div class="col-md-3 mt-4 offset-md-1"></div>
			<div class="w-100"></div>
			<div class="col-md-6 .offset-md-3">
				<div style="margin-top:10px;"><h2><b>2. 연락처</b></h2></div>
				<div style="margin-left:25px;">
					<p style="font-size:20px;"><b>휴대폰</b>&nbsp;${fn:substring(fareData[0].phoneNumber,0,3)}-${fn:substring(fareData[0].phoneNumber,3,7)}-${fn:substring(fareData[0].phoneNumber,7,11)}</p>
					<p style="font-size:20px;"><b>이메일</b>&nbsp;${fareData[0].email}</p>
  				</div>
			</div>
			<c:set var="bookingReference" value="${fareData[0].bookingReference}" scope="session" />
			<input type="submit" style="margin-top:30px;font-size:30px;width:100%;height:60px;background:steelblue;border:none;color:white;border-radius:12px;" class="btn me-md-2" value="요청하기">
		</form>
		</div>
	</div>
	<br><br>
<%@ include file="/0000_footer.html" %>
</body>
</html>