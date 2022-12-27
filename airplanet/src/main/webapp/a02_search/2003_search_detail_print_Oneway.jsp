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
	align-items: center;
}
.schedule-right{
	padding-top: 1%;
	padding-bottom: 1%;
}

</style>
</head>
<body>

	<jsp:useBean id="dao" class="dao.B_search_detail"/>
	<jsp:useBean id="sch" class="vo.FlightAll"/>
	<jsp:setProperty property="*" name="sch"/>
	${sch.setDepartDate("2022-12-30") } ${sch.setDepartLocation("NRT") } ${sch.setArriveLocation("ICN") } ${sch.setClassStr("ec") }
	<c:forEach var="f" items="${dao.getMinfeeC(sch)}">
		<div class="row">	
			<div class="card">
			  <div class="card-body schedule">
			    <div class="row">
				  	<div class="col-8">
				  		<div class="row">
				  			<div class="col-3"><img class="airlinelogo" src="" width="100%"></div>
				  			<div class="col-9">
				  				<div class="row">
				  					<div class="col-4 topleft"></div>
				  					<div class="col-4 topcenter"></div>
				  					<div class="col-4 topright">도착시간</div>
				  				</div>
				  				<div class="row">
				  					<div class="col-4 botleft"></div>
				  					<div class="col-4 botcenter">직항/경유</div>
				  					<div class="col-4 botright"></div>
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
<script type="text/javascript">
// 항공권 배열에 저장
var flightOb = []
<c:forEach var="f" items="${dao.getMinfeeC(sch)}">
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
	flightOb.push(fa)
	//console.log(fa.flightnumber+" "+fa.departDate+" "+fa.departAirportcode+" "+fa.arrivetAirportcode+" "+fa.flightHours+" "+fa.departPacifictime
		//	+" "+fa.arrivePacifictime+" "+fa.airlinelogo+" "+fa.standardFee+" "+fa.classFee)
</c:forEach>
	
	
// 태평양 표준시로 바꿔서 계산하기..
var topleftarr = document.querySelectorAll(".topleft")
var topcenterarr = document.querySelectorAll(".topcenter")
var airlinelogo = document.querySelectorAll(".airlinelogo")
var botleft = document.querySelectorAll(".botleft")
var botright = document.querySelectorAll(".botright") 
var totprice = document.querySelectorAll(".totprice")
var i=0;
flightOb.forEach(function(fa){
	topleftarr[i].innerText= fa.departDate.toTimeString().split(' ')[0].slice(0,5)
	topcenterarr[i].innerText= parseInt(fa.flightHours)+"시간 "+(fa.flightHours%1)*60+"분" // 왜 첫번째만 출력될까,,
	airlinelogo[i].src=fa.airlinelogo
	botleft[i].innerText = fa.departAirportcode
	botright[i].innerText = fa.arrivetAirportcode
	totprice[i].innerText = fa.standardFee + fa.classFee
	i++;
})

console.log(topcenterarr[1].innerText)
	


</script>
</html>