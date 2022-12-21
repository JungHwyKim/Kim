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
.field input {
    font-size: 16px;
    line-height: 28px;
    padding: 8px 16px;
    width: 100%;
    min-height: 44px;
    border: unset;
    border-radius: 4px;
    outline-color: rgb(84 105 212 / 0.5);
    background-color: rgb(255, 255, 255);
    box-shadow: rgba(0, 0, 0, 0) 0px 0px 0px 0px, 
                rgba(0, 0, 0, 0) 0px 0px 0px 0px, 
                rgba(0, 0, 0, 0) 0px 0px 0px 0px, 
                rgba(60, 66, 87, 0.16) 0px 0px 0px 1px, 
                rgba(0, 0, 0, 0) 0px 0px 0px 0px, 
                rgba(0, 0, 0, 0) 0px 0px 0px 0px, 
                rgba(0, 0, 0, 0) 0px 0px 0px 0px;
}
</style>
</head>
<body>
	<div class="container-fluid">
	<%@ include file="/header_logout.html" %>
		<div class="row p-3 mt-5 border-0 bg-secondary bg-opacity-50">
			<h2>My page > 내 예약 > 변경 요청</h2>
		</div>
		<div class="row no-gutters">
			<div class="col-1"></div>
			<div class="col-6">
				<p style="float:right;margin-top:10px;"><a href="#">취소 및 변경 규정</a></p>
				<h1 style="margin-top:30px;"><b>변경 정보</b></h1>
				<div class="border border-2 p-2 mt-3 mb-3 bg-white">어떠한 추가 취소 수수료도 부과하지 않습니다. 부과되는 비용은 공급업체 수수료 및 비용을 따릅니다.</div>
				<div><h2><b>1. 탑승객/구간</b></h2></div>
				<div class="form-check">
					<input style="zoom:2.0;margin-left:0px;margin-top:10px;" class="form-check-input" type="checkbox" value="" id="flexCheckChecked" checked>
					<label style="font-size:30px;margin-top:10px;"class="form-check-label" for="flexCheckChecked">
						<b>탑승객1 김길동</b>
					</label>
				</div>
				<div style="margin-left:60px;margin-top:10px;">
					<h4><b>출발지-도착지</b></h4>
				</div>
				<div style="margin-left:60px;margin-top:12px;">
					<p style="font-size:20px;">출발 날짜 및 시간</p>
					<p style="font-size:18px;">항공편: 출발 전, 항공권: 미사용</p>
				</div>
				<hr>
			</div>
			<div class="col-1"></div>
			<div class="col-3 mt-5 bg-secondary bg-opacity-50">
				<h2 style="margin:40px;"><b>변경 수수료</b></h2>
				<hr>
				<h3 style="margin:40px;text-align:right"><b>0원</b></h3>
				<button style="margin-top:30px;font-size:30px;float:right;width:95%;height:60px;background:steelblue;border:none;color:white;border-radius:12px;" class="btn me-md-2" type="button">결제하기</button>
			</div>
			<div class="col-1"></div>
			<div class="col-md-3 offset-md-1">
				<div class="form-check">
					<input style="zoom:2.0;margin-left:0px;margin-top:10px;" class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
					<label style="font-size:30px;margin-top:10px;"class="form-check-label" for="flexCheckDefault">
						<b>탑승객2 홍길동</b>
					</label>
				</div>
				<div style="margin-left:60px;margin-top:10px;">
					<h4><b>출발지-도착지</b></h4>
				</div>
				<div style="margin-left:60px;margin-top:12px;">
					<p style="font-size:20px;">출발 날짜 및 시간</p>
					<p style="font-size:18px;">항공편: 출발 전, 항공권: 미사용</p>
				</div>
			</div>
			<div class="w-100"></div>
			<div class="col-md-6 mt-3 offset-md-1">
				<div><h2><b>2. 날짜/항공편 변경</b></h2></div>
				<div class="field" style="margin-left:25px;">
					<label style="font-size:20px;"for="exampleFormControlInput1" class="form-label"><b>가는 날</b></label>
  					<input type="date" name="date" >	
  				</div>
				<button style="margin-top:10px;float:right;width:30%;height:40px;background:steelblue;border:none;color:white;border-radius:12px;" class="btn me-md-2" id="search">항공편 검색</button>
			</div>
			<div class="w-100"></div>
			<div class="col-md-3 mt-3 offset-md-1">
				<div><h2><b>연락처</b></h2></div>
				<div style="margin-left:25px;">
					<p style="font-size:20px;"><b>휴대폰</b>&nbsp;+82 12345678</p>
					<p style="font-size:20px;"><b>이메일</b>&nbsp;XXXX@email.com</p>
  				</div>
			</div>
		</div>
	</div>
	<br><br>
<%@ include file="/0000_footer.html" %>
</body>
<script>
var dateOb = document.querySelector("[name=date]")
var searchOb = document.querySelector("#search")

// 버튼 활성화
searchOb.disabled = true;
dateOb.addEventListener("change", stateHandle);
function stateHandle() {
  if (dateOb.value == "") {
	 searchOb.disabled = true; 
  } else {
	 searchOb.disabled = false;
  }
}

</script>
</html>