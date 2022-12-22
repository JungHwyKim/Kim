<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
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
	    <h5>공항명 ${ ff.departAirport}</h5><h6>${ ff.departDate}</h6>
	    </div>
	  </div>
</c:forEach>	  
 <div>
 <ul class="listAlignCenter">
  <li>왕복</li>
  <li>직항</li>
  <li>55분</li>
  <li>인원 : 성인 1, 아동 1</li>
  <li>좌석등급 : 일반석</li>
  <li><img class="listlogo" src="https://blog.kakaocdn.net/dn/kZ08q/btqzbFuEnjY/kKF8BlKYXScpm93sGuRxeK/img.jpg"> &nbsp; 부산항공</li>
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
<tr>
<td rowspan="1"> 인천 →방콕(수완나품)</td>
<td><strong>인천</strong> 2023.02.16 (목) 21:20</td>
<td><strong>방콕(수완나품)</strong> 2023.02.17(금) 	01:25</td>
<td>06시간 05분 </td>
<td><strong>(7C) 제주항공</strong> 2205편
</tr>
<tr>
<td rowspan="1">방콕(수완나품) → 인천</td>
<td><strong>방콕(수완나품)</strong>2023.02.18 (토)  01:00</td>
<td><strong>인천</strong>2023.02.18 (토) 08:25</td>
<td> 05시간 25분</td>
<td><strong>(7C) 제주항공</strong> 2204편
</tr>
</tbody>
</table>
<br>