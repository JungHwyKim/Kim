<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
	import="vo.*"
    import="dao.*"
    import="java.util.*"
    %>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix ="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="/bs-custom.css" rel="stylesheet" >
<style>
.imgbookingisdone{
	background-image: url("${flist.get(0).arriveApphoto }");
	background-repeat: none;
	background-size: cover;
	background-position:center;
	height: 200px;
	display:flex;
	justify-content:center;
	align-items: center;
	}
	
.imgbookingisdone div{
	font-size: 2em;
	font-weight:bold;
	text-align: center;
	}
.shadow-primary{
text-shadow: 1px 1px 4px black ;}

</style>
<title>예약 완료</title>
</head>
<body>


<script>
var departTimes=[]
var arriveTimes=[]
var paymentDue=new Date()
</script>

<jsp:useBean id="dao" class="dao.D_selectFareFlight" />
<c:set var="totalPrice" value="0" />
	<c:forEach var="ii" items="${dao.select(bookingReference) }">
		<script>
		departTimes.push(new Date('${ii[3]}'.substr(0,4),'${ii[3]}'.substr(5,2)-1,
				'${ii[3]}'.substr(8,2), Number('${ii[3]}'.substr(11,2))+Number(${ii[10]}),
				'${ii[3]}'.substr(14,2),'${ii[3]}'.substr(17,2))
		)
		
		arriveTimes.push(new Date('${ii[3]}'.substr(0,4),'${ii[3]}'.substr(5,2)-1,
				'${ii[3]}'.substr(8,2), Number('${ii[3]}'.substr(11,2))+ Number(${ii[4]})+ Number(${ii[11]}),
				'${ii[3]}'.substr(14,2),'${ii[3]}'.substr(17,2)))
		
	paymentDue=new Date('${ii[1]}'.substr(0,4),'${ii[1]}'.substr(5,2)-1,
				Number('${ii[1]}'.substr(8,2))+1, '${ii[1]}'.substr(11,2),
				'${ii[1]}'.substr(14,2),'${ii[1]}'.substr(17,2))
	</script>
	<c:set var="totalPrice" value="${totalPrice + ii[9]}" />
	</c:forEach>

<main class="container">
<%@ include file="/header.jsp" %>
<h2>해외항공권 예약</h2>
<div class="imgbookingisdone">
<div class="text-white"><span class="shadow-primary">예약이 완료되었습니다</span></div>
</div>

<article class="row" style="min-height: 400px">
<div class="col">
<b>예약번호 : ${bookingReference }</b>
<p>결제마감일 이전에 결제하지 않은 경우 동일요금, 조건으로 항공권 구매가 불가능합니다. 마감일은 항공사 사정으로 변경될 수 있으니 24시간 이내에 꼭 재확인 해주세요.</p>
<div class="row">
<div class="col-sm-5">총 요금 <p style="color:steelblue;font-size:large;font-weight: bold"><fmt:formatNumber pattern="0,000원" value="${totalPrice }" /></p></div>
<div class="col-sm-5">결제 마감일<p style="color:steelblue;font-size:large;font-weight: bold" id="paymentDue"> 까지</p></div>
</div>
</div>

<div class="col mx-1" id="reservedSchedule">
<h4 class="text-primary">예약한 항공 스케줄</h4>
					<c:forEach var="each" items="${dao.select(bookingReference) }">
	<div class ="row bg-info border m-2">
		<div class="col"><h4>${each[7] }</h4> <span class="departTimespan">${each[3] }</span></div>
		<div class="col"><h4>${each[8] }</h4><span class="arriveTimespan"></span> </div>
	</div>

					</c:forEach>
	
</div>
</article>

<div class="row mb-5">
<button class="col btn btn-primary mx-2">마이페이지</button>
<button class="col btn btn-primary mx-2">에어플래닛 메인</button>
</div>

<hr>
</main>
<%@ include file="/0000_footer.html" %>

<script>
var departTimespan=document.querySelectorAll('.departTimespan')		
var arriveTimespan=document.querySelectorAll('.arriveTimespan')		
var paymentDueP=document.querySelector('#paymentDue')		
paymentDueP.innerHTML=paymentDue.toLocaleString();
	
for(let i=0;i<departTimespan.length;i++){
	departTimespan[i].innerHTML=departTimes[i].toLocaleString()
	arriveTimespan[i].innerHTML=arriveTimes[i].toLocaleString()
}

</script>
</body>
</html>