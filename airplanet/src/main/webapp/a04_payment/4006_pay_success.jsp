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
<title>결제 완료</title>
</head>
<body>

<main class="container">
<%@ include file="/header_logout.jsp" %>
<h2>해외항공권 예약</h2>
<div class="imgbookingisdone">
<div class="text-white"><span class="shadow-primary">결제가 완료되었습니다</span></div>
</div>

<article class="row" style="min-height: 400px">
<div class="col">
<p style="color:steelblue;font-size:large;font-weight: bold">예약번호 : bookingReference</p>
<p>결제 후 영업일 기준 24시간 동안은 항공사 사정으로 예약사항이 변경될 수 있으니 24시간 이후에 꼭 재확인 해주세요. 취소/환불은 항공사별 규정이 적용됩니다.</p>
<div class="row">
<div class="col-sm-5">최종결제금액 <p style="color:steelblue;font-size:large;font-weight: bold">1,111,111원</p></div>
<div class="col-sm-5">운임코드 <p style="color:steelblue;font-size:large;font-weight: bold"> optionCode </p></div>
</div>
<div class="row">
<div class="col-sm-5">예약자 <p style="color:steelblue;font-size:large;font-weight: bold">email</p></div>
<div class="col-sm-5">예약일자 <p style="color:steelblue;font-size:large;font-weight: bold">resDate </p></div>
</div>
<div class="row">
<div class="col-sm-5">예약상태 <p style="color:steelblue;font-size:large;font-weight: bold">resState</p></div>
<div class="col-sm-5">결제정보 <p style="color:steelblue;font-size:large;font-weight: bold">cardinfo </p></div>
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