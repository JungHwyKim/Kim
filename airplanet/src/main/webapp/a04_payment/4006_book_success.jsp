<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="/bs-custom.css" rel="stylesheet" >
<style>
.imgbookingisdone{
	background-image: url("https://wallpaperaccess.com/full/58330.jpg");
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
text-shadow: 1px 1px 3px steelblue ;}

</style>
<title>예약 완료</title>
</head>
<body>

<main class="container">
<%@ include file="/header_logout.jsp" %>
<h2>해외항공권 예약</h2>
<div class="imgbookingisdone">
<div class="text-white"><span class="shadow-primary">예약이 완료되었습니다</span></div>
</div>

<article class="row" style="min-height: 400px">
<div class="col">
<b>예약번호 : adsfasdf</b>
<p>결제마감일 이전에 결제하지 않은 경우 동일요금, 조건으로 항공권 구매가 불가능합니다. 마감일은 항공사 사정으로 변경될 수 있으니 24시간 이내에 꼭 재확인 해주세요.</p>
<div class="row">
<div class="col-sm-5">총 요금 <p style="color:steelblue;font-size:large;font-weight: bold">1,111,111원</p></div>
<div class="col-sm-5">결제 마감일 <p style="color:steelblue;font-size:large;font-weight: bold">2022.12.19 14:00</p></div>
</div>
</div>

<div class="col mx-1">
<h4 class="text-primary">예약한 항공 스케줄</h4>
	<div class ="row bg-info border m-2">
		<div class="col"><h4>인천 (INC)</h4> 2023.03.25(토)</div>
		<div class="col"><h4>후쿠오카 (FUK)</h4> 2023.03.25(토)</div>
	</div>
	<div class ="row bg-info border m-2">
		<div class="col"><h4>후쿠오카 (FUK)</h4> 2023.03.30(토)</div>
		<div class="col"><h4>인천 (INC)</h4>  2023.03.30(토)</div>
	</div>
</div>
</article>

<div class="row mb-5">
<button class="col btn btn-primary mx-2">마이페이지</button>
<button class="col btn btn-primary mx-2">에어플래닛 메인</button>
</div>

<hr>
</main>
<%@ include file="/0000_footer.html" %>
</body>
</html>