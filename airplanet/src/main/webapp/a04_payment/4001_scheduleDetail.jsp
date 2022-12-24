<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="vo.FlightAll"
    import="java.util.*"
    %>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
.listAlignCenter{
	display:block;
	align-items:center;
	text-align: center;
	margin:2px;
	
}
.listAlignCenter li{ display:inline-block; padding-right: 5%;margin-bottom:0;}
.listlogo{
	max-height: 30px;
	margin: 0;
	padding:0;
	border-radius: 5px;
	}
</style>

<div class="row card-group bg-primary text-white">
<c:forEach var="ff" items="${flist}" varStatus="i">
	  <div class="card bg-transparent">
	    <div class="card-body mx-auto">
	    <h5>${ ff.departApcity} ${ ff.departAirportcode}</h5><h6>${ ff.departDate}</h6>
	    </div>
	  </div>
</c:forEach>
 
 <div>
 <ul class="listAlignCenter">
  <li>${summary[0] }</li>
  <li>${summary[1] }</li>
  <li>${summary[2] }</li>
  <li>인원 : ${summary[3] }</li>
  <li>좌석등급 : ${summary[4] }</li>
  <li><img class="listlogo" src="${summary[5] }"> &nbsp; ${summary[6] }</li>
</ul></div>
</div>
<h5>상세 비행 스케줄</h5>
<table class="table table-bordered">
<thead>
	<tr>
	<th>구간</th>
	<th>출발</th>
	<th>도착</th>
	<th>비행시간</th>
	<th>상세비행정보</th>
	</tr>
</thead>
<tbody>

	<c:forEach var="ff" items="${flist}" varStatus="i">
	<tr>
	<td rowspan="1"> ${ff.departLocation } → ${ff.arriveLocation }</td>
	<td><strong>${ff.departApcity }</strong> ${ff.departDate }</td>
	<td><strong>${ff.arriveApcity}</strong> 도착일자시간</td>
	<td>${ff.flightHours } </td>
	<td><strong>${ff.airlineName }</strong><span style="font-size:0.8em">${ff.flightNumber }</span>
	</tr>
	</c:forEach>

</tbody>
</table>
<br>