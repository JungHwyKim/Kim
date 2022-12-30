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
	margin-left: 0px;
	margin-right: 16px;
}

</style>
</head>
<body>

<%
String city = (String) session.getAttribute("city");
%>
<%--dao.B_search_range getRangeticket      --%>
	<jsp:useBean id="dao1" class="dao.B_search_range"/>
	<jsp:useBean id="sch1" class="vo.FlightAll"/>
	<jsp:setProperty property="*" name="sch1"/>
	${sch1.setDepartDate("2022-12-21") } ${sch1.setDepartLocation("ICN") } ${sch1.setArriveLocation(city) } ${sch1.setClassStr("ec") }
	${sch1.setFrRange(param.inputLeft) }
	${sch1.setToRange(param.inputRight) }
		
	<c:forEach var="f1" items="${dao1.getRangeticket(sch1)}">

		<div class="row">	
			<div class="card">
			  <div class="card-body schedule">
			    <div class="row">
				  	<div class="col-8">
				  		<div class="row">
				  			<div class="col-3"><img class="airlinelogo1" src="" width="70%"></div>
				  			<div class="col-9">
				  				<div class="row">
				  					<div class="col-4 topleft dDate1"></div>
				  					<div class="col-4 topcenter fHour1"></div>
				  					<div class="col-4 topright aDate1">도착시간</div>
				  				</div>
				  				<div class="row">
				  					<div class="col-4 botleft dCode1"></div>
				  					<div class="col-4 botcenter">직항/경유</div>
				  					<div class="col-4 botright aCode1"></div>
				  				</div>				  				
				  			</div>
				  		</div>
				  		<div class="row">
				  			<div class="col-3"><img class="airlinelogo2" src="" width="70%"></div>
				  			<div class="col-9">
				  				<div class="row">
				  					<div class="col-4 topleft dDate2"></div>
				  					<div class="col-4 topcenter fHour2"></div>
				  					<div class="col-4 topright aDate2">도착시간</div>
				  				</div>
				  				<div class="row">
				  					<div class="col-4 botleft dCode2"></div>
				  					<div class="col-4 botcenter">직항/경유</div>
				  					<div class="col-4 botright aCode2"></div>
				  				</div>						  			
				  			</div>
				  		</div>				  		
				     </div>
				     <div class="col-4 schedule-right">
						<p class="text-center topcenter">오늘 예약하기</p>
						<p class="text-center fw-semibold totprice"></p>
						<button type="button" class="btn btn-secondary"><span>선택</span><span class="material-symbols-outlined align-middle">arrow_forward</span></button>
				     </div>
			     </div>
			  </div>
			</div>	
		</div>
		</c:forEach>
</body>
<script type="text/javascript" id="inscript">

var flightOb1 = []
<c:forEach var="f" items="${dao1.getRangeticket(sch1)}">
	var fa={}
	fa.flightnumber = "${f.flightNumber}"
	fa.departDate = new Date("${f.departDate}}".substring(0,19))
	fa.departAirportcode = "${f.departAirportcode}"
	fa.arrivetAirportcode = "${f.arriveAirportcode}"
	fa.flightHours = Number.parseFloat("${f.flightHours}")
	fa.departPacifictime = Number.parseInt("${f.departPacifictime}")
	fa.arrivePacifictime = Number.parseInt("${f.arrivePacifictime}")
	fa.airlinelogo = "${f.airlinelogo}"
	fa.standardFee = Number.parseInt("${f.standardFee}")
	fa.classFee = Number.parseInt("${f.classfee}")
	flightOb1.push(fa)
	//console.log(fa.flightnumber+" "+fa.departDate+" "+fa.departAirportcode+" "+fa.arrivetAirportcode+" "+fa.flightHours+" "+fa.departPacifictime
		//	+" "+fa.arrivePacifictime+" "+fa.airlinelogo+" "+fa.standardFee+" "+fa.classFee)
</c:forEach>

// 태평양 표준시로 바꿔서 계산하기..
var dDate1 = document.querySelectorAll(".dDate1")
var fHour1 = document.querySelectorAll(".fHour1")
var airlinelogo1 = document.querySelectorAll(".airlinelogo1")
var dCode1 = document.querySelectorAll(".dCode1")
var aCode1 = document.querySelectorAll(".aCode1")

var dDate2 = document.querySelectorAll(".dDate2")
var fHour2 = document.querySelectorAll(".fHour2")
var airlinelogo2 = document.querySelectorAll(".airlinelogo2")
var dCode2 = document.querySelectorAll(".dCode2")
var aCode2 = document.querySelectorAll(".aCode2") 
var totprice = document.querySelectorAll(".totprice")

var returnJson = []
flightOb1.forEach(function(fa1){
		var rt={}
		rt.dDate1 = fa1.departDate.toLocaleString()
		rt.fHour1 = fa1.flightHours
		rt.airlinelogo1 = fa1.airlinelogo
		rt.dCode1 = fa1.departAirportcode
		rt.aCode1 = fa1.arrivetAirportcode
		rt.dpTime1 = fa1.departPacifictime
		rt.apTime1 = fa1.arrivePacifictime
		// 도착 시간 어떻게 할것인지..
		//rt.aDate1 = fa1.departDate
		//rt.aDate1.setMinutes(rt.aDate1.getMinutes()+(fa1.departPacifictime-fa1.arrivePacifictime+fa1.flightHours)*60)
		
		//console.log(rt.dDate1)
		//console.log(rt.aDate1)
		rt.totprice = fa1.standardFee + fa1.classFee
		i++;
		returnJson.push(rt)
	})


// 최저가 순으로 일단 정렬
returnJson.sort(function(left,right){
	return left.totprice- right.totprice;
})

// 화면에 출력	
var i=0;
returnJson.forEach(function(rt){
	dDate1[i].innerText= rt.dDate1
	fHour1[i].innerText= parseInt(rt.fHour1)+"시간 "+(rt.fHour1%1)*60+"분"
	airlinelogo1[i].src= rt.airlinelogo1
	dCode1[i].innerText = rt.dCode1
	aCode1[i].innerText = rt.aCode1
	totprice[i].innerText = rt.totprice
	i++;
})

</script>
</html>