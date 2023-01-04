<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 메인</title>
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
.btnInsert{
	width:50%;
	height:50px;
	float:left;
	background:steelblue;
	color:white;
	border:none;
	border-radius: 12px;
}
</style>
<body>
	<div class="container-fluid">
	<%@ include file="/header.jsp" %>
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
	    	<div class="p-3 border-0 bg-white" style="text-align:center;"><h1><b>계정</b></h1></div><br>
	     	<div class="p-3 border-0 bg-secondary bg-opacity-50">일반정보</div>
	     	<div class="p-3 border-0 bg-white"><p style="font-size:15px">이메일</p>${reg2.email}</div>
	     	<div class="p-3 border-0 bg-secondary bg-opacity-50">구독</div>
	     	<div class="p-3 border-0 bg-white">
	     		<input style="zoom:2.0;" type="checkbox" name="sub">
					최신 여행 상품, 소식, 인기 여행지에 대해 제 메일함으로 직접 안내 받고싶어요.
			</div>
			<hr>
	     	<div class="p-3 border-0 bg-white"><h3><b>선호하는 출발 공항</b></h3>
	     	가장 적합한 특가 상품과 추천 여행지를 보여드릴 수 있도록 선호하는 공항을 추가하세요
	     	</div>
	     	<div class="p-3 border-0 bg-white">
	     		<p style="font-size:15px">출발공항(최대 6곳)</p>
	     		<input class="btnInsert" type="button" value="공항 추가하기"/>
	     	</div>
	     	<hr style="margin-top:50px;">
	     	<div class="p-3 border-0 bg-secondary bg-opacity-50" style="text-align:float;">계정</div>
	     	<div class="p-3 border-0 bg-white"><a href="#" class="astyle">데이터 다운로드</a></div>
	     	<hr>
	     	<div class="p-3 border-0 bg-white"><a href="#" class="astyle">계정 삭제</a></div>
	    </div>
	    <div class="col-1"></div>
	  </div>
	</div>
	<br><br>
<%@ include file="/0000_footer.html" %>
</body>
<script>
var regId ='${reg2.email}';
function logout(){
	if(confirm("로그아웃하시겠습니까?")){
		location.href="/a01_member/1400_signout.jsp"
     }
}
</script>
</html>