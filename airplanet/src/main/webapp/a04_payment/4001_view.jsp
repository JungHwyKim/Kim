<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>선택한 일정</title>
<link href="bs-custom.css" rel="stylesheet" >
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
<%@ include file="0000_header.html" %>
<main class="container">
<h2>선택한 항공 스케줄</h2>
<%@ include file="4001_scheduleDetail.jsp" %>

<div class="row">
<h5 class="col-1 p-0" >조건 선택</h5>
<div class="col" ><button type="button" class="btn btn-primary showswitch" style="width: 100%">가는 편</button></div>
<div class="col" ><button type="button" class="btn btn-secondary showswitch" style="width: 100%">오는 편</button></div></div>
<form class="form-group">
<div class="showswitchtarget">
<table class="table table-bordered">	<!-- 반복문으로 판매할수있는 상품들 출력해서 고르게 -->
<colgroup><col style="width:10%"><col style="width:10%"><col style="width:20%"><col style="width:20%"><col style="width:20%"></colgroup>
<tr class="table-secondary"><th rowspan="4">성인</th><th>인원</th><th>선택사항1</th><th>선택사항2</th><th>합계</th><th>선택</th></tr>
<tr><td>1명</td><td>비즈니스석</td><td>수하물 추가</td><td>980,000</td><td><input type="radio" name="passenger1go" checked></td></tr>
<tr><td>1명</td><td>비즈니스석</td><td>-</td><td>960,000</td><td><input type="radio" name="passenger1go"></td></tr>
<tr><td>1명</td><td>일반석</td><td>-</td><td>380,000</td><td><input type="radio" name="passenger1go"></td></tr>
</table>
<table class="table table-bordered">
<colgroup><col style="width:10%"><col style="width:10%"><col style="width:20%"><col style="width:20%"><col style="width:20%"></colgroup>
<tr class="table-secondary"><th rowspan="4">아동</th><th>인원</th><th>선택사항1</th><th>선택사항2</th><th>합계</th><th>선택</th></tr>
<tr><td>1명</td><td>비즈니스석</td><td>수하물 추가</td><td>980,000</td><td><input type="radio" name="passenger2go" checked></td></tr>
<tr><td>1명</td><td>비즈니스석</td><td>-</td><td>960,000</td><td><input type="radio" name="passenger2go"></td></tr>
<tr><td>1명</td><td>일반석</td><td>-</td><td>380,000</td><td><input type="radio" name="passenger2go"></td></tr>
</table>
</div>
	<div class="showswitchtarget" style="display:none">	<!-- 오는편 선택 -->
	<table class="table table-bordered">	<!-- 반복문으로 판매할수있는 상품들 출력해서 고르게 -->
	<colgroup><col style="width:10%"><col style="width:10%"><col style="width:20%"><col style="width:20%"><col style="width:20%"></colgroup>
	<tr class="table-secondary"><th rowspan="4">성인</th><th>인원</th><th>선택사항1</th><th>선택사항2</th><th>합계</th><th>선택</th></tr>
	<tr><td>1명</td><td>비즈니스석</td><td>수하물 추가</td><td>2,480,000</td><td><input type="radio" name="passenger1back" checked></td></tr>
	<tr><td>1명</td><td>일반석</td><td>-</td><td>1,500,000</td><td><input type="radio" name="passenger1back"></td></tr>
	<tr><td>1명</td><td>일반석</td><td>-</td><td>980,000</td><td><input type="radio" name="passenger1back"></td></tr>
	</table>
	<table class="table table-bordered">
	<colgroup><col style="width:10%"><col style="width:10%"><col style="width:20%"><col style="width:20%"><col style="width:20%"></colgroup>
	<tr class="table-secondary"><th rowspan="4">아동</th><th>인원</th><th>선택사항1</th><th>선택사항2</th><th>합계</th><th>선택</th></tr>
	<tr><td>1명</td><td>일반석</td><td>수하물 추가</td><td>980,000</td><td><input type="radio" name="passenger2back" checked></td></tr>
	<tr><td>1명</td><td>일반석</td><td>-</td><td>760,000</td><td><input type="radio" name="passenger2back"></td></tr>
	<tr><td>1명</td><td>일반석</td><td>-</td><td>580,000</td><td><input type="radio" name="passenger2back"></td></tr>
	</table>
	</div>
<input type="submit" class="btn btn-primary" value="예약하기">
</form>
</main>

<script type="text/javascript" src="4000_switchInfo.js">/*버튼눌러서 가는편 오는편 바꾸기*/</script>
<script>
var btns=document.querySelectorAll('button')
btns[0].addEventListener('click',function(){
	showswitching('0','0','','','','')
	showswitching('1','0','none','','','')
})
btns[1].addEventListener('click',function(){
	showswitching('1','1','','','','')
	showswitching('0','1','none','','','')
})
</script>

</body>
</html>