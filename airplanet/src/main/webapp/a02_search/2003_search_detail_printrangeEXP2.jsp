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
<%--dao.B_search_range getRangeticket  --%>
	<jsp:useBean id="dao1" class="dao.B_search_range"/>
	<jsp:useBean id="sch1" class="vo.FlightAll"/>
	<jsp:setProperty property="*" name="sch1"/>
	${sch1.setDepartDate("2022-12-21") } ${sch1.setDepartLocation("ICN") } ${sch1.setArriveLocation(city) } ${sch1.setClassStr("ec") }
	<%-- <c:if test="${empty param.inputLeft }"></c:if><c:if test="${empty param.inputRight }"></c:if> --%>
	${sch1.setFrRange(param.inputLeft) }
	${sch1.setToRange(param.inputRight) }
		
	<c:forEach var="f1" items="${dao1.getRangeticket(sch1)}">

<%-- Return --%>	
	<jsp:useBean id="dao2" class="dao.B_search_range"/>
	<jsp:useBean id="sch2" class="vo.FlightAll"/>
	<jsp:setProperty property="*" name="sch2"/>
	${sch2.setDepartDate("2022-12-30") } ${sch2.setDepartLocation(city) } ${sch2.setArriveLocation("ICN") } ${sch2.setClassStr("ec") }
	<%-- <c:if test="${empty param.inputLeft2 }"></c:if><c:if test="${empty param.inputRight2 }"></c:if> --%>
	${sch2.setFrRange(param.inputLeft2) }
	${sch2.setToRange(param.inputRight2) }
	<c:forEach var="f2" items="${dao2.getRangeticket(sch2)}">
	
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
				  					<div class="col-4 topright aDate1"></div>
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
				  					<div class="col-4 topright aDate2"></div>
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
						<button type="button" class="btn btn-secondary btttn"><span>선택</span><span class="material-symbols-outlined align-middle">arrow_forward</span></button>
				     </div>
			     </div>
			  </div>
			</div>	
		</div>
		</c:forEach></c:forEach>
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
</c:forEach>
//  왕복시 리턴
var flightOb2 = []
<c:forEach var="f" items="${dao2.getRangeticket(sch2)}">
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
	flightOb2.push(fa)
</c:forEach>	
	
// 태평양 표준시로 바꿔서 계산하기..
var dDate1 = document.querySelectorAll(".dDate1")
var fHour1 = document.querySelectorAll(".fHour1")
var airlinelogo1 = document.querySelectorAll(".airlinelogo1")
var dCode1 = document.querySelectorAll(".dCode1")
var aCode1 = document.querySelectorAll(".aCode1")
var aDate1 = document.querySelectorAll(".aDate1")

var dDate2 = document.querySelectorAll(".dDate2")
var fHour2 = document.querySelectorAll(".fHour2")
var airlinelogo2 = document.querySelectorAll(".airlinelogo2")
var dCode2 = document.querySelectorAll(".dCode2")
var aCode2 = document.querySelectorAll(".aCode2") 
var aDate2 = document.querySelectorAll(".aDate2")

var totprice = document.querySelectorAll(".totprice")

var returnJson = []
flightOb1.forEach(function(fa1){
	flightOb2.forEach(function(fa2){
		var rt={}
		rt.flightnumber1 = fa1.flightnumber
		rt.dDate1 = fa1.departDate
		rt.fHour1 = fa1.flightHours
		rt.airlinelogo1 = fa1.airlinelogo
		rt.dCode1 = fa1.departAirportcode
		rt.aCode1 = fa1.arrivetAirportcode
		rt.dpTime1 = fa1.departPacifictime
		rt.apTime1 = fa1.arrivePacifictime
		rt.aDate1 = new Date(fa1.departDate.getFullYear(),fa1.departDate.getMonth(),fa1.departDate.getDate(),fa1.departDate.getHours(),fa1.departDate.getMinutes())
		rt.aDate1.setMinutes(rt.aDate1.getMinutes()+(fa1.departPacifictime-fa1.arrivePacifictime+fa1.flightHours)*60)
		
		rt.flightnumber2 = fa2.flightnumber
		rt.dDate2= fa2.departDate
		rt.fHour2= fa2.flightHours
		rt.airlinelogo2=fa2.airlinelogo
		rt.dCode2 = fa2.departAirportcode
		rt.aCode2 = fa2.arrivetAirportcode
		rt.dpTime2 = fa2.departPacifictime
		rt.pTime2 = fa2.arrivePacifictime
		rt.aDate2 = new Date(fa2.departDate.getFullYear(),fa2.departDate.getMonth(),fa2.departDate.getDate(),fa2.departDate.getHours(),fa2.departDate.getMinutes())
		rt.aDate2.setMinutes(rt.aDate2.getMinutes()+(fa2.departPacifictime-fa2.arrivePacifictime+fa2.flightHours)*60)	
		rt.totprice = fa1.standardFee + fa1.classFee+fa2.standardFee + fa2.classFee		
		i++;
		returnJson.push(rt)
	})
})


// 최저가 순으로 일단 정렬
returnJson.sort(function(left,right){
	return left.totprice- right.totprice;
})
// 화면에 출력	
var i=0;
returnJson.forEach(function(rt){
	dDate1[i].innerText= rt.dDate1.toLocaleString()
	fHour1[i].innerText= parseInt(rt.fHour1)+"시간 "+(rt.fHour1%1)*60+"분"
	airlinelogo1[i].src= rt.airlinelogo1
	dCode1[i].innerText = rt.dCode1
	aCode1[i].innerText = rt.aCode1
	aDate1[i].innerText = rt.aDate1.toLocaleString()
	
	dDate2[i].innerText= rt.dDate2.toLocaleString()
	fHour2[i].innerText= parseInt(rt.fHour2)+"시간 "+(rt.fHour2%1)*60+"분"
	airlinelogo2[i].src=rt.airlinelogo2
	dCode2[i].innerText = rt.dCode2
	aCode2[i].innerText = rt.aCode2
	aDate2[i].innerText = rt.aDate2.toLocaleString()
	totprice[i].innerText = rt.totprice
	i++;
})



var secondaryArr = document.querySelectorAll(".btttn")
secondaryArr.forEach(function(btn,idx){
	btn.onclick= function(){
		var qstr = "?flightNumber="+returnJson[idx].flightnumber1+"&flightNumber="+returnJson[idx].flightnumber2+"&departDate="+returnJson[idx].dDate1+
				"&departDate="+returnJson[idx].dDate2+"&arriveDate="+returnJson[idx].aDate1+"&arriveDate="+returnJson[idx].aDate2+
				"&departAirportcode="+returnJson[idx].dCode1+"&departAirportcode="+returnJson[idx].dCode2+"&arriveAirportcode="+returnJson[idx].aCode1+
				"&arriveAirportcode="+returnJson[idx].aCode2+"&airlinelogo="+returnJson[idx].airlinelogo1+"&airlinelogo="+returnJson[idx].airlinelogo2
		location.href="2999_search_connection.jsp"+qstr
	}
})
</script>
</html>