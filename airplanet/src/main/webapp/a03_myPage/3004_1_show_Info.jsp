<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"  
    import="dao.C_selectFare2"
    import="vo.FareAll"
   %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%-- jsp에서 substring 기능을 사용하기 위한 태그 선언 --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
<%@ include file="/header.jsp" %>
<br><br>
	<div class="container-fluid">
	  <div class="row no-gutters">
	  
	  	<div class="col-1"></div>
	  	
	    <div class="col-3" style="text-align:center;font-size:25px;">
	     <div class="p-3 border-0 bg-white">
	     	<img src="../b01_img/user.PNG" class="user"><br>
	     	<h1><b>안녕하세요!</b></h1>
	     	<p>${reg2.email}<p>
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
	     		<jsp:useBean id="dao" class="dao.C_selectFare2" scope="session"/>
	     		<jsp:useBean id="sch" class="vo.FareAll" scope="session"/>
				<jsp:setProperty property="*" name="sch"/>
				<form method="post">
  					<input type="text" class="field" id="exampleFormControlInput1" placeholder="예약 번호를 입력하세요" name="bookingReference" value="${sch.bookingReference}">
  					<input id="search" class="btnSearch" type="submit" value="검색" onclick="doDisplay()">	
  				</form>
  			</div>
  	
  			<div class="p-3 border-0 bg-white"></div>
  			<c:set var="fareData" value="${dao.getFareList(sch)}" scope="session"/>
  			<c:forEach var="fare" items="${fareData}">
  			<div id="myDIV" class="p-3 mt-5 border-0 bg-secondary bg-opacity-50">
  				<p style="font-size:15px;">예약번호:${fare.bookingReference}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;예약날짜:${fn:substring(fare.resDate,0,16)}</p>
  				<hr>
  				<h1><b>${fare.departAirport} - ${fare.arriveAirport}</b></h1>
  				<div style="display:flex;">
				<div>
					<b>항공편명</b><br>
					<p style="margin-top:10px;">${fare.flightNumber}</p>
				</div>
				
				<div style="margin-left:50px;">
					<b>출발 시간</b><br>
					<p style="margin-top:10px;">${fn:substring(fare.departDate,0,16)}</p>
				</div>
				<div style="width:120px;">
					<p style="font-size:20px"><b>--${fare.flightHours}시간 소요--></b></p><br>
				</div>
				
				<div style="margin-left:30px;">
					<b>도착 시간</b><br>
					<p style="margin-top:10px;">22년 12월 19일 11:40</p>
				</div>	
			</div>
			
			<div style="margin-top:20px;">
				<b>승객</b><br>
				<p style="margin-top:10px;">${fare.korname}</p>
			</div>
			
			<div class="d-grid gap-2 d-md-flex justify-content-md-end">
			  <button style="font-size:20px;width:150px;background:steelblue;border:none;color:white;border-radius:12px;" class="btn" onclick="window.open('3008_cancel_flight_input.jsp')">취소</button>
			</div>
			</div>
			</c:forEach>
			<form action="3008_1_cancel_flight_input.jsp" method="post">
				
			</form>
  		</div> 
  	
  		<br>
  		<div class="d-grid gap-2 d-md-flex justify-content-md-end"></div>
		
	    <div class="col-1"></div>
	    
	  </div>
	</div>
	<br><br>

<%@ include file="/0000_footer.html" %>
</body>
<script>
// 로그아웃
var regId ='${reg2.email}';
function logout(){
	if(confirm("로그아웃하시겠습니까?")){
		location.href="/a01_member/1400_signout.jsp"
     }
}

var bookingReference = document.querySelector("[name=bookingReference]")
var searchOb = document.querySelector("#search")
var changeOb = document.querySelector("#change")

// 예약번호 일치시 버튼 활성화
searchOb.disabled = true;
bookingReference.addEventListener("change", stateHandle);

function stateHandle() {
  if (bookingReference.value == ${fare.bookingReference}) {
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