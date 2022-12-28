<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"    
    import="jspexp.vo.*" 
  	import="jspexp.a13_database.*"
   %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/a00_com/a01_common.css" rel="stylesheet">
<style type="text/css">
.colFlex{
	display:flex;
	flex-direction:column;
}
.logo:hover, .signup:hover, .findId:hover, .findPw:hover{
	cursor:pointer;
}
.signup{
	font-size:x-small;
	margin:3% 30% 0 7%;
	color:#aaaaaa;
	width:20%;
}
.findId{
	font-size:x-small;
	margin:3% 2% 0 3%;
	color:#aaaaaa;
}
.findPw{
	font-size:x-small;
	margin:3% 0 0 2%;
	color:#aaaaaa;
}
</style>
<script>
/*

*/

</script>

</head>
<body>
	<div class="colFlex">
		<div style="margin:auto;"><img src="/b01_img/airplanet_logo.png" width="300px" height="120px" onclick="location.href='/a02_search/2000_main.jsp'" class="logo"/></div>
		<div><br></div>
		<div class="colFlex" style="margin:auto;border:1px solid steelblue;width:40%;height:430px;border-radius:10px;align-items:center;">
			<form style="width:60%;" name="signin" action="/a01_member/a03_signinCk.jsp" method="get">
				<!-- 아이디 -->
				<div style="width:100%;margin-top:60px;">
					<input type="text" name="email" placeholder="아이디 입력"/>
				</div>
				<div style="position:absolute;color:red;">
					<div class="idcontainer" style="font-size:xx-small;"></div>
				</div>
				<!-- 비밀번호 -->
				<div style="width:100%;margin-top:15px;">
					<input type="password" name="pass" placeholder="비밀번호 입력"/>
				</div>
				<div style="position:absolute;color:red;">
					<div class="pwcontainer" style="font-size:xx-small;"></div>
				</div>
				<!-- 아이디 저장 -->
				<div style="margin-top:2%;">
					<input type="checkbox" name="saveid"/>
					<span style="font-size:x-small;vertical-align:middle; ">아이디 저장</span>
				</div>
				<!-- 로그인 버튼 -->
				<div style="width:100%;margin-top:1%;">
					<input style="width:100%;background:steelblue" type="button" value="로그인" class="btn"/>
				</div>
			</form>
			<div style="margin-top:20px;width:60%"><hr color="steelblue"></div>
			<!-- 구글 버튼 -->
			<div style="width:60%;margin-top:10px">
				<input style="width:100%;border:1px solid Gainsboro;background:white;color:black;" type="button" value="Google 로그인"/>
				<div style="position:absolute;margin:9px 0 0 9px;">
					<img src="/b01_img/google.png" style="width:25px;height:25px;"/>
				</div>
			</div>
			<!-- 카카오 버튼 -->
			<div style="width:60%;margin-top:10px">
				<input style="width:100%;background:gold;color:black;" type="button" value="카카오 로그인"/>
				<div style="position:absolute;margin:9px 0 0 9px;">
					<img src="/b01_img/kakao.png" style="width:25px;height:25px;"/>
				</div>
			</div>
			<!-- 기타 기능 -->
			<div style="display:flex;width:60%;">
				<div class="signup" onclick="location.href='/a01_member/1001_signup.jsp'">회원가입</div>
				<div class="findId" onclick="''"><span>아이디찾기</span></div>
				<div style="margin-top:1%;"><hr style="height:50%;"></div>
				<div class="findPw" onclick="''"><span>비밀번호찾기</span></div>
			</div>
		</div>
	</div>
	<div id="footers" style="margin-top:8%"></div>
	
</body>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript">
var idOb = document.querySelector("[name=email]")
var idD = document.querySelector(".idcontainer")
var pwOb = document.querySelector("[name=pass]")
var pwD = document.querySelector(".pwcontainer")
var btnOb = document.querySelector(".btn")

idOb.onblur=function(){
	if(idOb.value!=""){
		idD.innerText=""
		idOb.style.borderColor="#cccccc"		
	}
}

idOb.onkeyup=function(){
	if(event.keyCode == 13){
		login()
	}
}
pwOb.onkeyup=function(){
	if(event.keyCode == 13){
		login()
	}
}

btnOb.onclick=login
	
function login(){
	if(idOb.value == ""){
		idOb.style.borderColor="red"
		idOb.focus();
		idD.innerText="아이디를 입력해주세요"
		return;
	}else if(idOb.value != "" && pwOb.value == ""){
		idD.innerText=""
		idOb.style.borderColor="#cccccc"
		pwOb.style.borderColor="red"
		pwOb.focus()
		pwD.innerText="비밀번호를 입력해주세요"
		return;
	}else{
		idD.innerText=""
		idOb.style.borderColor="#cccccc"
		pwD.innerText=""
		pwOb.style.borderColor="#cccccc"
		document.signin.submit();
		return;
	}
}
$("#footers").load("/a02_search/footer.html");


</script>
</html>