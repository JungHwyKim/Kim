<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="vo.FlightAll"
    import="vo.TicketOption"
    import="dao.*"
    import="java.util.*"
    %>
<%
//가는편
FlightAll flight1 = new FlightAll("ICNLAX22122115","KE","ICN","2022-12-21 15:00","LAX",8,999999);
flight1.setDepartApcity("인천");flight1.setArriveApcity("LA");
flight1.setAirlineName("대한항공");flight1.setAirlinelogo("/b01_img/ke.PNG");
flight1.setDepartLocation("인천");flight1.setArriveLocation("LA");flight1.setClassStr("bs");
flight1.setOptioncode("ICNLAX22122115bs0");flight1.setClassfee(23420);flight1.setBaggage(0);

//오는편 정보 넘겨받은거
FlightAll flight2 = new FlightAll("LAXICN22123020","KE","LAX","2022-12-30 20:00","ICN",10,1000000);
flight2.setDepartApcity("LA");flight2.setArriveApcity("인천");
flight2.setAirlineName("대한항공");flight2.setAirlinelogo(request.getContextPath()+"/b01_img/ke.PNG");
flight2.setDepartLocation("LA");flight2.setArriveLocation("인천");flight2.setClassStr("ec");
flight2.setOptioncode("LAXICN22123020ec2");flight2.setClassfee(0);flight2.setBaggage(50000);

ArrayList<FlightAll> flist=new ArrayList<FlightAll>();
flist.add(flight1);
flist.add(flight2);
//여기까지 넘겨받을 데이터들


//스케줄디테일에 출력될 서머리 json으로 만들기(가는표 기준)
String [] summary= new String[7];
summary[0]=flist.get(0).getDepartLocation()==flist.get(flist.size()-1).getDepartLocation()?"편도":"왕복";
summary[1]="직항";
summary[2]=flist.get(0).getFlightHours()+"시간";
summary[3]="성인 1명";
summary[4]="일반석";
summary[5]=flist.get(0).getAirlinelogo();
summary[6]=flist.get(0).getAirlineName();

for(FlightAll ff:flist){
	if(ff.getDepartLocation()!=ff.getDepartApcity()){
		summary[1]="경유";
	}
	if(ff.getOptioncode().indexOf("bs")!=-1){
		summary[4]="비즈니스석";
	}else if(ff.getOptioncode().indexOf("fs")!=-1){
		summary[4]="일등석";
	}
}

//옵션선택할 수 있게 노선번호랑 좌석등급으로 검색하기
List<TicketOption> tlist1=new ArrayList<TicketOption>();	//갈때
D_selectTicketOption ticketdao= new D_selectTicketOption();
TicketOption forSearch= new TicketOption();
forSearch.setFlightNumber(flist.get(0).getFlightNumber());
forSearch.setOptionCode(flist.get(0).getClassStr());
forSearch.setStock(1);
tlist1=ticketdao.selectAll(forSearch);

if(summary[0].equals("왕복")){	//올때
List<TicketOption> tlist2=new ArrayList<TicketOption>();
TicketOption forSearch2= new TicketOption();
forSearch2.setFlightNumber(flist.get(flist.size()-1).getFlightNumber());
forSearch2.setOptionCode(flist.get(flist.size()-1).getClassStr());
forSearch2.setStock(1);
tlist2=ticketdao.selectAll(forSearch2);
request.setAttribute("tlist2", tlist2);
}

request.setAttribute("tlist1", tlist1);
request.setAttribute("flist", flist);
request.setAttribute("summary", summary);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>선택한 일정</title>
<link href="/bs-custom.css" rel="stylesheet" >
<style>
form{
	position:relative;}
[type=submit]{
	position:absolute;
	right:10px;
	width: 40%;
	height: 50px;}
</style>
</head>
<body>
<main class="container">
<%@ include file="/header.jsp" %>
<h2>선택한 항공 스케줄</h2>
<%@ include file="4001_scheduleDetail.jsp" %>

<div class="row">
<h5 class="col-2 p-0" >조건 선택</h5>
<div class="col" ><button type="button" class="btn btn-primary showswitch" style="width: 100%">가는 편</button></div>

<c:if test="${not empty tlist2 }">	
	<div class="col" ><button type="button" class="btn btn-secondary showswitch" style="width: 100%">오는 편</button></div></div>
	</c:if>

<form class="form-group">
<div class="showswitchtarget">
<table class="table table-bordered">	<!-- 반복문으로 판매할수있는 상품들 출력해서 고르게 -->
<colgroup><col style="width:10%"><col style="width:10%"><col style="width:20%"><col style="width:20%"><col style="width:20%"></colgroup>
<tr class="table-secondary"><th rowspan="4">성인</th><th>인원</th><th>선택사항1</th><th>선택사항2</th><th>합계</th><th>선택</th></tr>
	<c:forEach var="eachticket" items="${tlist1 }" >
	<tr><td>1명</td><td>${eachticket.classStr }</td><td>${eachticket.baggageStr }</td>
		<td>${flist.get(0).standardFee+eachticket.classFee+eachticket.baggage }</td>
	<td><input value="${eachticket.optionCode }" type="radio" name="passenger1go" checked></td></tr>
	</c:forEach>
</table>
</div>


<c:if test="${not empty tlist2 }">
<div class="showswitchtarget" style="display:none">	<!-- 오는편 선택 -->
	<table class="table table-bordered">	<!-- 반복문으로 판매할수있는 상품들 출력해서 고르게 -->
	<colgroup><col style="width:10%"><col style="width:10%"><col style="width:20%"><col style="width:20%"><col style="width:20%"></colgroup>
	<tr class="table-secondary"><th rowspan="4">성인</th><th>인원</th><th>선택사항1</th><th>선택사항2</th><th>합계</th><th>선택</th></tr>
		<c:forEach var="eachticket" items="${tlist2 }" >
		<tr><td>1명</td><td>${eachticket.classStr }</td><td>${eachticket.baggageStr }</td>
		<td>${flist.get(1).standardFee+eachticket.classFee+eachticket.baggage }</td>
		<td><input value="${eachticket.optionCode }" type="radio" name="passenger1back" checked></td></tr>
		</c:forEach>
	</table>

</div>
</c:if>

<input type="submit" class="btn btn-primary" value="예약하기" name="submitting" >
</form>
</main>
<%@ include file="/0000_footer.html" %>

<jsp:forward page="zzzz.jsp"></jsp:forward>


<script type="text/javascript" src="4000_switchInfo.js">/*버튼눌러서 가는편 오는편 바꾸기*/</script>
<script>
var btns=document.querySelectorAll('button')
btns[0].addEventListener('click',function(){
	showswitching('0','0','','','','')
	showswitching('1','0','none','','','')
})
	<c:if test="${not empty tlist2 }">
	btns[1].addEventListener('click',function(){
		showswitching('1','1','','','','')
		showswitching('0','1','none','','','')
	})
	</c:if>

var sbt=document.querySelector('[name=submitting]')
sbt.onclick=function(){
	this.value="true"

}
</script>

</body>
</html>
