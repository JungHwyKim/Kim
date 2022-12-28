<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
   %>
<link href="/bs-custom.css" rel="stylesheet">
<style>
header{
	margin-bottom: 50px;
}
</style>
<header id="header" class="d-flex justify-content-between">
	
		<div style="margin:5px 0 0 0px;"><img src="/b01_img/airplanet_logo.png" width="100%" height="70px"/></div>
		<div style="margin:20px 0 0 45%;">
			<input style="width:120px;height:50px;background:lightblue;border-radius:10px;border:none;font-size:medium;font-weight:700;color:white;margin-right:20px;" type="button" name="signup" value="회원가입" />
			<input style="width:120px;height:50px;background:lightblue;border-radius:10px;border:none;font-size:medium;font-weight:700;color:white;" type="button" name="signin" value="로그인" />
		</div>
</header>


<script>
var signup=document.querySelector('[name=signup]')
signup.onclick=function(){
	location.href="/a01_member/1001_signup.jsp";
}
var signinout=document.querySelector('[name=signin]')

var regId='${reg2.email}'
if(regId==''){	//로그인 안했을때
	alert('로그인안함 ${reg2.email}')
	signup.style.display="";
	signinout.value="로그인"
	signinout.onclick=function(){location.href="/a01_member/1002_signin.jsp"}
}else{
	alert('로그인했을때 ${reg2.email}')
	signup.style.display="none";
	signinout.value="로그아웃"
	signinout.onclick=function(){location.href="/a01_member/1400_signout.jsp"}
}


</script>