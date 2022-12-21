<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"  
   %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>변경 요청</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" >
<style type="text/css">

</style>
</head>
<body>
	<div class="container-fluid">
		<div class="row p-3 mt-5 border-0 bg-secondary bg-opacity-50">
			<h2>My page > 내 예약 > 변경 요청</h2>
		</div>
		<div class="row m-5">
			<div><h1><b>변경할 항공편 선택</b></h1></div>
		</div>
		<div class="row p-3 m-5 border-0 bg-secondary bg-opacity-25">
			<span><b style="font-size:40px;">가는 날 출발시간</b>&nbsp;&nbsp;<b style="font-size:20px;">2022년 12월 19일(월)</b><b style="float:right;">모든 시간은 현지 시간</b></span>
			<div style="display:flex;margin-top:30px;">
				<div>
					<h5>항공사</h5>
					<h5 style="margin-top:10px;">아시아나 항공</h5>
				</div>
				<div style="margin-left:30px;">
					<h5>오전 08:45</h5>
					<h5 style="margin-top:10px;">ICN</h5>
				</div>
				<div style="margin-left:30px;">
					<h5>- 2시간 55분 소요 -></h5>
					<h5 style="margin-top:10px;">직항</h5>
				</div>
				<div style="margin-left:30px;">
					<h5>오전 11:40</h5>
					<h5 style="margin-top:10px;">JFK</h5>
				</div>
			</div>
			<div class="row mt-3">
				<h5>탑승객 이름<br></h5>
				<h5>김길동,홍길동,신길동,최길동</h5>
			</div>
			<div class="d-grid gap-2 d-md-flex justify-content-md-end">
			  <button style="float:right;width:10%;height:40px;background:steelblue;border:none;color:white;border-radius:12px;" class="btn me-md-2" onclick="window.open('3006_change_flight_input.jsp')">변경 요청</button>
			</div>
		</div>
		<div class="row p-3 m-5 border-0 bg-secondary bg-opacity-25">
			<span><b style="font-size:40px;">오는 날 출발시간</b>&nbsp;&nbsp;<b style="font-size:20px;">2022년 12월 26일(월)</b><b style="float:right;">모든 시간은 현지 시간</b></span>
			<div style="display:flex;margin-top:30px;">
				<div>
					<h5>항공사</h5>
					<h5 style="margin-top:10px;">아시아나 항공</h5>
				</div>
				<div style="margin-left:30px;">
					<h5>오후 15:20</h5>
					<h5 style="margin-top:10px;">JFK</h5>
				</div>
				<div style="margin-left:30px;">
					<h5>- 2시간 55분 소요 -></h5>
					<h5 style="margin-top:10px;">직항</h5>
				</div>
				<div style="margin-left:30px;">
					<h5>오후 18:15</h5>
					<h5 style="margin-top:10px;">ICN</h5>
				</div>
			</div>
			<div class="row mt-3">
				<h5>탑승객 이름<br></h5>
				<h5>김길동,홍길동,신길동,최길동</h5>
			</div>
			<div class="d-grid gap-2 d-md-flex justify-content-md-end">
			  <button style="float:right;width:10%;height:40px;background:steelblue;border:none;color:white;border-radius:12px;" class="btn me-md-2" onclick="window.open('3006_change_flight_input.jsp')">변경 요청</button>
			</div>
		</div>
	</div>
	<br><br>
<%@ include file="0000_footer.html" %>
</body>
</html>