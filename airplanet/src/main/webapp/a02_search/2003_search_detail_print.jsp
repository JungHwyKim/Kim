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
				  			<div class="col-3"><img class="airlinelogo2" src="${f2.airlinelogo }" width="70%"></div>
				  			<div class="col-9">
				  				<div class="row">
				  					<div class="col-4 topleft dDate2">${f2.departDate }</div>
				  					<div class="col-4 topcenter fHour2">${f2.flightHours }</div>
				  					<div class="col-4 topright aDate2">도착시간</div>
				  				</div>
				  				<div class="row">
				  					<div class="col-4 botleft dCode2">${f2.departAirportcode }</div>
				  					<div class="col-4 botcenter">직항/경유</div>
				  					<div class="col-4 botright aCode2">${f2.arriveAirportcode }</div>
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

var flightOb1 = []
<c:forEach var="f" items="${dao1.getMinfeeC(sch1)}">
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
//var totprice = document.querySelectorAll(".totprice")
var i=0;
flightOb1.forEach(function(fa){
	dDate1[i].innerText= fa.departDate.toTimeString().split(' ')[0].slice(0,5)
	fHour1[i].innerText= parseInt(fa.flightHours)+"시간 "+(fa.flightHours%1)*60+"분" // 왜 첫번째만 출력될까,,
	airlinelogo1[i].src=fa.airlinelogo
	dCode1[i].innerText = fa.departAirportcode
	aCode1[i].innerText = fa.arrivetAirportcode
	//totprice[i].innerText = fa.standardFee + fa.classFee
	i++;
})

//  왕복시 리턴
var flightOb2 = []
<c:forEach var="f" items="${dao2.getMinfeeC(sch2)}">
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
	console.log(fa.flightnumber+" "+fa.departDate+" "+fa.departAirportcode+" "+fa.arrivetAirportcode+" "+fa.flightHours+" "+fa.departPacifictime
			+" "+fa.arrivePacifictime+" "+fa.airlinelogo+" "+fa.standardFee+" "+fa.classFee)
</c:forEach>

</script>
</html>