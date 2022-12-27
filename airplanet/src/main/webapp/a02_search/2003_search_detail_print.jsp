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
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link href="bs-custom.css" rel="stylesheet" >
<link href="2003.css" rel="stylesheet">
<style>
.row{
	margin-left: 16px;
	margin-right: 16px;
}

</style>
</head>
<body>

<%--  --%>
	<jsp:useBean id="dao1" class="dao.B_search_detail"/>
	<jsp:useBean id="sch1" class="vo.FlightAll"/>
	<jsp:setProperty property="*" name="sch1"/>
	${sch1.setDepartDate("2022-12-21") } ${sch1.setDepartLocation("ICN") } ${sch1.setArriveLocation("FUK") } ${sch1.setClassStr("ec") }
	<c:forEach var="f1" items="${dao1.getMinfeeC(sch1)}">
<%-- Return --%>	
	<jsp:useBean id="dao2" class="dao.B_search_detail"/>
	<jsp:useBean id="sch2" class="vo.FlightAll"/>
	<jsp:setProperty property="*" name="sch2"/>
	${sch2.setDepartDate("2022-12-30") } ${sch2.setDepartLocation("FUK") } ${sch2.setArriveLocation("ICN") } ${sch2.setClassStr("ec") }
	<c:forEach var="f2" items="${dao2.getMinfeeC(sch2)}">
	
		<div class="row">	
			<div class="card">
			  <div class="card-body schedule">
			    <div class="row">
				  	<div class="col-8">
				  		<div class="row">
				  			<div class="col-3"><img src="${f1.airlinelogo }" width="70%"></div>
				  			<div class="col-9">
				  				<div class="row">
				  					<div class="col-4 topleft">${f1.departDate }</div>
				  					<div class="col-4 topcenter">${f1.flightHours }</div>
				  					<div class="col-4 topright">도착시간</div>
				  				</div>
				  				<div class="row">
				  					<div class="col-4 botleft">${f1.departAirportcode }</div>
				  					<div class="col-4 botcenter">직항/경유</div>
				  					<div class="col-4 botright">${f1.arriveAirportcode }</div>
				  				</div>				  				
				  			</div>
				  		</div>
				  		<div class="row">
				  			<div class="col-3"><img src="${f2.airlinelogo }" width="70%"></div>
				  			<div class="col-9">
				  				<div class="row">
				  					<div class="col-4 topleft">${f2.departDate }</div>
				  					<div class="col-4 topcenter">${f2.flightHours }</div>
				  					<div class="col-4 topright">도착시간</div>
				  				</div>
				  				<div class="row">
				  					<div class="col-4 botleft">${f2.departAirportcode }</div>
				  					<div class="col-4 botcenter">직항/경유</div>
				  					<div class="col-4 botright">${f2.arriveAirportcode }</div>
				  				</div>						  			
				  			</div>
				  		</div>				  		
				     </div>
				     <div class="col-4 schedule-right">
						<p class="text-center topcenter">오늘 예약하기</p>
						<c:set var= "total" value="${f1.classfee + f1.standardFee + f2.classfee + f2.standardFee}"/> 
						<p class="text-center fw-semibold"><fmt:formatNumber value="${total}"/></p>
						<button type="button" class="btn btn-secondary"><span>선택</span><span class="material-symbols-outlined align-middle">arrow_forward</span></button>
				     </div>
			     </div>
			  </div>
			</div>	
		</div>
		</c:forEach></c:forEach>
</body>
<script type="text/javascript">

</script>
</html>