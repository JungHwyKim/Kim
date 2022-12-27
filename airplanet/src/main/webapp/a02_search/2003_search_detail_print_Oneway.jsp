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
	${sch.setDepartDate("2022-12-21") } ${sch.setDepartLocation("인천") } ${sch.setArriveLocation("LA") } ${sch.setClassStr("bs") }
	<c:forEach var="f" items="${dao.getMinfeeC(sch)}">
		<div class="row">	
			<div class="card">
			  <div class="card-body schedule">
			    <div class="row">
				  	<div class="col-8">
				  		<div class="row">
				  			<div class="col-3"><img src="${f.airlinelogo }" width="100%"></div>
				  			<div class="col-9">
				  				<div class="row">
				  					<div class="col-4 topleft"></div>
				  					<div class="col-4 topcenter">${f.flightHours }</div>
				  					<div class="col-4 topright">도착시간</div>
				  				</div>
				  				<div class="row">
				  					<div class="col-4 botleft">${f.departAirportcode }</div>
				  					<div class="col-4 botcenter">직항/경유</div>
				  					<div class="col-4 botright">${f.arriveAirportcode }</div>
				  				</div>				  				
				  			</div>

				  		</div>
						  		
				     </div>
				     <div class="col-4 schedule-right">
						<p class="text-center topcenter">오늘 예약하기</p>
						<c:set var= "total" value="${f.classfee + f.standardFee}"/> 
						<p class="text-center fw-semibold"><fmt:formatNumber value="${total}"/></p>
						<button type="button" class="btn btn-secondary"><span>선택</span><span class="material-symbols-outlined align-middle">arrow_forward</span></button>
				     </div>
			     </div>
			  </div>
			</div>	
		</div>
		</c:forEach>	
</body>
<script type="text/javascript">
var arr = new Array();
<c:forEach var="f" items="${dao.getMinfeeC(sch)}">
	arr.push("${f.departDate}")
</c:forEach>
var arr2 = new Array();
arr.forEach(function(a){
	arr2.push(a.substring(0,19))
})
var arr3 = new Array();
arr2.forEach(function(a){
	arr3.push(new Date(a).toTimeString().split(' ')[0].slice(0,5))
})

// 태평양 표준시로 바꿔서 계산하기..
var topleftarr = document.querySelectorAll(".topleft")
for(var i=0;i<=arr3.length;i++){
	topleftarr[i].innerText= arr3[i]
}
</script>
</html>