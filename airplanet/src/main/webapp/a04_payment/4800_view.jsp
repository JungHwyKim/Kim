<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
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
	<tr><td>1명</td><td>${eachticket.classStr }</td><td>${eachticket.baggageStr }</td><td>960,000</td><td><input type="radio" name="passenger1go" checked></td></tr>
	</c:forEach>
</table>


<table class="table table-bordered">
<colgroup><col style="width:10%"><col style="width:10%"><col style="width:20%"><col style="width:20%"><col style="width:20%"></colgroup>
<tr class="table-secondary"><th rowspan="4">아동</th><th>인원</th><th>선택사항1</th><th>선택사항2</th><th>합계</th><th>선택</th></tr>
<tr><td>1명</td><td>비즈니스석</td><td>수하물 추가</td><td>980,000</td><td><input type="radio" name="passenger2go" checked></td></tr>
<tr><td>1명</td><td>비즈니스석</td><td>-</td><td>960,000</td><td><input type="radio" name="passenger2go"></td></tr>
<tr><td>1명</td><td>일반석</td><td>-</td><td>380,000</td><td><input type="radio" name="passenger2go"></td></tr>
</table>
</div>

<c:if test="${not empty tlist2 }">
<div class="showswitchtarget" style="display:none">	<!-- 오는편 선택 -->
	<table class="table table-bordered">	<!-- 반복문으로 판매할수있는 상품들 출력해서 고르게 -->
	<colgroup><col style="width:10%"><col style="width:10%"><col style="width:20%"><col style="width:20%"><col style="width:20%"></colgroup>
	<tr class="table-secondary"><th rowspan="4">성인</th><th>인원</th><th>선택사항1</th><th>선택사항2</th><th>합계</th><th>선택</th></tr>
		<c:forEach var="eachticket" items="${tlist2 }" >
		<tr><td>1명</td><td>${eachticket.classStr }</td><td>${eachticket.baggageStr }</td><td>960,000</td><td><input type="radio" name="passenger1back" checked></td></tr>
		</c:forEach>
	</table>

</div>
</c:if>

<input type="submit" class="btn btn-primary" value="예약하기" name="submit">
</form>
</main>

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

var sbt=document.querySelector('[name=submit]')
sbt.onclick=function(){
	sbt.value="true"
}

<% 
String gogo=request.getParameter("submit");
if(gogo!=null&&gogo!=""){
	if(gogo.equals("true")){
		request.setAttribute("flist", request.getAttribute("flist"));
		request.getRequestDispatcher("4899_viewToTotal.jsp").forward(request, response); 
	}
}
%>
</script>

</body>
</html>