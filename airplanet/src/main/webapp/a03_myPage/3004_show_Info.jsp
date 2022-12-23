<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"  
   %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 예약</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" >
<style>
img.user{
	width:70%;
}
.astyle{
	color:black;
	text-decoration-line: none;
}
.btnOut{
	margin-top:30px;
	width:70%;
	height:70px;
	background:steelblue;
	color:white;
	border:none;
	border-radius: 12px;
}
.btnSearch{
	margin-top:20px;
	float:right;
	font-size:25px;
	width:20%;
	height:40px;
	background:steelblue;
	color:white;
	border:none;
	border-radius: 12px;
}
.btnCommon{
	background:steelblue;
	color:white;border-radius:12px;
}
.btn03{
	margin-top:20px;
	float:right;
	font-size:25px;
	width:5%;
	height:40px;
	background:steelblue;
	color:white;
	border:none;
	border-radius: 12px;
}
.field{
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
<body>
<%@ include file="/header_logout.jsp" %>
<br><br>
	<div class="container-fluid">
	  <div class="row no-gutters">
	  	<div class="col-1"></div>
	    <div class="col-3" style="text-align:center;font-size:25px;">
	     <div class="p-3 border-0 bg-white">
	     	<img src="../b01_img/user.PNG" class="user"><br>
	     	<h1><b>안녕하세요!</b></h1>
	     	<p>XXXX@email.com<p>
	     </div>
	     <div class="border-0 bg-white" style="margin-top:30px;"><a href="3002_input_Info.jsp" class="astyle">여행객 정보 입력</a></div><hr>
	     <div class="border-0 bg-white"><a href="3009_cardInfo_input.jsp" class="astyle">결제 정보 입력</a></div><hr>
	     <div class="border-0 bg-white"><a href="3004_show_Info.jsp" class="astyle">내 예약</a></div><hr>
	     <div class="border-0 bg-white"><a href="#" class="astyle">가격 변동 알림</a></div><hr>
	     <div class="border-0 bg-white">계정</div><hr>
	     <input class="btnOut" type="button" value="로그아웃" onclick="logout()"/>
	    </div>
	    <div class="col-2"></div>
	    <div class="col-5" style="font-size:25px;">
	    	<div class="p-3 border-0 bg-white" style="text-align:center;"><h1><b>내 예약</b></h1></div>
	     	<div class="p-3 border-0 bg-white">
	     		<label for="exampleFormControlInput1" class="form-label">예약번호</label>
  				<input type="text" name="reNum" class="field" id="exampleFormControlInput1" placeholder="예약 번호를 입력하세요">
  				<input id="search" class="btnSearch" type="button" value="검색" onclick="doDisplay()">	
  			</div>
  			<div class="p-3 border-0 bg-white"></div>
  			<div id="myDIV" style="display:none;" class="p-3 mt-5 border-0 bg-secondary bg-opacity-50">
  				<p style="font-size:15px;">예약번호:18739927&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;예약날짜:2022년 12월 14일</p>
  				<hr>
  				<h1><b>출발지 - 도착지</b></h1>
  				<div style="display:flex;">
				<div>
					<b>항공편명</b><br>
					<p style="margin-top:10px;">TW125</p>
				</div>
				<div style="margin-left:50px;">
					<b>출발 시간</b><br>
					<p style="margin-top:10px;">22년 12월 19일 08:45</p>
				</div>
				<div style="margin-left:50px;">
					<b>도착 시간</b><br>
					<p style="margin-top:10px;">22년 12월 19일 11:40</p>
				</div>
			</div>
			<div style="margin-top:20px;">
				<b>승객</b><br>
				<p style="margin-top:10px;">김길동,홍길동,신길동,최길동</p>
			</div>
			<br>
			<h1><b>출발지 - 도착지</b></h1>
  				<div style="display:flex;">
				<div>
					<b>항공편명</b><br>
					<p style="margin-top:10px;">VJ876</p>
				</div>
				<div style="margin-left:50px;">
					<b>출발 시간</b><br>
					<p style="margin-top:10px;">22년 12월 26일 15:20</p>
				</div>
				<div style="margin-left:50px;">
					<b>도착 시간</b><br>
					<p style="margin-top:10px;">22년 12월 26일 18:15</p>
				</div>
			</div>
			<div style="margin-top:20px;">
				<b>승객</b><br>
				<p style="margin-top:10px;">김길동,홍길동,신길동,최길동</p>
			</div>
			<div class="d-grid gap-2 d-md-flex justify-content-md-end">
			  <button style="float:right;background:steelblue;border:none;color:white;border-radius:12px;" class="btn me-md-2" onclick="window.open('3005_change_flight.jsp')">변경</button>
			  <button style="background:steelblue;border:none;color:white;border-radius:12px;" class="btn" onclick="window.open('3007_cancel_flight.jsp')">취소</button>
			</div>
  		</div>
  		<br>
  		<div class="d-grid gap-2 d-md-flex justify-content-md-end">
			<button style="width:10%;float:right;background:steelblue;border:none;color:white;border-radius:12px;" class="btn me-md-2" type="button">←</button>
			<button style="width:10%;background:steelblue;border:none;color:white;border-radius:12px;" class="btn" type="button">→</button>
		</div>
	    <div class="col-1"></div>
	  </div>
	</div>
	</div>
	<br><br>
<%@ include file="/0000_footer.html" %>
</body>
<script>
// 로그아웃
function logout(){
	confirm("로그아웃 하시겠습니까?")
}

var reNum = document.querySelector("[name=reNum]")
var searchOb = document.querySelector("#search")

// 예약번호 일치시 버튼 활성화
searchOb.disabled = true;
reNum.addEventListener("change", stateHandle);

function stateHandle() {
  if (reNum.value == '18739927') {
	 searchOb.disabled = false; 
  }else {
	 searchOb.disabled = true;
  }
}

// 검색 버튼 클릭시 예약내역 보이게
var bDisplay = true; 
function doDisplay(){ 	
    var con = document.getElementById("myDIV"); 	
    if(con.style.display=='none'){ 		
        con.style.display = 'block'; 	
    }else{ 		
        con.style.display = 'none'; 	
    } 
} 
</script>
</html>