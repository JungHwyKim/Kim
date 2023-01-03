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

<%--dao.B_search_range getRangeticket    param.inputLeft  param.inputRight  --%>

	<jsp:useBean id="dao1" class="dao.B_search_range"/>
	<jsp:useBean id="sch1" class="vo.FlightAll"/>
	<jsp:setProperty property="*" name="sch1"/>
	${sch1.setDepartDate("2022-12-21") } ${sch1.setDepartLocation("ICN") } ${sch1.setArriveLocation(city) } ${sch1.setClassStr("ec") }
	${sch1.setFrRange(param.inputLeft) }
	${sch1.setToRange(param.inputRight) }
	${sch1.setSort(param.selectSort) }
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
				  					<div class="col-4 topright aDate1"></div>
				  				</div>
				  				<div class="row">
				  					<div class="col-4 botleft dCode1"></div>
				  					<div class="col-4 botcenter">직항/경유</div>
				  					<div class="col-4 botright aCode1"></div>
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
</c:forEach>
	
	// 태평양 표준시로 바꿔서 계산하기..
	var dDate1 = document.querySelectorAll(".dDate1")
	var fHour1 = document.querySelectorAll(".fHour1")
	var airlinelogo1 = document.querySelectorAll(".airlinelogo1")
	var dCode1 = document.querySelectorAll(".dCode1")
	var aCode1 = document.querySelectorAll(".aCode1")
	var aDate1 = document.querySelectorAll(".aDate1")
	var totprice = document.querySelectorAll(".totprice")

	var returnJson = []
	flightOb1.forEach(function(fa1){
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
			rt.totprice = fa1.standardFee + fa1.classFee
			returnJson.push(rt)
		})
		
	//정렬 기능메서드
	function sortMinfee(){
		returnJson.sort(function(left,right){
			return left.totprice- right.totprice;
		})
		console.log(returnJson[0].totprice)
	}
	function sortFhour(){
		returnJson.sort(function(left,right){
			return left.fHour1- right.fHour1;
		})
		console.log(returnJson[0].totprice)
	}
	function sortDate(){
		returnJson.sort(function(left,right){
			return left.dDate1- right.dDate1;
		})
		console.log(returnJson[0].totprice)
	}	
	sortMinfee(); sortFhour();sortDate();
	// 화면에 출력	
	var i=0;
	returnJson.forEach(function(rt){
		dDate1[i].innerText= rt.dDate1.toLocaleString()
		fHour1[i].innerText= parseInt(rt.fHour1)+"시간 "+(rt.fHour1%1)*60+"분"
		airlinelogo1[i].src= rt.airlinelogo1
		dCode1[i].innerText = rt.dCode1
		aCode1[i].innerText = rt.aCode1
		aDate1[i].innerText = rt.aDate1.toLocaleString()
		totprice[i].innerText = rt.totprice
		i++
	})
	
	
	
	var secondaryArr = document.querySelectorAll(".btttn")
	secondaryArr.forEach(function(btn,idx){
		btn.onclick=function(){
			var qstr = "?flightNumber="+returnJson[idx].flightnumber1+"&departDate="+returnJson[idx].dDate1+
			"&arriveDate="+returnJson[idx].aDate1+"&departAirportcode="+returnJson[idx].dCode1+"&arriveAirportcode="+returnJson[idx].aCode1+
			"&airlinelogo="+returnJson[idx].airlinelogo1  
			location.href="2999_search_connection.jsp"+qstr
		}
	})

	
</script>
</html>