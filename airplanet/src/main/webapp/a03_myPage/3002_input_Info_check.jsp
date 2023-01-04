<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"  
    import="vo.MyPassengerInfo"
    import="dao.C_insertPassengerInfo"
   %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="UTF-8" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보 입력 완료</title>
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
</style>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");

String email = request.getParameter("email");
String korname = request.getParameter("korname");
String engsur = request.getParameter("engsur");       
String engname = request.getParameter("engname");       
String birthday = request.getParameter("birthday");       
String mf = request.getParameter("mf");       
String ppnumber = request.getParameter("ppnumber");       
String ppexpire = request.getParameter("ppexpire");       
String nation = request.getParameter("nation");       
String ppnation = request.getParameter("ppnation");

MyPassengerInfo mlist = new MyPassengerInfo();
mlist.setEmail(email);
mlist.setKorname(korname);
mlist.setEngsur(engsur);
mlist.setEngname(engname);
mlist.setBirthday(birthday);
mlist.setMf(mf);
mlist.setPpnumber(ppnumber);
mlist.setPpexpire(ppexpire);
mlist.setNation(nation);
mlist.setPpnation(ppnation);

C_insertPassengerInfo dao = new C_insertPassengerInfo();
dao.insertMyPassengerInfo(mlist);

%>
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
	    	<br><br><br><br><br><br><br>
	    	<h2 style="float:center;font-weight:bold;"><img src="../b01_img/user.PNG" style="width:100px;height:70px;"><%=mlist.getKorname() %>님</h2>
	    	<h2 style="float:center">정보가 정상적으로 저장되었습니다 !</h2>
	    <div class="col-1"></div>
	  </div>
	</div>
	</div>
	<br><br>
<%@ include file="/0000_footer.html" %>

</body>
<script>
//로그아웃
var regId ='${reg2.email}';
function logout(){
	if(confirm("로그아웃하시겠습니까?")){
		location.href="/a01_member/1400_signout.jsp"
     }
}

</script>
</html>